public class Plant2 extends RenderedObject {


  Plant2(float pos_x, float pos_y) {
    super();
    position.x = pos_x;
    position.y = pos_y;
  }

  float Xaxis = 300;         // coordonnées X de la tige de la fleur
  float top_rightY = 500;    // bout de la fleur 
  float stem_speed = 3;      // vitesse de pousse de la tige

  float flower_timer = 0;    // init
  float flower_speed = 0.05; // vitesse de pousse des fleurs
  float r_flwr1 = 0;         // rayons des cercles pour chaque fleur
  float r_flwr2 = 0;
  float r_flwr3 = 0;
  float r_flwr4 = 0;
  float r_flwr5 = 0;
  float r_flwr6 = 0;

  float anch1_x = renderedPosition.x;
  float anch1_y = renderedPosition.y;
  float bez1_x = renderedPosition.x;
  float bez1_y = renderedPosition.y;
  float bez2_x = renderedPosition.x;
  float bez2_y = renderedPosition.y;


  // actuellement, la vitesse de croissance de la fleur a une accélération constante
  // il faudrait garder cette accélération (graphiquement super), tout en la rendant 
  // indépendante pour chaque fleur
  public void draw() {

    flower_timer += flower_speed;
    //println(flower_timer);

    strokeWeight(3); 
    noFill();
    stroke(0);
    bezier(anch1_x, anch1_y, bez1_x, bez1_y, bez2_x, bez2_y, renderedPosition.x, renderedPosition.y);
    // https://www.desmos.com/calculator/4gbkfl910b?lang=fr

    noStroke();
    fill(noir);
    // ici ultra hardcodé, faudra utiliser la fonction bezierPoint() pour
    // les placer parfaitement sur la tige
    circle(renderedPosition.x+2, renderedPosition.y-49, r_flwr1);
    circle(renderedPosition.x-2, renderedPosition.y-124, r_flwr2);
    circle(renderedPosition.x-9, renderedPosition.y-176, r_flwr3);
    circle(renderedPosition.x-27,renderedPosition.y-225, r_flwr4);
    circle(renderedPosition.x-60, renderedPosition.y-253, r_flwr5);


    fill(rouge); 
    circle(renderedPosition.x-87, renderedPosition.y-252, r_flwr6);





    if ((flower_timer >= 1+0.5) && (r_flwr1 < 35)) {
      r_flwr1 += flower_timer;
    }

    if ((flower_timer >= 1.5+0.5) && (r_flwr2 < 30)) {
      r_flwr2 += flower_timer;
    }

    if ((flower_timer >= 2+0.5) && (r_flwr3 < 25)) {
      r_flwr3 += flower_timer;
    }

    if ((flower_timer >= 2.5+0.5) && (r_flwr4 < 20)) {
      r_flwr4 += flower_timer;
    }

    if ((flower_timer >= 3+0.5) && (r_flwr5 < 15)) {
      r_flwr5 += flower_timer;
    }

    if ((flower_timer >= 3.2+0.5) && (r_flwr6 < 10)) {
      r_flwr6 += flower_timer;
    }


println("renderedPosition :", renderedPosition.x,renderedPosition.y);
println("bezier curve :", anch1_x, anch1_y, bez1_x, bez1_y, bez2_x, bez2_y, renderedPosition.x, renderedPosition.y);

    if (anch1_x >= renderedPosition.x-87)
    {
      if (anch1_y >= renderedPosition.y-246)
      {
        anch1_y -= flower_timer*2.28;
      }

      if (bez1_x >= renderedPosition.x+2)
      {
        bez1_x -= flower_timer*1.8;
      }

      if (bez1_y >= renderedPosition.y-276)
      {
        bez1_y -= flower_timer*2.6;
      }

      if (bez2_x >= renderedPosition.x+19)
      {
        bez2_x -= flower_timer*3;
      }

      if (bez2_y >= renderedPosition.y-112)
      {
        bez2_y -= flower_timer*1.8;
      }

      anch1_x -= flower_timer/1.5;
    }
  }
}
