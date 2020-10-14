PImage petale_start;
PImage petale_start_mirror;

public class Plant_start extends RenderedObject {

  Plant_start(int pos_x, int pos_y) {
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

  float angle_petale_gauche;
  float angle_petale_droite;

  public void draw() {

    flower_timer += flower_speed;

    smooth();
    strokeWeight(3);
    stroke(0);
    line(renderedPosition.x, height-niv_sol, renderedPosition.x, top_rightY);


    noStroke();
    fill(noir);
    circle(renderedPosition.x, 180, r_flwr2);

    fill(rouge);
    circle(renderedPosition.x, 180, r_flwr1);

    imageMode(CORNERS);
    //image(petale_start_mirror, renderedPosition.x+1, 300, renderedPosition.x-img_petale_width, 300-img_petale_height);

    //rotate(flower_timer);
    //translate(-petale_start.width/2, -petale_start.height/2);
    
    
    if (flower_timer < 10) {
      translate(600, 300);
      rotate(flower_timer/2*-PI/3.0);
      image(petale_start, 0, img_petale_height, img_petale_width, 0);
      
    }
    
    //if (flower_timer >= 10) {
     // image(petale_start_mirror, renderedPosition.x+1, 300, renderedPosition.x-img_petale_width, 300-img_petale_height);
      //image(petale_start, renderedPosition.x, 300, renderedPosition.x+img_petale_width, 300-img_petale_height);
      
    //}
    




    top_rightY = 200;
  }
}
