import processing.sound.*;
public AudioIn mic;                   // mic est déclaré comme canal audio
public Amplitude amp;                 // idem, "amplitude" en audio ~= volume du son

//qq variables utilisées partout
public int niv_sol=100;
public color rouge = color(255, 0, 0);
public color noir = color(0);

Text t;
void setup() {
  
  frameRate(60);
  size(1200, 600);
  
// init scène  
  Mic.init(this);
  Time.init(this);
  
  new CameraFollow();
  //new Musique(this);
  //new Intro (600, -50);
  //new MySeq();  // Commentez cette ligne pour skip la calibration
  new Plant7(600, 500);
  // Vous pouvez lire la valeur de calibration dans la console et la remplacer dans la classe Mic pour le test
}

// Afficher les éléments du jeu via la Camera
void draw() {
  CameraManager.current.draw();
  Time.update();
}
