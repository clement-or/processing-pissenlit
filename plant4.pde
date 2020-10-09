public class Plant4 extends RenderedObject {

  float top_rightY = 500;    // bout de la fleur 
  float stem_speed = 3;      // vitesse de pousse de la tige
  
  float flower_timer = 0;    // init
  float flower_speed = 0.05; // vitesse de pousse des fleurs
  float r_flwr1 = 0;         // init rayons des cercles pour chaque fleur
  float r_flwr2 = 0;
  float r_flwr3 = 0;
  float r_flwr4 = 0;
  
  // génération des racines. pour chaque racine, on décide si elle apparaît ou pas
  // si la racine parent n'est pas apparue, on ne dessinera pas la racine enfant
  // pour les références de ces racines, cf GenRacines.png
  int roots_lvl1_L = (int)random(0,2);
  int roots_lvl1_R = (int)random(0,2);
  
  int roots_lvl2_LL = (int)random(0,2);
  int roots_lvl2_LR = (int)random(0,2);
  int roots_lvl2_CL = (int)random(0,2);
  int roots_lvl2_CR = (int)random(0,2);
  int roots_lvl2_RL = (int)random(0,2);
  int roots_lvl2_RR = (int)random(0,2);
  
  int roots_lvl3_LLL = (int)random(0,2);
  int roots_lvl3_LLR = (int)random(0,2);
  int roots_lvl3_LCL = (int)random(0,2);
  int roots_lvl3_LCR = (int)random(0,2);
  int roots_lvl3_LRL = (int)random(0,2);
  int roots_lvl3_LRR = (int)random(0,2);  
  int roots_lvl3_CLL = (int)random(0,2);
  int roots_lvl3_CLR = (int)random(0,2);
  int roots_lvl3_CCL = (int)random(0,2);
  int roots_lvl3_CCR = (int)random(0,2);
  int roots_lvl3_CRL = (int)random(0,2);
  int roots_lvl3_CRR = (int)random(0,2);
  int roots_lvl3_RLL = (int)random(0,2);
  int roots_lvl3_RLR = (int)random(0,2);
  int roots_lvl3_RCL = (int)random(0,2);
  int roots_lvl3_RCR = (int)random(0,2);
  int roots_lvl3_RRL = (int)random(0,2);
  int roots_lvl3_RRR = (int)random(0,2); 

  int rs1 = 75; // rs signifie "root_spacing"  |  rs1 est l'espacement d'une racine de niveau 1 par rapport à son parent
  int rs2 = 25;
  int rs3 = 10;

  int rh1 = 50;// rh signifie "root_height"
  int rh2 = 25;
  int rh3 = 10;
  
  
  Plant4(int pos_x, int pos_y){
    super();
    position.x = pos_x;
    position.y = pos_y;
  }

public void draw() {

   flower_timer += flower_speed;              // les boules poussent à vitesse croissante

   smooth();
   strokeWeight(3);
   stroke(noir);
   line(renderedPosition.x, renderedPosition.y, renderedPosition.x, top_rightY);
   noStroke();

   fill(noir);
   circle(renderedPosition.x+27, 360, r_flwr1);
   circle(renderedPosition.x-27, 300, r_flwr2);
   circle(renderedPosition.x+27, 240, r_flwr3);

   fill(rouge);
   circle(renderedPosition.x, 180, r_flwr4);   

   if (top_rightY>179){                        // croissance de la tige
     top_rightY -= stem_speed;}

   if ((top_rightY < 360) && (r_flwr1 < 52)){  // les boules poussent au bon moment (tout est hardcodé c'est moche)
     r_flwr1 += flower_timer;
     r_flwr1 = constrain(r_flwr1,0,52);}

   if ((top_rightY < 300) && (r_flwr2 < 54)){
     r_flwr2 += flower_timer;
     r_flwr2 = constrain(r_flwr2,0,54);}

   if ((top_rightY < 240) && (r_flwr3 < 51)){
     r_flwr3 += flower_timer;
     r_flwr3 = constrain(r_flwr3,0,51);}

   if ((top_rightY < 180) && (r_flwr4 < 32)){
     r_flwr4 += flower_timer;
     r_flwr4 = constrain(r_flwr4,0,32);}




   stroke(noir);
   if (roots_lvl1_L == 1){
     line(renderedPosition.x-rs1,renderedPosition.y,renderedPosition.x-rs1,renderedPosition.y-rh1);
     line(renderedPosition.x-rs1,renderedPosition.y-rh1,renderedPosition.x,renderedPosition.y-rh1);
     if (roots_lvl2_LL == 1){
       line(renderedPosition.x-rs1-rs2,renderedPosition.y,renderedPosition.x-rs1-rs2,renderedPosition.y-rh2);
       line(renderedPosition.x-rs1-rs2,renderedPosition.y-rh2,renderedPosition.x-rs1,renderedPosition.y-rh2);
       if (roots_lvl3_LLL == 1){
         line(renderedPosition.x-rs1-rs2-rs3,renderedPosition.y,renderedPosition.x-rs1-rs2-rs3,renderedPosition.y-rh3);
         line(renderedPosition.x-rs1-rs2-rs3,renderedPosition.y-rh3,renderedPosition.x-rs1-rs2,renderedPosition.y-rh3);
       }
       if (roots_lvl3_LLR == 1){
         line(renderedPosition.x-rs1-rs2+rs3,renderedPosition.y,renderedPosition.x-rs1-rs2+rs3,renderedPosition.y-rh3);
         line(renderedPosition.x-rs1-rs2+rs3,renderedPosition.y-rh3,renderedPosition.x-rs1-rs2,renderedPosition.y-rh3);
       }
     }
     if (roots_lvl3_LCL == 1){
       line(renderedPosition.x-rs1-rs3,renderedPosition.y,renderedPosition.x-rs1-rs3,renderedPosition.y-rh3);
       line(renderedPosition.x-rs1-rs3,renderedPosition.y-rh3,renderedPosition.x-rs1,renderedPosition.y-rh3);
     }
     if (roots_lvl3_LCR == 1){
       line(renderedPosition.x-rs1+rs3,renderedPosition.y,renderedPosition.x-rs1+rs3,renderedPosition.y-rh3);
       line(renderedPosition.x-rs1+rs3,renderedPosition.y-rh3,renderedPosition.x-rs1,renderedPosition.y-rh3);
     }
     if (roots_lvl2_LR == 1){
       line(renderedPosition.x-rs1+rs2,renderedPosition.y,renderedPosition.x-rs1+rs2,renderedPosition.y-rh2);
       line(renderedPosition.x-rs1+rs2,renderedPosition.y-rh2,renderedPosition.x-rs1,renderedPosition.y-rh2);
       if (roots_lvl3_LRL == 1){
         line(renderedPosition.x-rs1+rs2-rs3,renderedPosition.y,renderedPosition.x-rs1+rs2-rs3,renderedPosition.y-rh3);
         line(renderedPosition.x-rs1+rs2-rs3,renderedPosition.y-rh3,renderedPosition.x-rs1+rs2,renderedPosition.y-rh3);
       }
       if (roots_lvl3_LRR == 1){
         line(renderedPosition.x-rs1+rs2+rs3,renderedPosition.y,renderedPosition.x-rs1+rs2+rs3,renderedPosition.y-rh3);
         line(renderedPosition.x-rs1+rs2+rs3,renderedPosition.y-rh3,renderedPosition.x-rs1+rs2,renderedPosition.y-rh3);
       }
     }
     }


   if (roots_lvl2_CL == 1){
     line(renderedPosition.x-rs2,renderedPosition.y,renderedPosition.x-rs2,renderedPosition.y-rh2);
     line(renderedPosition.x-rs2,renderedPosition.y-rh2,renderedPosition.x,renderedPosition.y-rh2);
     if (roots_lvl3_CLL == 1){
       line(renderedPosition.x-rs2-rs3,renderedPosition.y,renderedPosition.x-rs2-rs3,renderedPosition.y-rh3);
       line(renderedPosition.x-rs2-rs3,renderedPosition.y-rh3,renderedPosition.x-rs2,renderedPosition.y-rh3);
     }
     if (roots_lvl3_CLR == 1){
       line(renderedPosition.x-rs2+rs3,renderedPosition.y,renderedPosition.x-rs2+rs3,renderedPosition.y-rh3);
       line(renderedPosition.x-rs2+rs3,renderedPosition.y-rh3,renderedPosition.x-rs2,renderedPosition.y-rh3);
     }
   }
   if (roots_lvl3_CCL == 1){
     line(renderedPosition.x-rs3,renderedPosition.y,renderedPosition.x-rs3,renderedPosition.y-rh3);
     line(renderedPosition.x-rs3,renderedPosition.y-rh3,renderedPosition.x,renderedPosition.y-rh3);
   }
   if (roots_lvl3_CCR == 1){
     line(renderedPosition.x+rs3,renderedPosition.y,renderedPosition.x+rs3,renderedPosition.y-rh3);
     line(renderedPosition.x+rs3,renderedPosition.y-rh3,renderedPosition.x,renderedPosition.y-rh3);
   }
   if (roots_lvl2_CR == 1){
     line(renderedPosition.x+rs2,renderedPosition.y,renderedPosition.x+rs2,renderedPosition.y-rh2);
     line(renderedPosition.x+rs2,renderedPosition.y-rh2,renderedPosition.x,renderedPosition.y-rh2);
     if (roots_lvl3_CRL == 1){
       line(renderedPosition.x+rs2-rs3,renderedPosition.y,renderedPosition.x+rs2-rs3,renderedPosition.y-rh3);
       line(renderedPosition.x+rs2-rs3,renderedPosition.y-rh3,renderedPosition.x+rs2,renderedPosition.y-rh3);
     }
     if (roots_lvl3_CRR == 1){
       line(renderedPosition.x+rs2+rs3,renderedPosition.y,renderedPosition.x+rs2+rs3,renderedPosition.y-rh3);
       line(renderedPosition.x+rs2+rs3,renderedPosition.y-rh3,renderedPosition.x+rs2,renderedPosition.y-rh3);
     }
   }

   if (roots_lvl1_R == 1){
     line(renderedPosition.x+rs1,renderedPosition.y,renderedPosition.x+rs1,renderedPosition.y-rh1);
     line(renderedPosition.x+rs1,renderedPosition.y-rh1,renderedPosition.x,renderedPosition.y-rh1);
     if (roots_lvl2_RL == 1){
       line(renderedPosition.x+rs1-rs2,renderedPosition.y,renderedPosition.x+rs1-rs2,renderedPosition.y-rh2);
       line(renderedPosition.x+rs1-rs2,renderedPosition.y-rh2,renderedPosition.x+rs1,renderedPosition.y-rh2);
       if (roots_lvl3_RLL == 1){
         line(renderedPosition.x+rs1-rs2-rs3,renderedPosition.y,renderedPosition.x+rs1-rs2-rs3,renderedPosition.y-rh3);
         line(renderedPosition.x+rs1-rs2-rs3,renderedPosition.y-rh3,renderedPosition.x+rs1-rs2,renderedPosition.y-rh3);
       }
       if (roots_lvl3_RLR == 1){
         line(renderedPosition.x+rs1-rs2+rs3,renderedPosition.y,renderedPosition.x+rs1-rs2+rs3,renderedPosition.y-rh3);
         line(renderedPosition.x+rs1-rs2+rs3,renderedPosition.y-rh3,renderedPosition.x+rs1-rs2,renderedPosition.y-rh3);
       }
     }
     if (roots_lvl3_RCL == 1){
       line(renderedPosition.x+rs1-rs3,renderedPosition.y,renderedPosition.x+rs1-rs3,renderedPosition.y-rh3);
       line(renderedPosition.x+rs1-rs3,renderedPosition.y-rh3,renderedPosition.x+rs1,renderedPosition.y-rh3);
     }
     if (roots_lvl3_RCR == 1){
       line(renderedPosition.x+rs1+rs3,renderedPosition.y,renderedPosition.x+rs1+rs3,renderedPosition.y-rh3);
       line(renderedPosition.x+rs1+rs3,renderedPosition.y-rh3,renderedPosition.x+rs1,renderedPosition.y-rh3);
     }
     if (roots_lvl2_RR == 1){
       line(renderedPosition.x+rs1+rs2,renderedPosition.y,renderedPosition.x+rs1+rs2,renderedPosition.y-rh2);
       line(renderedPosition.x+rs1+rs2,renderedPosition.y-rh2,renderedPosition.x+rs1,renderedPosition.y-rh2);
       if (roots_lvl3_RRL == 1){
         line(renderedPosition.x+rs1+rs2-rs3,renderedPosition.y,renderedPosition.x+rs1+rs2-rs3,renderedPosition.y-rh3);
         line(renderedPosition.x+rs1+rs2-rs3,renderedPosition.y-rh3,renderedPosition.x+rs1+rs2,renderedPosition.y-rh3);
       }
       if (roots_lvl3_RRR == 1){
         line(renderedPosition.x+rs1+rs2+rs3,renderedPosition.y,renderedPosition.x+rs1+rs2+rs3,renderedPosition.y-rh3);
         line(renderedPosition.x+rs1+rs2+rs3,renderedPosition.y-rh3,renderedPosition.x+rs1+rs2,renderedPosition.y-rh3);
       }
     }
     }

   
   
//code pour utiliser les anciennes valeurs
// ce morceau de code marche, c'est juste qu'il y a des diagonales au lieu de béziers pour fabriquer les racines

//   if ((roots_lvl1 == 0) || (roots_lvl1 == 2)){  // racines spawnent si leur random les a créées
//     line(renderedPosition.x-50,height-100,renderedPosition.x,height-200);
//     if (roots_lvl2_L == 0){
//       line(renderedPosition.x-75,height-100,renderedPosition.x-50,height-150);
//     } else{
//       line(renderedPosition.x-25,height-100,renderedPosition.x-50,height-150);
//       }
//   }
//
//   if ((roots_lvl1 == 1) || (roots_lvl1 == 2)){
//     line(renderedPosition.x,height-200,renderedPosition.x+50,height-100);
//     if (roots_lvl2_R == 0){
//       line(renderedPosition.x+75,height-100,renderedPosition.x+50,height-150);
//     } else{
//       line(renderedPosition.x+25,height-100,renderedPosition.x+50,height-150);
//       }
//  }

} 
}
