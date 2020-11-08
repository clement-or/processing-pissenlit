public class Musique { 

  SoundFile file;
  String Musique = ("ReichTehillimIII.mp3");
  String path;

  Musique(PApplet p) {
    path = sketchPath(Musique);
    file = new SoundFile(p, path);
    file.play();
  }

}
