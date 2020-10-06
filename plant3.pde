public class plant3 {

  float Xaxis = 900;         // coordonnées X de la tige de la fleur
  float top_rightY = 500;    // bout de la fleur 
  float stem_speed = 4;    // vitesse de pousse de la tige
  
  float r_flwr4 = 0;
  
  float flower_timer = 0;    // init
  float flower_speed = 0.05; // vitesse de pousse des fleurs
  
  float hauteur_rand = random(300, 450);
  float hauteur_rand_mirror = hauteur_rand-(random(50,100));
  
  float img_petale_width = 182/2.5;
  float img_petale_height = 138/2.5;
  
  float scale_x = Xaxis;
  float scale_y = hauteur_rand;
  
  float scale_x_mirror = Xaxis;
  float scale_y_mirror = hauteur_rand_mirror;


// actuellement, la vitesse de croissance de la fleur a une accélération constante
// il faudrait garder cette accélération (graphiquement super), tout en la rendant 
// indépendante pour chaque fleur

public void growth() {
   
   flower_timer += flower_speed;
   
   strokeWeight(3);
   strokeCap(ROUND);
   noFill();
   stroke(0);
   //println("hauteur_rand : ", hauteur_rand);
   //println("hauteur_rand_mirror : ", hauteur_rand_mirror);
   //println("scale_x_mirror : ", scale_x_mirror);
   //println("scale_y_mirror : ", scale_y_mirror);
   
   line(Xaxis, height-niv_sol, Xaxis, top_rightY);
 
   noStroke();
   fill(noir);
   
   fill(rouge);
   circle(Xaxis, 180, r_flwr4);

   
   if (top_rightY > 170){ 
      if ((top_rightY < hauteur_rand) && (scale_x <= Xaxis+img_petale_width)){
        scale_x += flower_timer*1.26;}

      if ((top_rightY < hauteur_rand) && (scale_y >= hauteur_rand-img_petale_height)){
        scale_y -= flower_timer;}
        
      if ((top_rightY < 200) && (r_flwr4 < 30)) {
        r_flwr4 += flower_timer;}
      
      top_rightY -= stem_speed;  
      imageMode(CORNERS);
      image(plant3_petale, Xaxis, hauteur_rand, scale_x, scale_y);}
        
   if (top_rightY > 170){ // mirror
      if ((top_rightY < hauteur_rand_mirror) && (scale_x_mirror >= Xaxis-img_petale_width)){
        scale_x_mirror -= flower_timer*1.26;}

      if ((top_rightY < hauteur_rand_mirror) && (scale_y_mirror >= hauteur_rand_mirror-img_petale_height)){
        scale_y_mirror -= flower_timer;}
      
      imageMode(CORNERS);
      image(plant3_petale_mirror, Xaxis, hauteur_rand_mirror, scale_x_mirror, scale_y_mirror);}
    
   if (top_rightY <= 170){ // mirror
      image(plant3_petale, Xaxis, hauteur_rand, scale_x, scale_y);
      image(plant3_petale_mirror, Xaxis, hauteur_rand_mirror, scale_x_mirror, scale_y_mirror);}

}
}
 
