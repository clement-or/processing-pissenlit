public class Seed {

  float gravity = 5;    // vitesse de chute
  float size = 10;      // rayon de la graine
  float pos_x = 600;    // coordonnées graine
  float pos_y = 100;
  float vol;        // analyse de l'amplitude stockée dans vol
  float push_ratio_x = 50; // ratio arbitraire qui gère la poussée du souffle
  float push_ratio_y = 50;

public void fall() {
  vol = amp.analyze();
  fill(noir);
  noStroke();
  circle(pos_x, pos_y, size);   // dessin graine
   
  if (pos_y < height-niv_sol+size) {    // si graine au-dessus du sol, elle descend
    pos_y += gravity;
    pos_x += push_ratio_x * vol;
    pos_y -= push_ratio_y * vol;
  } 
  if (pos_y >= height-niv_sol+size) {   // si touche sol, la plante pousse

    plant_2.growth();
  }

}
}
