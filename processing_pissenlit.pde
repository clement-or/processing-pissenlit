// Code à déplacer dans Plant3
PImage plant3_petale;
PImage plant3_petale_mirror;

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
  //new Plant1(600, 500);
  //new Plant2(900, 500);
  //new Seed(600, 100);
  //Plant5(300, 500);
  new Plant_start(600, 500);
  
  //for (int i = 0; i < 50; i++) {
  //  new Plant1(i*500, 500);
  //}
}

// Afficher les éléments du jeu via la Camera
void draw() {
  CameraManager.current.draw();
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
  int rnd = (int)random(0, 4);
  RenderedObject r = null;
  
  switch (rnd) {
    case 0:
      r = new Plant1(x, y);
    break;
    
    case 1:
      //r = new Plant2(x, y);
    
    case 2:
      r = new Plant3(x, y);
    break;
    
    case 3:
      //r = new Plant4(x, y);
    
    case 4:
      r = new Plant5(x, y);
    break;
  }
  
  return r != null ? r : null;
}
