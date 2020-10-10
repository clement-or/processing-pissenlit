public class Plant1 {

  float Xaxis = 600;         // coordonnées X de la tige de la fleur
  float top_rightY = 500;    // bout de la fleur 
  float stem_speed = 3;      // vitesse de pousse de la tige
  
  float flower_timer = 0;    // init
  float flower_speed = 0.05; // vitesse de pousse des fleurs
  float r_flwr1 = 0;         // rayons des cercles pour chaque fleur
  float r_flwr2 = 0;
  float r_flwr3 = 0;
  float r_flwr4 = 0;
  
  // ROOTS
  float root1_x1 = 600;
  float root1_x2 = 660;
  float root1_x3 = 650;
  float root1_x4 = 650;
  
  float root1_y1 = random(150, 200);
  float root1_y2;
  float root1_y3;
  float root1_y4 = 100;
  
  float root2_x1 = Xaxis-(root1_x1-Xaxis);
  float root2_x2 = Xaxis-(root1_x2-Xaxis);
  float root2_x3 = Xaxis-(root1_x3-Xaxis);
  float root2_x4 = Xaxis-(root1_x4-Xaxis);
  
  float root2_y1 = random(150, 200);
  float root2_y2;
  float root2_y3;
  float root2_y4 = 100;
  
  float root3_x1 = 650+1;
  float root3_x2 = 680+1;
  float root3_x3 = 675+1;
  float root3_x4 = 675+1;
  
  float root3_y1 = random(120, 140);
  float root3_y2;
  float root3_y3;
  float root3_y4 = 100;
  
  float root4_x1 = Xaxis-(root3_x1-Xaxis);
  float root4_x2 = Xaxis-(root3_x2-Xaxis);
  float root4_x3 = Xaxis-(root3_x3-Xaxis);
  float root4_x4 = Xaxis-(root3_x4-Xaxis);
  
  float root4_y1 = random(120, 140);
  float root4_y2;
  float root4_y3;
  float root4_y4 = 100;
  
  int n_roots = (int) random(0,4);


// actuellement, la vitesse de croissance de la fleur a une accélération constante
// il faudrait garder cette accélération (graphiquement super), tout en la rendant 
// indépendante pour chaque fleur

public void growth() {
   
   flower_timer += flower_speed;
   
   println("root1_y1 : ", root1_y1);
   println("root2_y1 : ", root2_y1);
   println("root3_y1 : ", root3_y1);
   println("root4_y1 : ", root4_y1);
   
   smooth();
   strokeWeight(3);
   stroke(0);
   line(Xaxis, height-niv_sol, Xaxis, top_rightY);
   noStroke();

   fill(noir);
   circle(627, 360, r_flwr1);
   circle(573, 300, r_flwr2);
   circle(627, 240, r_flwr3);

   fill(rouge);
   circle(600, 180, r_flwr4);
    
   if (top_rightY > 170){ 
      if ((top_rightY < 425) && (r_flwr1 < 50)){
        r_flwr1 += flower_timer;}

      if ((top_rightY < 340) && (r_flwr2 < 50)){
        r_flwr2 += flower_timer;}

      if ((top_rightY < 290) && (r_flwr3 < 50)){
        r_flwr3 += flower_timer;}

      if ((top_rightY < 190) && (r_flwr4 < 30)){
        r_flwr4 += flower_timer;}
   top_rightY -= stem_speed;}
   
   println("n_roots : ", n_roots);
   
   //RACINES PROCEDURALES
   
   strokeWeight(3); //racine droite
   noFill();
   stroke(0);
   
   if (n_roots >= 1){
     root1_y2 = root1_y1;
     root1_y3 = root1_y1+10;
     bezier(root1_x1, 600-root1_y1,  root1_x2, 600-root1_y2,  root1_x3, 600-root1_y3,  root1_x4, 600-root1_y4);
       if (n_roots >= 2){
         root2_y2 = root2_y1;
         root2_y3 = root2_y1+10;
         bezier(root2_x1, 600-root2_y1,  root2_x2, 600-root2_y2,  root2_x3, 600-root2_y3,  root2_x4, 600-root2_y4);
           if (n_roots >= 3){
             root3_y2 = root3_y1;
             root3_y3 = root3_y1+5;
             bezier(root3_x1, 600-root3_y1,  root3_x2, 600-root3_y2,  root3_x3, 600-root3_y3,  root3_x4, 600-root3_y4);
               if (n_roots == 4){
                 root4_y2 = root4_y1;
                 root4_y3 = root4_y1+5;
                 bezier(root4_x1, 600-root4_y1,  root4_x2, 600-root4_y2,  root4_x3, 600-root4_y3,  root4_x4, 600-root4_y4);
}
}
}
}

} 
}
