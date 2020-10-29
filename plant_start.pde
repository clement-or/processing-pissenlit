PImage petale_start;
PImage petale_start_mirror;

public class Plant_start extends RenderedObject {

  Plant_start(float pos_x, float pos_y) {
    super();
    position.x = pos_x;
    position.y = pos_y;
    petale_start = loadImage("petale_start.png");
    petale_start_mirror = loadImage("petale_start_mirror.png");
  }

  float top_rightY = 500;    // bout de la fleur 
  float stem_speed = 3;      // vitesse de pousse de la tige

  float img_petale_width = 66/2; // dimension X fichier png des pétales
  float img_petale_height = 379/2; // dimension Y fichier png des pétales

  float flower_timer = 0;
  float flower_timer2 = 0;
  float flower_speed = 0.05; // vitesse de pousse des fleurs

  float r_flwr1;
  float r_flwr2;

  float angle_petale_gauche = 30;
  float angle_petale_droite = -30;
  float angle_d;
  float angle_g;

  float petal_scale_x;
  float petal_scale_y;
  float petal_scale_x_mirror;
  float petal_scale_y_mirror;

  boolean open = false;

  public void draw() {

    smooth();
    strokeWeight(3);
    stroke(0);
    line(renderedPosition.x, height-niv_sol, renderedPosition.x, top_rightY);
    flower_timer += flower_speed;



    noStroke();
    fill(noir);
    circle(renderedPosition.x, 180, r_flwr2);

    fill(rouge);
    circle(renderedPosition.x, 180, r_flwr1);
    
    // ouverture pétales

    imageMode(CORNERS);

    pushMatrix();
    translate(renderedPosition.x, 300);
    rotate(angle_g);
    image(petale_start, -1, -1, petal_scale_x, petal_scale_y);
    //image(petale_start, -1, -1, img_petale_width, -img_petale_height);
    //img_petale_width = 66/2
    //img_petale_height = 379/2
    popMatrix();

    pushMatrix();
    translate(renderedPosition.x, 300);
    rotate(angle_d);
    image(petale_start_mirror, 0, 0, petal_scale_x_mirror, petal_scale_y_mirror);
    //image(petale_start_mirror, 0, 0, -img_petale_width, -img_petale_height);
    popMatrix();

    

    int m = millis();
    println(m);
    println("flower timer :", flower_timer);

    if (m >= 7000) {
      open = true;
    }

    if (top_rightY > 200) { // à partir d'une certaine hauteur de tige, création des pétales et apparition des racines
      top_rightY -= stem_speed;
    }

    if (top_rightY <= 200) { // à partir d'une certaine hauteur de tige, création des pétales et apparition des racines
      top_rightY = 200;
    }


    if (top_rightY == 200) { // à partir d'une certaine hauteur de tige, création des pétales et apparition des racines
      top_rightY = 200;
      if (r_flwr1 <= 25){
        r_flwr1 += 0.6;
      }
      
      if (r_flwr2 <= 50){
        r_flwr2 += 0.9;
      }
    }

    // Animation de pousse des pétales (état fermé)
    if ((top_rightY < 310) & (petal_scale_x <= img_petale_width)) {
      petal_scale_x += flower_timer/8;
    }

    if ((top_rightY < 310) & (petal_scale_y >= -img_petale_height)) {
      petal_scale_y -= flower_timer/1.3;
    }

    if ((top_rightY < 310) & (petal_scale_x_mirror >= -img_petale_width)) {
      petal_scale_x_mirror -= flower_timer/8;
    }

    if ((top_rightY < 310) & (petal_scale_y_mirror >= -img_petale_height)) {
      petal_scale_y_mirror -= flower_timer/1.3;
    }

    // Animation d'ouverture des pétales
    if (open) {
      flower_timer2 += flower_speed;
      if (angle_g < 2) {
        angle_g = (flower_timer2/2)*radians(angle_petale_gauche);
      }

      if (angle_d > -2) {
        angle_d = (flower_timer2/2)*radians(angle_petale_droite);
      }
    }
  }
}
