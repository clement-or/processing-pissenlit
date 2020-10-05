public class plant {

  float Xaxis = 600;         // coordonnées X de la tige de la fleur
  float top_rightY = 500;    // bout de la fleur 
  float stem_speed = 3;      // vitesse de pousse de la tige
  
  float flower_timer = 0;    // init
  float flower_speed = 0.05; // vitesse de pousse des fleurs
  float r_flwr1 = 0;         // rayons des cercles pour chaque fleur
  float r_flwr2 = 0;
  float r_flwr3 = 0;
  float r_flwr4 = 0;


// actuellement, la vitesse de croissance de la fleur a une accélération constante
// il faudrait garder cette accélération (graphiquement super), tout en la rendant 
// indépendante pour chaque fleur

public void growth() {
   
   flower_timer += flower_speed;

   strokeWeight(6);
   stroke(0);
   line(Xaxis, niv_sol, Xaxis, top_rightY);
   noStroke();

   fill(noir);
   circle(628, 430, r_flwr1);
   circle(572, 350, r_flwr2);
   circle(628, 270, r_flwr3);

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
}
}
