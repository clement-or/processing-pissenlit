//qq variables utilisées partout
public int niv_sol=100;
public color rouge = color(255, 0, 0);
public color noir = color(0);

void setup() {
  // Forcer un framerate constant
  frameRate(60);
  size(1200, 600);

  mic = new AudioIn(this, 0);       // on n'utilise que le micro de gauche s'il y en a 2 :/
  mic.start();                      // on allume le micro
  amp = new Amplitude(this);
  amp.input(mic);                   // on va chercher l'amplitude du mic

  // Création des objets du jeu, temporaire
  // On aura plus tard une classe qui gérera ça
  new CameraFollow();
  //new Plant1(600, 500);
  //new Plant_start(600, 500);
  new Intro(600, -50);
  //new Icones(600,50);
  //Plant_start(600, 500);
  new Musique(this);

}

// Afficher les éléments du jeu via la Camera
void draw() {
  CameraManager.current.draw();
}
