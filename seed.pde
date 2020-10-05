public class seed {

  float gravity = 5;    // vitesse de chute
  float size = 10;      // rayon de la graine
  float pos_x = 600;    // coordonnées graine
  float pos_y = 100;

public void fall() {
   fill(noir);
   noStroke();
   circle(pos_x, pos_y, size);   // dessin graine
   
  if (pos_y < niv_sol+size) {    // si graine au-dessus du sol, elle descend
    pos_y += gravity;
  } 
  if (pos_y >= niv_sol+size) {   // si touche sol, la plante pousse
    plant_1.growth();
    plant_2.growth();
    plant_3.growth();
  }

}
}
