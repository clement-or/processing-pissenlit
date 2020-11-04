import processing.sound.*;

public class Musique extends RenderedObject { 

  SoundFile file;
  String Musique = ("aprilsun.wav");
  String path;

  Musique(PApplet p) {
    super();
    path = sketchPath(Musique);
    file = new SoundFile(p, path);
    file.play();
  }
}
