// Code à déplacer dans Plant3
PImage plant3_petale;
PImage plant3_petale_mirror;

//Code pour les icones
PImage icones;
PImage[] images = new PImage [54];

int numFrames = 54;
float longueur_icone = 300 /2;
float hauteur_icone = 169 /2;
int currentFrame = 0;

void setup() {
  // Forcer un framerate constant
  frameRate(60);
  size(1200, 600);

  // Code à déplacer dans Plant3
  plant3_petale = loadImage("plant3_petale.png");
  plant3_petale_mirror = loadImage("plant3_petale_mirror.png");

  // Code à déplacer
  mic = new AudioIn(this, 0); // on n'utilise que le micro de gauche s'il y en a 2 :/
  mic.start(); // on allume le micro
  amp = new Amplitude(this);
  amp.input(mic); // on va chercher l'amplitude du mic

  // Création des objets du jeu, temporaire
  // On aura plus tard une classe qui gérera ça
  new Camera();
<<<<<<< Updated upstream
  //new Plant1(600, 500);
  //new Plant2(900, 500);
  //new Seed(600, 100);
  //Plant5(300, 500);
=======
  //new Plant1(750, 500);
  //new Plant2(500, 500);
  //new Seed(600, 100);
  //new Seed_on_plant(200, 200);
  //new Plant5(250, 500);
  //new Plant3 (1000, 500);
>>>>>>> Stashed changes
  //Plant_start(600, 500);
  new Intro(600, -50);
  //Plant_start(600, 500);

  for (int i = 0; i < 54; i ++) 
  {
    String icones = "souffle_micro_" + nf(i, 5) + ".png";
    images[i] = loadImage(icones);
  }

  //for (int i = 0; i < 50; i++) {
  //  new Plant1(i*500, 500);
  //}
}

// Afficher les éléments du jeu via la Camera
void draw() {
  CameraManager.current.draw();
  
  
  currentFrame = (currentFrame+1) % numFrames;  // Use % to cycle through frames
  for (int x = -100; x < width; x += images[0].width) {
    imageMode(CORNERS);
    image(images[(currentFrame) % numFrames], 525, 25, 525 + longueur_icone, 25 + hauteur_icone);
  }
}

void keyPressed() {
  int x = (keyCode == RIGHT ? 1 : 0) - (keyCode == LEFT ? 1 : 0);
  int y = (keyCode == DOWN ? 1 : 0) - (keyCode == UP ? 1 : 0);
  CameraManager.current.position.add(new PVector(x, y));
}

public int niv_sol=100;
public color rouge = color(255, 0, 0);
public color noir = color(0);


// Fonction "globale" qui ne devrait pas exister mais Processing fait comme ça
public RenderedObject createRandomPlant(float x, float y) {
  //int rnd = (int)random(0, 4);
  int rnd = 0;
  RenderedObject r = null;

  switch (rnd) {
  case 0:
    r = new Plant1(x, y);
    break;

  case 1:
    r = new Plant5(x, y);
    break;

  case 2:
    r = new Plant2(x, y);
    break;

  case 3:
    r = new Plant3(x, y);
    break;
  }

  return r != null ? r : null;
}
