public class Seed extends RenderedObject {

  float gravity = random(1.7,2.2);    // vitesse de chute
  float size = random(5, 10);      // rayon de la graine
  float vol;        // analyse de l'amplitude stockée dans vol
  float push_ratio_x = random(1500, 2000); // ratio arbitraire qui gère la poussée du souffle
  float push_ratio_y = random(1000, 1200);
  boolean is_planted = false; // Est-ce que la graine a été plantée ?
  float player_blow_intensity = 0.15;

  Seed(float pos_x, float pos_y) {
    super();
    position.x = pos_x;
    position.y = pos_y;
  }

  private void physics() {
    vol = amp.analyze();

    // Si graine au-dessus du sol, elle descend
    if (position.y < height-niv_sol+size) {    
      position.y += gravity;
      position.x += push_ratio_x * vol;
      position.y -= push_ratio_y * vol;
    }

    if (position.y >= height-niv_sol+size && !is_planted) {   // si touche sol, la plante pousse
      is_planted = true;
      createRandomPlant(position.x, position.y);
    }
  }

  public void draw() {
    // Si la graine a déjà été plantée, on ne fait rien
    if (is_planted) return;

    // D'abord on calcule la physique
    physics();

    // Après, on affiche la graine
    fill(noir);
    noStroke();
    circle(renderedPosition.x, renderedPosition.y, size);   // dessin graine
  }
}
