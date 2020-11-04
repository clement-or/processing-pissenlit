public class SeedOnPlant extends RenderedObject {

  public float rayon;

  float gravity = 5;      // vitesse de chute
  float size = 0;         // rayon de la graine
  float max_size = 25;
  float vol;              // analyse de l'amplitude stockée dans vol

  boolean is_blowed = false; // Est-ce que la graine a été soufflée dessus ?
  float player_blow_intensity = 0.15;
  float amount = 0;

  color seed_on_plant = lerpColor(rouge, noir, amount);

  SeedOnPlant(float pos_x, float pos_y, float r_seed, float r_max_seed) {
    super();
    position.x = pos_x;
    position.y = pos_y;
    this.size = r_seed;
    this.max_size = r_max_seed;
  }

  private void physics() {

    vol = amp.analyze();

    if (vol*50 > player_blow_intensity) {    
      is_blowed = true;
    }

    if (vol*50 < player_blow_intensity) {    
      is_blowed = false;
    }
  }

  public void draw() {

    if ((is_blowed == true) && (size >= max_size)) {
      if ((amount >= 0.09) & (amount <= 0.1)) {
        new Seed(position.x, position.y);
      }

      if ((amount >= 0.19) & (amount <= 0.2)) {
        new Seed(position.x, position.y);
      }

      if ((amount >= 0.29) & (amount <= 0.3)) {
        new Seed(position.x, position.y);
      }

      if ((amount >= 0.39) & (amount <= 0.4)) {
        new Seed(position.x, position.y);
      }

      if ((amount >= 0.49) & (amount <= 0.5)) {
        new Seed(position.x, position.y);
      }

      if ((amount >= 0.59) & (amount <= 0.6)) {
        new Seed(position.x, position.y);
      }

      if ((amount >= 0.69) & (amount <= 0.7)) {
        new Seed(position.x, position.y);
      }

      if ((amount >= 0.79) & (amount <= 0.8)) {
        Seed graineFertile = new Seed(position.x, position.y);
        graineFertile.isFertile = true;
      }

      amount += 0.02;
      seed_on_plant = lerpColor(rouge, noir, amount);
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