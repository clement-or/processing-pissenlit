PImage petale_start;
PImage petale_start_mirror;

public class Plant_start extends RenderedObject {

  float top_rightY = 500;    // bout de la fleur 
  float stem_speed = 3;      // vitesse de pousse de la tige

  float img_petale_width = 66/2; // dimension X fichier png des pétales
  float img_petale_height = 379/2; // dimension Y fichier png des pétales

  float flower_timer = 0; // timer pour animer la taille des pétales en fonction du temps
  float flower_timer2 = 0; // timer pour animer la pousse des graines au sommet
  float flower_speed = 0.05; // vitesse de pousse des fleurs

  float r_flwr1; // rayon de la graine rouge
  float r_flwr2; // rayon de la graine noire

  float angle_petale_gauche = 30;
  float angle_petale_droite = -30;
  float angle_d;
  float angle_g;

  boolean anim_grow_shrink;
  float angle1=0;
  float angle2=0;
  float da=0.05; // valeur augmentation des angles par frame
  float radius_seed1;
  float radius_seed2;

  int min_r_seed1 = 20;
  int max_r_seed1 = 30;

  float petal_scale_x; // scaling X de la pétale de droite
  float petal_scale_y; // scaling Y de la pétale de droite
  float petal_scale_x_mirror; // scaling X de la pétale de gauche
  float petal_scale_y_mirror; // scaling Y de la pétale de gauche
  
  SeedOnPlant seedOnPlant;

  boolean open = false; // quand open = true, la fleur s'ouvre
  

  Plant_start(float pos_x, float pos_y) {
    super();
    position.x = pos_x;
    position.y = pos_y;
    petale_start = loadImage("petale_start.png");
    petale_start_mirror = loadImage("petale_start_mirror.png");
    
    seedOnPlant = new SeedOnPlant(0, 0, 0);
  }

  public void draw() {

    smooth();
    strokeWeight(3);
    stroke(0);
    line(renderedPosition.x, height-niv_sol, renderedPosition.x, top_rightY); // dessin de la tige, top_rightY évolue dans le temps
    flower_timer += flower_speed;

    noStroke();

    fill(noir);
    circle(renderedPosition.x, 180, r_flwr2); // dessin de la graine noire

    seedOnPlant.position.x = position.x;
    seedOnPlant.position.y = 180;
    seedOnPlant.size = radius_seed1;
    
    






    // Animation de l'ouverture des pétales

    // affichage du pétale de droite
    imageMode(CORNERS);
    pushMatrix();
    translate(renderedPosition.x, 300);
    rotate(angle_g);
    image(petale_start, -1, -1, petal_scale_x, petal_scale_y);
    //image(petale_start, -1, -1, img_petale_width, -img_petale_height);
    //img_petale_width = 66/2
    //img_petale_height = 379/2
    popMatrix();

    // affichage du pétale de gauche
    pushMatrix();
    translate(renderedPosition.x, 300);
    rotate(angle_d);
    image(petale_start_mirror, 0, 0, petal_scale_x_mirror, petal_scale_y_mirror);
    //image(petale_start_mirror, 0, 0, -img_petale_width, -img_petale_height);
    popMatrix();

    // variation des angles g et d pour animer les pétales
    if (open) {
      flower_timer2 += flower_speed;
      if (angle_g < 2) {
        angle_g = (flower_timer2/2)*radians(angle_petale_gauche);
      }

      if (angle_d > -2) {
        angle_d = (flower_timer2/2)*radians(angle_petale_droite);
      }
    }

    int m = millis();

    if (m >= 7000) { // Ouverture de la fleur d'intro après 7 secondes de jeu
      open = true;
    }

    if (top_rightY > 200) { // tant que la hauteur de la tige n'atteint pas y = 200, pousse de la tige
      top_rightY -= stem_speed;
    }

    if (top_rightY <= 200) {
      top_rightY = 200;
    }


    if (top_rightY == 200) { // animation des graines au sommet une fois la tige à hauteur maximale
      top_rightY = 200;
      //anim_grow_shrink = true;
      if (r_flwr1 <= 25) {
        r_flwr1 += 0.6;
      }

      if (r_flwr2 <= 50) {
        r_flwr2 += 0.9;
      }
    }

    if (anim_grow_shrink == true) { // animation de clignotement de la graine rouge
      radius_seed1 = map(sin(angle1), -1, 1, min_r_seed1, max_r_seed1);
    }

    angle1 +=da;

    // Animation de pousse des pétales (de scale = 0 à état fermé)
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

    if ((petal_scale_y_mirror <= -img_petale_height) & (petal_scale_y <= -img_petale_height)) { // déclenchement du clignotement de la graine rouge
      anim_grow_shrink = true;
    }
  }
}
