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
  
  // génération des racines
  int roots_lvl1 = (int)random(0,3); // racine supérieures : 0 = gauche, 1 = droite, 2 = les deux

  int roots_lvl2_L = (int)random(0,2);
  int roots_lvl2_R = (int)random(0,2);



public void growth() {

   flower_timer += flower_speed;              // les boules poussent à vitesse croissante

   smooth();
   strokeWeight(3);
   stroke(noir);
   line(Xaxis, niv_sol, Xaxis, top_rightY);
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


// ce morceau de code marche, c'est juste qu'il y a des diagonales au lieu de béziers pour fabriquer les racines

   stroke(noir);
   if ((roots_lvl1 == 0) || (roots_lvl1 == 2)){  // racines spawnent si leur random les a créées
     line(Xaxis-50,height-100,Xaxis,height-200);
     if (roots_lvl2_L == 0){
       line(Xaxis-75,height-100,Xaxis-50,height-150);
     } else{
       line(Xaxis-25,height-100,Xaxis-50,height-150);
       }
   }

   if ((roots_lvl1 == 1) || (roots_lvl1 == 2)){
     line(Xaxis,height-200,Xaxis+50,height-100);
     if (roots_lvl2_R == 0){
       line(Xaxis+75,height-100,Xaxis+50,height-150);
     } else{
       line(Xaxis+25,height-100,Xaxis+50,height-150);
       }
  }

} 
}
