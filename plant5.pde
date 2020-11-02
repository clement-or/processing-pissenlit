public class Plant5 extends RenderedObject {

  float top_rightY = 500;    // bout de la fleur 
  float stem_speed = 5;      // vitesse de pousse de la tige

  float flower_timer = 0;    // init
  float flower_speed = 0.05; // vitesse de pousse des fleurs
  float r_flwr1 = 0;         // init rayons des cercles pour chaque fleur
  float r_flwr2 = 0;
  float r_flwr3 = 0;
  float r_flwr4 = 0;

  int hauteur_tige = (int) random(50, 300);
  int deg1 = 90;
  int deg2 = 90;
  float angle1 = radians(deg1);
  float angle2 = radians(deg2);
  int diametre_x = 200;
  int diametre_y = 150;

  Plant5(float pos_x, float pos_y) {
    super();
    position.x = pos_x;
    position.y = pos_y;
    sop = new SeedOnPlant(0, 0, 0, 0);
  }

  SeedOnPlant sop;

  public void draw() {

    flower_timer += flower_speed;  // les boules poussent à vitesse croissante


    smooth();
    strokeWeight(3);
    stroke(noir);
    line(renderedPosition.x, renderedPosition.y, renderedPosition.x, top_rightY);
    noStroke();

    fill(noir);
    angle1 = radians(deg1);
    angle2 = radians(deg2);
    arc(renderedPosition.x, hauteur_tige - 70, diametre_x, diametre_y, angle1, angle2, CHORD);

    fill(rouge);
    //circle(renderedPosition.x, hauteur_tige - 32, r_flwr4);
    sop.position.x = position.x;
    sop.position.y = hauteur_tige - 32;
    sop.size = r_flwr4;
    sop.max_size = 20;

    /*println("hauteur_tige :", hauteur_tige);
     println("top_rightY :", top_rightY);
     println("deg1 :", deg1);*/

    if (top_rightY > hauteur_tige) {     // croissance de la tige
      top_rightY -= stem_speed;
    }

    if ((top_rightY < hauteur_tige + 54) && ( deg1 > 45)) {
      deg1 -= 2;
      deg2 += 2;
    }

    if ((deg1 == 44) && (r_flwr4 < 20)) {
      r_flwr4 += 10;
      r_flwr4 = constrain(r_flwr4, 0, 20);
    }
  }
}
