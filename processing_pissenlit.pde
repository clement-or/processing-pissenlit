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
  new Musique(this);
  //new ProgressBar(width/2, height/2, 500, 10);
  t = new Text("This is a test", 48, width/2, height/2);
  //new MySeq();
}

// Afficher les éléments du jeu via la Camera
void draw() {
  CameraManager.current.draw();
  Time.update();
  
  if (t.opacity >= 255)
    t.fadeOut();
}
