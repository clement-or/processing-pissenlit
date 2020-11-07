public static class Mic {
  public static float blowThreshold = .1;
  
  public static AudioIn audioIn;
  public static Amplitude amplitude;
  
  public static void init(PApplet app) {
    Mic.audioIn = new AudioIn(app, 0);
    Mic.audioIn.start();
    Mic.amplitude = new Amplitude(app);
    Mic.amplitude.input(audioIn);   
  }
  
  // Renvoie true/false si l'utilisateur souffle
  public static boolean isBlowing() {
    return Mic.amplitude.analyze() > blowThreshold;
  }
  
  // Renvoie l'amplitude du micro
  public static float getAmplitude() {
    return Mic.amplitude.analyze();
  }
  
  // Renvoie l'amplitude si l'utilisateur souffle, ou zéro
  public static float getAmplitudeAbove() {
    return isBlowing() ? getAmplitude() : 0;
  }
}
