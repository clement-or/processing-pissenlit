public class Musique { 

  SoundFile file;
  String Musique = ("aprilsun.wav");
  String path;

  Musique(PApplet p) {
    path = sketchPath(Musique);
    file = new SoundFile(p, path);
    file.play();
  }

}
