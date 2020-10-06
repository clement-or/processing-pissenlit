public class Plant3 {

  float Xaxis = 900;         // coordonnées X de la tige de la fleur
  float top_rightY = 500;    // bout de la fleur 
  float stem_speed = 4;    // vitesse de pousse de la tige
  
  float r_flwr4 = 0;
  
  float flower_timer = 0;    // init
  float flower_speed = 0.05; // vitesse de pousse des fleurs
 
  float img_petale_width = 182/3.2; // dimension X fichier png des pétales
  float img_petale_height = 138/3.2; // dimension Y fichier png des pétales
  
  float offset_y = 5;
  float hauteur_rand;
  float hauteur_rand2 = hauteur_rand - img_petale_height - offset_y;
  float hauteur_rand3 = hauteur_rand2 - img_petale_height - offset_y;
  float hauteur_rand4 = hauteur_rand3 - img_petale_height - offset_y;
  float hauteur_rand5 = hauteur_rand4 - img_petale_height - offset_y;
  int n_petals = (int) random(3,5);
  
  // définition 1er couple de pétales
  float left_petal1_scale_x;
  float left_petal1_scale_y;
  
  float right_petal1_scale_x;
  float right_petal1_scale_y;
  
  // définition 2e couple de pétales
  float left_petal2_scale_x;
  float left_petal2_scale_y;
  
  float right_petal2_scale_x;
  float right_petal2_scale_y;
  
  // définition 3e couple de pétales
  float left_petal3_scale_x;
  float left_petal3_scale_y;
  
  float right_petal3_scale_x;
  float right_petal3_scale_y;
  
  // définition 4e couple de pétales
  float left_petal4_scale_x;
  float left_petal4_scale_y;
  
  float right_petal4_scale_x;
  float right_petal4_scale_y;
  
  // définition 5e couple de pétales
  float left_petal5_scale_x;
  float left_petal5_scale_y;
  
  float right_petal5_scale_x;
  float right_petal5_scale_y;


// actuellement, la vitesse de croissance de la fleur a une accélération constante
// il faudrait garder cette accélération (graphiquement super), tout en la rendant 
// indépendante pour chaque fleur
  
  Plant3() {
    if (n_petals == 3){
       hauteur_rand = random(350, 400);
     }
     
     if (n_petals == 4){
       hauteur_rand = random(430, 480);
     }
     
     if (n_petals == 5){
       hauteur_rand = random(500, 530);
     }
    
    hauteur_rand2 = hauteur_rand - img_petale_height - offset_y;
    hauteur_rand3 = hauteur_rand2 - img_petale_height - offset_y;
    hauteur_rand4 = hauteur_rand3 - img_petale_height - offset_y;
    hauteur_rand5 = hauteur_rand4 - img_petale_height - offset_y;
  
    left_petal1_scale_x = Xaxis;
    left_petal1_scale_y = hauteur_rand;
  
    right_petal1_scale_x = Xaxis;
    right_petal1_scale_y = hauteur_rand;
  
    left_petal2_scale_x = Xaxis;
    left_petal2_scale_y = hauteur_rand2;
  
    right_petal2_scale_x = Xaxis;
    right_petal2_scale_y = hauteur_rand2;
  
    left_petal3_scale_x = Xaxis;
    left_petal3_scale_y = hauteur_rand3;
      
    right_petal3_scale_x = Xaxis;
    right_petal3_scale_y = hauteur_rand3;
      
    left_petal4_scale_x = Xaxis;
    left_petal4_scale_y = hauteur_rand4;
      
    right_petal4_scale_x = Xaxis;
    right_petal4_scale_y = hauteur_rand4;
      
    left_petal5_scale_x = Xaxis;
    left_petal5_scale_y = hauteur_rand5;
      
    right_petal5_scale_x = Xaxis;
    right_petal5_scale_y = hauteur_rand5;
     
  }
  
public void growth() {
   
   flower_timer += flower_speed;
   
   strokeWeight(3);
   strokeCap(ROUND);
   noFill();
   stroke(0);
   smooth();
   
   line(Xaxis, height-niv_sol, Xaxis, top_rightY);
 
   noStroke();
   fill(noir);
   
   fill(rouge);
   circle(Xaxis, 180, r_flwr4);
   
   println("n_petals : ",n_petals);
   println("hauteur_rand : ",hauteur_rand);
   println("left_petal2_scale_y : ",left_petal2_scale_y);
   
   
   if ((top_rightY > 170) & (n_petals >= 3)) { 
      if ((top_rightY < hauteur_rand) & (left_petal1_scale_x <= Xaxis+img_petale_width)){
        left_petal1_scale_x += flower_timer*1.26;
        right_petal1_scale_x -= flower_timer*1.26;
      }

      if ((top_rightY < hauteur_rand) & (left_petal1_scale_y >= hauteur_rand-img_petale_height)){
        left_petal1_scale_y -= flower_timer;
        right_petal1_scale_y -= flower_timer;
      }
      
      if ((top_rightY < hauteur_rand2) & (left_petal2_scale_x <= Xaxis+img_petale_width)){
        left_petal2_scale_x += flower_timer*1.26;
        right_petal2_scale_x -= flower_timer*1.26;
      }
        
      if ((top_rightY < hauteur_rand2) & (left_petal2_scale_y >= hauteur_rand2-img_petale_height)){
        left_petal2_scale_y -= flower_timer;
        right_petal2_scale_y -= flower_timer;
      }
      
      if ((top_rightY < hauteur_rand3) & (left_petal3_scale_x <= Xaxis+img_petale_width)){
        left_petal3_scale_x += flower_timer*1.26;
        right_petal3_scale_x -= flower_timer*1.26;
      }
        
      if ((top_rightY < hauteur_rand3) & (left_petal3_scale_y >= hauteur_rand3-img_petale_height)){
        left_petal3_scale_y -= flower_timer;
        right_petal3_scale_y -= flower_timer;
      }
      
      if ((top_rightY < 200) && (r_flwr4 < 30)) { // pétale au sommet
        r_flwr4 += flower_timer;}
        
      
      
      top_rightY -= stem_speed;  
      imageMode(CORNERS);
      image(plant3_petale, Xaxis, hauteur_rand, left_petal1_scale_x, left_petal1_scale_y);
      image(plant3_petale_mirror, Xaxis, hauteur_rand, right_petal1_scale_x, right_petal1_scale_y);
      image(plant3_petale, Xaxis, hauteur_rand2, left_petal2_scale_x, left_petal2_scale_y);
      image(plant3_petale_mirror, Xaxis, hauteur_rand2, right_petal2_scale_x, right_petal2_scale_y);
      image(plant3_petale, Xaxis, hauteur_rand3, left_petal3_scale_x, left_petal3_scale_y);
      image(plant3_petale_mirror, Xaxis, hauteur_rand3, right_petal3_scale_x, right_petal3_scale_y);
      
          if (n_petals >= 4){
              if ((top_rightY < hauteur_rand4) & (left_petal4_scale_x <= Xaxis+img_petale_width)){
                left_petal4_scale_x += flower_timer*1.26;
                right_petal4_scale_x -= flower_timer*1.26;
              }
                
              if ((top_rightY < hauteur_rand4) & (left_petal4_scale_y >= hauteur_rand4-img_petale_height)){
                left_petal4_scale_y -= flower_timer;
                right_petal4_scale_y -= flower_timer;
              }
              
              image(plant3_petale, Xaxis, hauteur_rand4, left_petal4_scale_x, left_petal4_scale_y);
              image(plant3_petale_mirror, Xaxis, hauteur_rand4, right_petal4_scale_x, right_petal4_scale_y);
                  
                  if (n_petals >= 5){
                      if ((top_rightY < hauteur_rand5) & (left_petal5_scale_x <= Xaxis+img_petale_width)){
                        left_petal5_scale_x += flower_timer*1.26;
                        right_petal5_scale_x -= flower_timer*1.26;
                      }
                        
                      if ((top_rightY < hauteur_rand5) & (left_petal5_scale_y >= hauteur_rand5-img_petale_height)){
                        left_petal5_scale_y -= flower_timer;
                        right_petal5_scale_y -= flower_timer;
                      }
                      
                      image(plant3_petale, Xaxis, hauteur_rand5, left_petal5_scale_x, left_petal5_scale_y);
                      image(plant3_petale_mirror, Xaxis, hauteur_rand5, right_petal5_scale_x, right_petal5_scale_y);
                  }
        
          }
        }
        
    
   if (top_rightY <= 170){ // affichage définitif des pétales
      image(plant3_petale, Xaxis, hauteur_rand, left_petal1_scale_x, left_petal1_scale_y);
      image(plant3_petale_mirror, Xaxis, hauteur_rand, right_petal1_scale_x, right_petal1_scale_y);
      image(plant3_petale, Xaxis, hauteur_rand2, left_petal2_scale_x, left_petal2_scale_y);
      image(plant3_petale_mirror, Xaxis, hauteur_rand2, right_petal2_scale_x, right_petal2_scale_y);
      image(plant3_petale, Xaxis, hauteur_rand3, left_petal3_scale_x, left_petal3_scale_y);
      image(plant3_petale_mirror, Xaxis, hauteur_rand3, right_petal3_scale_x, right_petal3_scale_y);
        if (n_petals >= 4){
          image(plant3_petale, Xaxis, hauteur_rand4, left_petal4_scale_x, left_petal4_scale_y);
          image(plant3_petale_mirror, Xaxis, hauteur_rand4, right_petal4_scale_x, right_petal4_scale_y);
        }
        
        if (n_petals >= 5){
          image(plant3_petale, Xaxis, hauteur_rand5, left_petal5_scale_x, left_petal5_scale_y);
          image(plant3_petale_mirror, Xaxis, hauteur_rand5, right_petal5_scale_x, right_petal5_scale_y);
        }
}
}
}
 
