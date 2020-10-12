public class Plant1 extends RenderedObject {

  Plant1(int pos_x, int pos_y) {
    super();
    position.x = pos_x;
    position.y = pos_y;
  }

  float Xaxis = 600;         // coordonnées X de la tige de la fleur
  float top_rightY = 500;    // bout de la fleur 
  float stem_speed = 3;      // vitesse de pousse de la tige

  float flower_timer = 0;    // init
  float flower_speed = 0.05; // vitesse de pousse des fleurs
  float r_flwr1 = 0;         // rayons des cercles pour chaque fleur
  float r_flwr2 = 0;
  float r_flwr3 = 0;
  float r_flwr4 = 0;

  // Racines au format courbe de bézier
  // soit : Racine 1 = root1(root1_x1, root1_y1, root1_x2, root1_y2, root1_x3, root1_y3, root1_x4, root1_y4)
  // Racine 2 = root2(root2_x1, root2_y1, root2_x2, root2_y2, root2_x3, root2_y3, root2_x4, root2_y4), ...
  float root1_x1 = renderedPosition.x;
  float root1_x2 = renderedPosition.x+60;
  float root1_x3 = renderedPosition.x+50;
  float root1_x4 = renderedPosition.x+50;

  float root1_y1 = random(150, 200);
  float root1_y2;
  float root1_y3;
  float root1_y4 = 100;

  float root2_x1 = renderedPosition.x-(root1_x1-renderedPosition.x);
  float root2_x2 = renderedPosition.x-(root1_x2-renderedPosition.x);
  float root2_x3 = renderedPosition.x-(root1_x3-renderedPosition.x);
  float root2_x4 = renderedPosition.x-(root1_x4-renderedPosition.x);

  float root2_y1 = random(150, 200);
  float root2_y2;
  float root2_y3;
  float root2_y4 = 100;

  float root3_x1 = renderedPosition.x+51;
  float root3_x2 = renderedPosition.x+81;
  float root3_x3 = renderedPosition.x+76;
  float root3_x4 = renderedPosition.x+76;

  float root3_y1 = random(120, 140);
  float root3_y2;
  float root3_y3;
  float root3_y4 = 100;

  float root4_x1 = renderedPosition.x-(root3_x1-renderedPosition.x);
  float root4_x2 = renderedPosition.x-(root3_x2-renderedPosition.x);
  float root4_x3 = renderedPosition.x-(root3_x3-renderedPosition.x);
  float root4_x4 = renderedPosition.x-(root3_x4-renderedPosition.x);

  float root4_y1 = random(120, 140);
  float root4_y2;
  float root4_y3;
  float root4_y4 = 100;

  int n_roots = (int) random(1, 5);

  int opacity1 = 0;
  int opacity2 = 0;
  int opacity3 = 0;
  int opacity4 = 0;

  // 
  // 
  // 

  public void draw() {

    flower_timer += flower_speed;

    //println("root1_x1 : ", root1_x1);
    //println("root2_x1 : ", root2_x1);
    //println("root3_x1 : ", root3_x1);
    //println("root4_x1 : ", root4_x1);
    //println("position.x : ", renderedPosition.x);

    // update position des racines en x dans le temps, suivant la caméra
    root1_x1 = renderedPosition.x;
    root1_x2 = renderedPosition.x+60;
    root1_x3 = renderedPosition.x+50;
    root1_x4 = renderedPosition.x+50;

    root2_x1 = renderedPosition.x-(root1_x1-renderedPosition.x);
    root2_x2 = renderedPosition.x-(root1_x2-renderedPosition.x);
    root2_x3 = renderedPosition.x-(root1_x3-renderedPosition.x);
    root2_x4 = renderedPosition.x-(root1_x4-renderedPosition.x);

    root3_x1 = renderedPosition.x+51;
    root3_x2 = renderedPosition.x+81;
    root3_x3 = renderedPosition.x+76;
    root3_x4 = renderedPosition.x+76;

    root4_x1 = renderedPosition.x-(root3_x1-renderedPosition.x);
    root4_x2 = renderedPosition.x-(root3_x2-renderedPosition.x);
    root4_x3 = renderedPosition.x-(root3_x3-renderedPosition.x);
    root4_x4 = renderedPosition.x-(root3_x4-renderedPosition.x);

    smooth();
    strokeWeight(3);
    stroke(0);
    line(renderedPosition.x, height-niv_sol, renderedPosition.x, top_rightY);
    noStroke();

    fill(noir);
    circle(renderedPosition.x+27, 360, r_flwr1);
    circle(renderedPosition.x-27, 300, r_flwr2);
    circle(renderedPosition.x+27, 240, r_flwr3);

    fill(rouge);
    circle(renderedPosition.x, 180, r_flwr4);

    if (top_rightY > 170) { // à partir d'une certaine hauteur de tige, création des pétales et apparition des racines
      if ((top_rightY < 425) && (r_flwr1 < 50)) {
        r_flwr1 += flower_timer;
        opacity1 += flower_timer*5;
      }

      if ((top_rightY < 340) && (r_flwr2 < 50)) {
        r_flwr2 += flower_timer;
        opacity2 += flower_timer*5;
      }

      if ((top_rightY < 290) && (r_flwr3 < 50)) {
        r_flwr3 += flower_timer;
        opacity3 += flower_timer*6;
      }

      if ((top_rightY < 190) && (r_flwr4 < 30)) {
        r_flwr4 += flower_timer;
        opacity4 += flower_timer*7;
      }
      top_rightY -= stem_speed;
    }

    println("n_roots : ", n_roots);
    println("opacity1 : ", opacity1);

    //RACINES PROCEDURALES

    strokeWeight(3); //racine droite
    noFill();


    if (n_roots >= 1) {
      root1_y2 = root1_y1;
      root1_y3 = root1_y1+10;
      stroke(0, 0, 0, opacity1);
      bezier(root1_x1, 600-root1_y1, root1_x2, 600-root1_y2, root1_x3, 600-root1_y3, root1_x4, 600-root1_y4);
      if (n_roots >= 2) {
        root2_y2 = root2_y1;
        root2_y3 = root2_y1+10;
        stroke(0, 0, 0, opacity2);
        bezier(root2_x1, 600-root2_y1, root2_x2, 600-root2_y2, root2_x3, 600-root2_y3, root2_x4, 600-root2_y4);
        if (n_roots >= 3) {
          root3_y2 = root3_y1;
          root3_y3 = root3_y1+5;
          stroke(0, 0, 0, opacity3);
          bezier(root3_x1, 600-root3_y1, root3_x2, 600-root3_y2, root3_x3, 600-root3_y3, root3_x4, 600-root3_y4);
          if (n_roots == 4) {
            root4_y2 = root4_y1;
            root4_y3 = root4_y1+5;
            stroke(0, 0, 0, opacity4);
            bezier(root4_x1, 600-root4_y1, root4_x2, 600-root4_y2, root4_x3, 600-root4_y3, root4_x4, 600-root4_y4);
          }
        }
      }
    }
  }
}
