import processing.sound.*;
public AudioIn mic;                   // mic est déclaré comme canal audio
public Amplitude amp;                 // idem, "amplitude" en audio ~= volume du son

//qq variables utilisées partout
public int niv_sol=100;
public color rouge = color(255, 0, 0);
public color noir = color(0);


void setup() {
  frameRate(60);
  size(1200, 600);
  
// init scène  
  Mic.init(this);
  new CameraFollow();
  new Intro(600, -50);
  new Musique(this);
}

// Afficher les éléments du jeu via la Camera
void draw() {
  CameraManager.current.draw();
}
