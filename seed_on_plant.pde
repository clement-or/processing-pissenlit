public class SeedOnPlant extends RenderedObject {

  public float rayon;

  float gravity = 5;      // vitesse de chute
  float size = 0;         // rayon de la graine
  float max_size = 25;

  boolean hasBeenBlown = false; // Est-ce que la graine a été soufflée dessus ?
  int amount = 0;
  int maxSeeds = 10;
  int minSeeds = 5;

  color seed_on_plant = lerpColor(rouge, noir, amount);

  SeedOnPlant(float pos_x, float pos_y, float r_seed, float r_max_seed) {
    super();
    position.x = pos_x;
    position.y = pos_y;
    this.size = r_seed;
    this.max_size = r_max_seed;
  }

  private void physics() {
    hasBeenBlown = Mic.isBlowing() || hasBeenBlown;
  }

  public void draw() {

    if ((hasBeenBlown == true) && (size >= max_size)) {
      if (amount <= 80 && amount%10 == 0) {
        new Seed(position.x, position.y);
      }

      amount += 1;
      seed_on_plant = lerpColor(rouge, noir, amount * 0.002);
    }

    // D'abord on calcule la physique
    physics();

    if (size < max_size) {
      size += 0.2;
    }
    // Après, on affiche la graine
    fill(seed_on_plant);
    noStroke();
    circle(renderedPosition.x, renderedPosition.y, size);
  }
}
