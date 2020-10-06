public class plant4 {

  float Xaxis = 600;         // coordonnées X de la tige de la fleur
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
  int roots_lvl1_L = 1; //(int)random(0,2);
  int roots_lvl1_R = 1; //(int)random(0,2);
  
  int roots_lvl2_LL = 1; //(int)random(0,2);
  int roots_lvl2_LR = 1; //(int)random(0,2);
  int roots_lvl2_CL = 1; //(int)random(0,2);
  int roots_lvl2_CR = 1; //(int)random(0,2);
  int roots_lvl2_RL = 1; //(int)random(0,2);
  int roots_lvl2_RR = 1; //(int)random(0,2);
  
  int roots_lvl3_LLL = 1; //(int)random(0,2);
  int roots_lvl3_LLR = 1; //(int)random(0,2);
  int roots_lvl3_LCL = 1; //(int)random(0,2);
  int roots_lvl3_LCR = 1; //(int)random(0,2);
  int roots_lvl3_LRL = 1; //(int)random(0,2);
  int roots_lvl3_LRR = 1; //(int)random(0,2);  
  int roots_lvl3_CLL = 1; //(int)random(0,2);
  int roots_lvl3_CLR = 1; //(int)random(0,2);
  int roots_lvl3_CCL = 1; //(int)random(0,2);
  int roots_lvl3_CCR = 1; //(int)random(0,2);
  int roots_lvl3_CRL = 1; //(int)random(0,2);
  int roots_lvl3_CRR = 1; //(int)random(0,2);
  int roots_lvl3_RLL = 1; //(int)random(0,2);
  int roots_lvl3_RLR = 1; //(int)random(0,2);
  int roots_lvl3_RCL = 1; //(int)random(0,2);
  int roots_lvl3_RCR = 1; //(int)random(0,2);
  int roots_lvl3_RRL = 1; //(int)random(0,2);
  int roots_lvl3_RRR = 1; //(int)random(0,2); 

  //int roots_lvl2_L = (int)random(0,2); // les racines de niveau 1 ont forcément une racine de niveau 2 attachée, 0 = lvl2_LL, 1 = lvl2_LR
  //int roots_lvl2_R = (int)random(0,2);
  //int roots_lvl1 = (int)random(0,3); // racine supérieures : 0 = lvl1_L, 1 = lvl1_R, 2 = les deux

  int rootspacing_lvl1 = 20;
  int rootspacing_lvl2 = 10;
  int rootspacing_lvl3 = 5;

  int rootheight_lvl1 = 150;
  int rootheight_lvl2 = 50;
  int rootheight_lvl3 = 25;

public void growth() {

   flower_timer += flower_speed;              // les boules poussent à vitesse croissante

   smooth();
   strokeWeight(3);
   stroke(noir);
   line(Xaxis, height-niv_sol, Xaxis, top_rightY);
   noStroke();

   fill(noir);
   circle(Xaxis+27, 360, r_flwr1);
   circle(Xaxis-27, 300, r_flwr2);
   circle(Xaxis+27, 240, r_flwr3);

   fill(rouge);
   circle(600, 180, r_flwr4);   

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
     line(Xaxis-rootspacing_lvl1,height-100,Xaxis-rootspacing_lvl1,height-200);
     line(Xaxis-rootspacing_lvl1,height-200,Xaxis,height-200);
     if (roots_lvl2_LL ==1){
       line(Xaxis-75,height-100,Xaxis-75,height-150);
       line(Xaxis-75,height-150,Xaxis-50,height-150);
       if (roots_lvl3_LLL == 1){
         line(Xaxis-85,height-100,Xaxis-85,height-125);
         line(Xaxis-85,height-125,Xaxis-75,height-125);
       }
       if (roots_lvl3_LLR == 1){
         line(Xaxis-65,height-100,Xaxis-65,height-125);
         line(Xaxis-65,height-125,Xaxis-75,height-125);
       }
     }
     if (roots_lvl2_LR == 1){
       line(Xaxis-25,height-100,Xaxis-25,height-150);
       line(Xaxis-25,height-150,Xaxis-50,height-150);
       if (roots_lvl3_LRL == 1){
         line(Xaxis-15,height-100,Xaxis-15,height-125);
         line(Xaxis-15,height-125,Xaxis-25,height-125);
       }
       if (roots_lvl3_LRR == 1){
         line(Xaxis-35,height-100,Xaxis-35,height-125);
         line(Xaxis-35,height-125,Xaxis-25,height-125);
       }
     }
   }
   if (roots_lvl1_R == 1){
     line(Xaxis+50,height-100,Xaxis+50,height-200);
     line(Xaxis+50,height-200,Xaxis,height-200);
   }
   
   
//code pour utiliser les anciennes valeurs
// ce morceau de code marche, c'est juste qu'il y a des diagonales au lieu de béziers pour fabriquer les racines

//   if ((roots_lvl1 == 0) || (roots_lvl1 == 2)){  // racines spawnent si leur random les a créées
//     line(Xaxis-50,height-100,Xaxis,height-200);
//     if (roots_lvl2_L == 0){
//       line(Xaxis-75,height-100,Xaxis-50,height-150);
//     } else{
//       line(Xaxis-25,height-100,Xaxis-50,height-150);
//       }
//   }
//
//   if ((roots_lvl1 == 1) || (roots_lvl1 == 2)){
//     line(Xaxis,height-200,Xaxis+50,height-100);
//     if (roots_lvl2_R == 0){
//       line(Xaxis+75,height-100,Xaxis+50,height-150);
//     } else{
//       line(Xaxis+25,height-100,Xaxis+50,height-150);
//       }
//  }

} 
}
