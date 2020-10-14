PImage plant3_petale;
PImage plant3_petale_mirror;
PImage fond;

void setup() {
  size(1200, 600);
  plant3_petale = loadImage("plant3_petale.png");
  plant3_petale_mirror = loadImage("plant3_petale_mirror.png");
  fond = loadImage("fond.png");
  mic = new AudioIn(this, 0); // on n'utilise que le micro de gauche s'il y en a 2 :/
  mic.start(); // on allume le micro
  amp = new Amplitude(this);
  amp.input(mic); // on va chercher l'amplitude du mic

  new Camera();
  //new Plant1(600, 500);
  new Plant3(900, 500);
  new Seed(600, 100);
  new Plant5(300, 500);
  //new Plant_start(600, 500);
}

void draw() {
  decor();
  CameraManager.current.draw();
  CameraManager.current.position.x += 0.01;
}


Plant2 plant_2 = new Plant2();


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
