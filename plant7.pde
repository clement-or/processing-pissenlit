public class Plant7 extends RenderedObject {

  PImage plant7_petale = loadImage("plant7_petale.png");

  float top_rightY = 500;    // bout de la fleur 
  float stem_speed = 3;      // vitesse de pousse de la tige
  float r_flwr1 = 0;


  float flower_timer = 0;    // init
  float flower_speed = 0.05; // vitesse de pousse des fleurs

  float img_petale_width = 385/3.2; // dimension X fichier png des pétales
  float img_petale_height = 88/3.2; // dimension Y fichier png des pétales

  float offset_y = 5;
  float hauteur_couple_petales1 = 390;
  float hauteur_couple_petales2 = 330;
  float hauteur_couple_petales3 = 280;

  int hauteur_tige = 240;
  //int deg1 = 90;
  //int deg2 = 90;
  //float angle1 = radians(deg1);
  //float angle2 = radians(deg2);


  Plant7(float pos_x, float pos_y) {
    super();
    position.x = pos_x;
    position.y = pos_y;
    sop = new SeedOnPlant(0, 0, 0, 0);
  }

  SeedOnPlant sop;

  // définition 1er couple de pétales
  float diametre_left_petal1_x = renderedPosition.x;
  float diametre_left_petal1_y = hauteur_couple_petales1;

  float diametre_right_petal1_x = renderedPosition.x;
  float diametre_right_petal1_y = hauteur_couple_petales1;

  // définition 2e couple de pétales
  float diametre_left_petal2_x = renderedPosition.x;
  float diametre_left_petal2_y = hauteur_couple_petales2;

  float diametre_right_petal2_x = renderedPosition.x;
  float diametre_right_petal2_y = hauteur_couple_petales2;

  // définition 3e couple de pétales
  float diametre_left_petal3_x = renderedPosition.x;
  float diametre_left_petal3_y = hauteur_couple_petales3;

  float diametre_right_petal3_x = renderedPosition.x;
  float diametre_right_petal3_y = hauteur_couple_petales3;


  public void draw() {

    flower_timer += flower_speed;  // les boules poussent à vitesse croissante

    smooth();
    strokeWeight(3);
    stroke(noir);
    // dessin de la tige
    line(renderedPosition.x, renderedPosition.y, renderedPosition.x, top_rightY);
    noStroke();

    fill(rouge);
    //circle(renderedPosition.x, hauteur_tige - 32, r_flwr4);
    sop.position.x = position.x;
    sop.position.y = 240;
    sop.size = r_flwr1;
    sop.max_size = 18;

    if (top_rightY > hauteur_tige) {     // croissance de la tige
      top_rightY -= stem_speed;
    }

    if ((top_rightY <= hauteur_tige+10) & (r_flwr1 <= 18)) {  
      r_flwr1 += 1;
    }

    if ((top_rightY < hauteur_couple_petales1) & (diametre_left_petal1_x >= -img_petale_width)) {
      diametre_left_petal1_x -= flower_timer;
      diametre_left_petal1_y += flower_timer/5;
    }

    if ((top_rightY < hauteur_couple_petales1) & (diametre_right_petal1_x <= img_petale_width)) {
      diametre_right_petal1_x += flower_timer;
      diametre_right_petal1_y += flower_timer/5;
    }

    if ((top_rightY < hauteur_couple_petales2) & (diametre_left_petal2_x >= -img_petale_width/1.5)) {
      diametre_left_petal2_x -= flower_timer;
      diametre_left_petal2_y += flower_timer/5;
    }

    if ((top_rightY < hauteur_couple_petales2) & (diametre_right_petal2_x <= img_petale_width/1.5)) {
      diametre_right_petal2_x += flower_timer;
      diametre_right_petal2_y += flower_timer/5;
    }
    
    if ((top_rightY < hauteur_couple_petales3) & (diametre_left_petal3_x >= -img_petale_width/2.5)) {
      diametre_left_petal3_x -= flower_timer;
      diametre_left_petal3_y += flower_timer/5;
    }

    if ((top_rightY < hauteur_couple_petales3) & (diametre_right_petal3_x <= img_petale_width/2.5)) {
      diametre_right_petal3_x += flower_timer;
      diametre_right_petal3_y += flower_timer/5;
    }

    imageMode(CORNERS); // affichage des pétales qui ont pour points d'ancrage leur coin en bas à gauche/droite pour donner une meilleure animation
    image(plant7_petale, renderedPosition.x, hauteur_couple_petales1, renderedPosition.x+diametre_left_petal1_x, diametre_left_petal1_y);
    image(plant7_petale, renderedPosition.x, hauteur_couple_petales1, renderedPosition.x+diametre_right_petal1_x, diametre_right_petal1_y);
    image(plant7_petale, renderedPosition.x, hauteur_couple_petales2, renderedPosition.x+diametre_left_petal2_x, diametre_left_petal2_y);
    image(plant7_petale, renderedPosition.x, hauteur_couple_petales2, renderedPosition.x+diametre_right_petal2_x, diametre_right_petal2_y);
    image(plant7_petale, renderedPosition.x, hauteur_couple_petales3, renderedPosition.x+diametre_left_petal3_x, diametre_left_petal3_y);
    image(plant7_petale, renderedPosition.x, hauteur_couple_petales3, renderedPosition.x+diametre_right_petal3_x, diametre_right_petal3_y);
  }
}
