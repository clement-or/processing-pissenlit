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

// init audio
  mic = new AudioIn(this, 0);       // on n'utilise que le micro de gauche s'il y en a 2 
  mic.start();                      // on allume le micro
  amp = new Amplitude(this);
  amp.input(mic);                   // on va chercher l'amplitude du mic

// init scène
  new CameraFollow();
  new Intro(600, -50);
  new Musique(this);
}

// Afficher les éléments du jeu via la Camera
void draw() {
  CameraManager.current.draw();
}
