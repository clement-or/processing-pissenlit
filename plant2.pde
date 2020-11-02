public class Plant2 extends RenderedObject {

  boolean needInit = true;

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

  float anch1_x = renderedPosition.x; // marche pas???
  float anch1_y = renderedPosition.y;
  float bez1_x = renderedPosition.x;
  float bez1_y = renderedPosition.y;
  float bez2_x = renderedPosition.x;
  float bez2_y = renderedPosition.y;

  boolean grow_plant2 = true;
  int pos_seed_on_plant = (int) random(1, 7);

  Plant2(float pos_x, float pos_y) {
    super();
    position.x = pos_x;
    position.y = pos_y;
    sop = new SeedOnPlant(0, 0, 0, 0);
  }

  SeedOnPlant sop;

  public void draw() {

    while (needInit == true) {
      anch1_x = renderedPosition.x;
      anch1_y = renderedPosition.y;
      bez1_x = renderedPosition.x;
      bez1_y = renderedPosition.y;
      bez2_x = renderedPosition.x;
      bez2_y = renderedPosition.y;

      needInit = false;
    }

    flower_timer += flower_speed;

    strokeWeight(3); 
    noFill();
    stroke(0);
    bezier(anch1_x, anch1_y, bez1_x, bez1_y, bez2_x, bez2_y, renderedPosition.x, renderedPosition.y);
    noStroke();
    //bezier(anch1_x-87, anch1_y-246, bez1_x+2, bez1_y-276, bez2_x+19, bez2_y-112, renderedPosition.x, renderedPosition.y);
    // https://www.desmos.com/calculator/4gbkfl910b?lang=fr

    if (pos_seed_on_plant == 1) {
      fill(noir);
      //circle(renderedPosition.x, renderedPosition.y-49, r_flwr1);
      circle(renderedPosition.x-2, renderedPosition.y-124, r_flwr2);
      circle(renderedPosition.x-9, renderedPosition.y-176, r_flwr3);
      circle(renderedPosition.x-27, renderedPosition.y-225, r_flwr4);
      circle(renderedPosition.x-60, renderedPosition.y-253, r_flwr5);
      circle(renderedPosition.x-87, renderedPosition.y-252, r_flwr6);

      sop.position.x = position.x;
      sop.position.y = position.y-49;
      sop.size = r_flwr1;
      sop.max_size = 35;
    }

    if (pos_seed_on_plant == 2) {
      fill(noir);
      circle(renderedPosition.x, renderedPosition.y-49, r_flwr1);
      //circle(renderedPosition.x-2, renderedPosition.y-124, r_flwr2);
      circle(renderedPosition.x-9, renderedPosition.y-176, r_flwr3);
      circle(renderedPosition.x-27, renderedPosition.y-225, r_flwr4);
      circle(renderedPosition.x-60, renderedPosition.y-253, r_flwr5);
      circle(renderedPosition.x-87, renderedPosition.y-252, r_flwr6);

      sop.position.x = position.x-2;
      sop.position.y = position.y-124;
      sop.size = r_flwr2;
      sop.max_size = 30;
    }

    if (pos_seed_on_plant == 3) {
      fill(noir);
      circle(renderedPosition.x, renderedPosition.y-49, r_flwr1);
      circle(renderedPosition.x-2, renderedPosition.y-124, r_flwr2);
      //circle(renderedPosition.x-9, renderedPosition.y-176, r_flwr3);
      circle(renderedPosition.x-27, renderedPosition.y-225, r_flwr4);
      circle(renderedPosition.x-60, renderedPosition.y-253, r_flwr5);
      circle(renderedPosition.x-87, renderedPosition.y-252, r_flwr6);

      sop.position.x = position.x - 9;
      sop.position.y = position.y-176;
      sop.size = r_flwr3;
      sop.max_size = 25;
    }

    if (pos_seed_on_plant == 4) {
      fill(noir);
      circle(renderedPosition.x, renderedPosition.y-49, r_flwr1);
      circle(renderedPosition.x-2, renderedPosition.y-124, r_flwr2);
      circle(renderedPosition.x-9, renderedPosition.y-176, r_flwr3);
      //circle(renderedPosition.x-27, renderedPosition.y-225, r_flwr4);
      circle(renderedPosition.x-60, renderedPosition.y-253, r_flwr5);
      circle(renderedPosition.x-87, renderedPosition.y-252, r_flwr6);

      sop.position.x = position.x - 27;
      sop.position.y = position.y - 225;
      sop.size = r_flwr4;
      sop.max_size = 20;
    }

    if (pos_seed_on_plant == 5) {
      fill(noir);
      circle(renderedPosition.x, renderedPosition.y-49, r_flwr1);
      circle(renderedPosition.x-2, renderedPosition.y-124, r_flwr2);
      circle(renderedPosition.x-9, renderedPosition.y-176, r_flwr3);
      circle(renderedPosition.x-27, renderedPosition.y-225, r_flwr4);
      //circle(renderedPosition.x-60, renderedPosition.y-253, r_flwr5);
      circle(renderedPosition.x-87, renderedPosition.y-252, r_flwr6);

      sop.position.x = position.x - 60;
      sop.position.y = position.y - 253;
      sop.size = r_flwr5;
      sop.max_size = 15;
    }

    if (pos_seed_on_plant == 6) {
      fill(noir);
      circle(renderedPosition.x, renderedPosition.y-49, r_flwr1);
      circle(renderedPosition.x-2, renderedPosition.y-124, r_flwr2);
      circle(renderedPosition.x-9, renderedPosition.y-176, r_flwr3);
      circle(renderedPosition.x-27, renderedPosition.y-225, r_flwr4);
      circle(renderedPosition.x-60, renderedPosition.y-253, r_flwr5);
      //circle(renderedPosition.x-87, renderedPosition.y-252, r_flwr6);

      sop.position.x = position.x - 87;
      sop.position.y = position.y - 252;
      sop.size = r_flwr6;
      sop.max_size = 10;
    }


    if ((flower_timer >= 1.5) && (r_flwr1 < 35)) {
      r_flwr1 += flower_timer;
    }
    if ((flower_timer >= 2) && (r_flwr2 < 30)) {
      r_flwr2 += flower_timer;
    }
    if ((flower_timer >= 2.5) && (r_flwr3 < 25)) {
      r_flwr3 += flower_timer;
    }
    if ((flower_timer >= 3) && (r_flwr4 < 20)) {
      r_flwr4 += flower_timer;
    }
    if ((flower_timer >= 3.5) && (r_flwr5 < 15)) {
      r_flwr5 += flower_timer;
    }
    if ((flower_timer >= 3.7) && (r_flwr6 < 10)) {
      r_flwr6 += flower_timer;
    }

    if (grow_plant2 == true) {
      if (anch1_x >= renderedPosition.x-87)
      {
        anch1_x -= flower_timer/1.5;
      }

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
    }

    if (r_flwr6 >= 10) {
      r_flwr6 = 10;
      grow_plant2 = false;
      anch1_x = renderedPosition.x-87.59995;
      anch1_y = renderedPosition.y-252.05394;
      bez1_x = renderedPosition.x;
      bez1_y = renderedPosition.y-278.8499;
      bez2_x = renderedPosition.x;
      bez2_y = renderedPosition.y-114.75;
    }
  }
}
