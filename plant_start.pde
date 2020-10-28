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

  float flower_timer = 0;    // init
  float flower_speed = 0.05; // vitesse de pousse des fleurs

  float r_flwr1 = 25;
  float r_flwr2 = 50;

  float angle_petale_gauche = 30;
  float angle_petale_droite = -30;
  float angle_d;
  float angle_g;

  int m = millis();
  boolean open = false;

  public void draw() {

    smooth();
    strokeWeight(3);
    stroke(0);
    line(renderedPosition.x, height-niv_sol, renderedPosition.x, top_rightY);


    noStroke();
    fill(noir);
    circle(renderedPosition.x, 180, r_flwr2);

    fill(rouge);
    circle(renderedPosition.x, 180, r_flwr1);

    //println("angle_g :", angle_g);
    //println("angle_d :", angle_d);

    // ouverture pétales


    if (open) {
      flower_timer += flower_speed;
      if (angle_g < 2) {
        angle_g = flower_timer/1.8*radians(angle_petale_gauche);
      }

      if (angle_d > -1.9) {
        angle_d = flower_timer/2*radians(angle_petale_droite);
      }
    }



    //println("m : ",m);
    m = millis();
    if (m > 3000) {
      open = true;
    }

    imageMode(CORNERS);

    pushMatrix();
    translate(renderedPosition.x, 300);
    rotate(angle_g);
    image(petale_start, -1, -1, img_petale_width, -img_petale_height);
    popMatrix();

    pushMatrix();
    translate(renderedPosition.x, 300);
    rotate(angle_d);
    image(petale_start_mirror, 0, 0, -img_petale_width, -img_petale_height);
    popMatrix();

    top_rightY = 200;
  }
}