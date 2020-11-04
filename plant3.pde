public class Plant3 extends RenderedObject {

  PImage plant3_petale = loadImage("plant3_petale.png");
  PImage plant3_petale_mirror = loadImage("plant3_petale_mirror.png");

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
  int n_petals;

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

  Plant3(float pos_x, float pos_y) {
    super();
    position.x = pos_x;
    position.y = pos_y;
    n_petals = (int) random(3, 6);
    sop = new SeedOnPlant(0, 0, 0, 0);

    // ajustement de la position des pétales sur la tige selon leur nombre
    if (n_petals == 3) { 
      hauteur_rand = (int) random(360, 440);
    }

    if (n_petals == 4) {
      hauteur_rand = (int) random(400, 450);
    }

    if (n_petals == 5) {
      hauteur_rand = 460;
    }

    // une fois hauteur_rand défini (hauteur du premier couple de pétale), décalage des prochains couples à être afficher pour ne pas les superposer
    hauteur_rand2 = hauteur_rand - img_petale_height - offset_y;
    hauteur_rand3 = hauteur_rand2 - img_petale_height - offset_y;
    hauteur_rand4 = hauteur_rand3 - img_petale_height - offset_y;
    hauteur_rand5 = hauteur_rand4 - img_petale_height - offset_y;

    // définition des coordonnées auxquelles créer les différents couples de pétales, avec à chaque fois un décalage défini par "hauteur_rand + n° de la ligne"
    left_petal1_scale_x = renderedPosition.x;
    left_petal1_scale_y = hauteur_rand;

    right_petal1_scale_x = renderedPosition.x;
    right_petal1_scale_y = hauteur_rand;

    left_petal2_scale_x = renderedPosition.x;
    left_petal2_scale_y = hauteur_rand2;

    right_petal2_scale_x = renderedPosition.x;
    right_petal2_scale_y = hauteur_rand2;

    left_petal3_scale_x = renderedPosition.x;
    left_petal3_scale_y = hauteur_rand3;

    right_petal3_scale_x = renderedPosition.x;
    right_petal3_scale_y = hauteur_rand3;

    left_petal4_scale_x = renderedPosition.x;
    left_petal4_scale_y = hauteur_rand4;

    right_petal4_scale_x = renderedPosition.x;
    right_petal4_scale_y = hauteur_rand4;

    left_petal5_scale_x = renderedPosition.x;
    left_petal5_scale_y = hauteur_rand5;

    right_petal5_scale_x = renderedPosition.x;
    right_petal5_scale_y = hauteur_rand5;
  }

  SeedOnPlant sop;

  public void draw() {

    flower_timer += flower_speed;

    //println("position.x : ",renderedPosition.x);
    //println("left_petal1_scale_x : ",left_petal1_scale_x);
    //println("hauteur_rand : ",hauteur_rand);
    //println("n_petals = ",n_petals);
    //println("n_petals : ",n_petals);
    //println("hauteur_rand : ",hauteur_rand);
    //println("left_petal2_scale_y : ",left_petal2_scale_y);

    strokeWeight(3);
    strokeCap(ROUND);
    noFill();
    stroke(0);
    smooth();

    // dessin de la tige
    line(renderedPosition.x, renderedPosition.y, renderedPosition.x, top_rightY);

    noStroke();
    //circle(renderedPosition.x, 180, r_flwr4);   
    sop.position.x = position.x;
    sop.position.y = 180;
    sop.size = r_flwr4;
    sop.max_size = 30;

    // dessin de "n" couples de pétales en fonction de la variable "n_petals" qui a une valeur random (int) entre 3 et 5
    // comme chaque pétale est une image, seules les valeurs de "scale" varient dans le temps pour animer la création des pétales
    // en soit, tous les pétales sont "visibles" dès le début mais ont simplement des scale X et Y de 0, qui augmentent jusqu'aux dimensions de l'image originale

    if ((top_rightY > 170) & (n_petals >= 3)) { 
      if ((top_rightY < hauteur_rand) & (left_petal1_scale_x <= img_petale_width)) {
        left_petal1_scale_x += flower_timer*1.26;
        right_petal1_scale_x -= flower_timer*1.26;
      }

      if ((top_rightY < hauteur_rand) & (left_petal1_scale_y >= hauteur_rand-img_petale_height)) {
        left_petal1_scale_y -= flower_timer;
        right_petal1_scale_y -= flower_timer;
      }

      if ((top_rightY < hauteur_rand2) & (left_petal2_scale_x <= img_petale_width)) {
        left_petal2_scale_x += flower_timer*1.26;
        right_petal2_scale_x -= flower_timer*1.26;
      }

      if ((top_rightY < hauteur_rand2) & (left_petal2_scale_y >= hauteur_rand2-img_petale_height)) {
        left_petal2_scale_y -= flower_timer;
        right_petal2_scale_y -= flower_timer;
      }

      if ((top_rightY < hauteur_rand3) & (left_petal3_scale_x <= img_petale_width)) {
        left_petal3_scale_x += flower_timer*1.26;
        right_petal3_scale_x -= flower_timer*1.26;
      }

      if ((top_rightY < hauteur_rand3) & (left_petal3_scale_y >= hauteur_rand3-img_petale_height)) {
        left_petal3_scale_y -= flower_timer;
        right_petal3_scale_y -= flower_timer;
      }

      if ((top_rightY < 200) && (r_flwr4 < 30)) { // pétale au sommet
        r_flwr4 += flower_timer;
      }



      top_rightY -= stem_speed;  
      imageMode(CORNERS); // affichage des pétales qui ont pour points d'ancrage leur coin en bas à gauche/droite pour donner une meilleure animation
      image(plant3_petale, renderedPosition.x, hauteur_rand, renderedPosition.x+left_petal1_scale_x, left_petal1_scale_y);
      image(plant3_petale_mirror, renderedPosition.x, hauteur_rand, renderedPosition.x+right_petal1_scale_x, right_petal1_scale_y);
      image(plant3_petale, renderedPosition.x, hauteur_rand2, renderedPosition.x+left_petal2_scale_x, left_petal2_scale_y);
      image(plant3_petale_mirror, renderedPosition.x, hauteur_rand2, renderedPosition.x+right_petal2_scale_x, right_petal2_scale_y);
      image(plant3_petale, renderedPosition.x, hauteur_rand3, renderedPosition.x+left_petal3_scale_x, left_petal3_scale_y);
      image(plant3_petale_mirror, renderedPosition.x, hauteur_rand3, renderedPosition.x+right_petal3_scale_x, right_petal3_scale_y);

      if (n_petals >= 4) { // si n_petals supérieur ou égal à 4, alors création d'une 4e rangée de pétales...
        if ((top_rightY < hauteur_rand4) & (left_petal4_scale_x <= img_petale_width)) {
          left_petal4_scale_x += flower_timer*1.26;
          right_petal4_scale_x -= flower_timer*1.26;
        }

        if ((top_rightY < hauteur_rand4) & (left_petal4_scale_y >= hauteur_rand4-img_petale_height)) {
          left_petal4_scale_y -= flower_timer;
          right_petal4_scale_y -= flower_timer;
        }

        image(plant3_petale, renderedPosition.x, hauteur_rand4, renderedPosition.x+left_petal4_scale_x, left_petal4_scale_y);
        image(plant3_petale_mirror, renderedPosition.x, hauteur_rand4, renderedPosition.x+right_petal4_scale_x, right_petal4_scale_y);

        if (n_petals >= 5) { // ... et si n_petals supérieur ou égal à 5, alors création d'une 5e rangée de pétales...
          if ((top_rightY < hauteur_rand5) & (left_petal5_scale_x <= img_petale_width)) {
            left_petal5_scale_x += flower_timer*1.26;
            right_petal5_scale_x -= flower_timer*1.26;
          }

          if ((top_rightY < hauteur_rand5) & (left_petal5_scale_y >= hauteur_rand5-img_petale_height)) {
            left_petal5_scale_y -= flower_timer;
            right_petal5_scale_y -= flower_timer;
          }

          image(plant3_petale, renderedPosition.x, hauteur_rand5, renderedPosition.x+left_petal5_scale_x, left_petal5_scale_y);
          image(plant3_petale_mirror, renderedPosition.x, hauteur_rand5, renderedPosition.x+right_petal5_scale_x, right_petal5_scale_y);
        }
      }
    }


    if (top_rightY <= 170) { // affichage définitif des pétales
      image(plant3_petale, renderedPosition.x, hauteur_rand, renderedPosition.x+left_petal1_scale_x, left_petal1_scale_y);
      image(plant3_petale_mirror, renderedPosition.x, hauteur_rand, renderedPosition.x+right_petal1_scale_x, right_petal1_scale_y);
      image(plant3_petale, renderedPosition.x, hauteur_rand2, renderedPosition.x+left_petal2_scale_x, left_petal2_scale_y);
      image(plant3_petale_mirror, renderedPosition.x, hauteur_rand2, renderedPosition.x+right_petal2_scale_x, right_petal2_scale_y);
      image(plant3_petale, renderedPosition.x, hauteur_rand3, renderedPosition.x+left_petal3_scale_x, left_petal3_scale_y);
      image(plant3_petale_mirror, renderedPosition.x, hauteur_rand3, renderedPosition.x+right_petal3_scale_x, right_petal3_scale_y);
      if (n_petals >= 4) {
        image(plant3_petale, renderedPosition.x, hauteur_rand4, renderedPosition.x+left_petal4_scale_x, left_petal4_scale_y);
        image(plant3_petale_mirror, renderedPosition.x, hauteur_rand4, renderedPosition.x+right_petal4_scale_x, right_petal4_scale_y);
      }

      if (n_petals >= 5) {
        image(plant3_petale, renderedPosition.x, hauteur_rand5, renderedPosition.x+left_petal5_scale_x, left_petal5_scale_y);
        image(plant3_petale_mirror, renderedPosition.x, hauteur_rand5, renderedPosition.x+right_petal5_scale_x, right_petal5_scale_y);
      }
    }
  }
}
