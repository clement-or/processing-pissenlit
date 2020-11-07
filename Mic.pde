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


public interface TimeoutCallback{
  void onTimeout();
}

public class Timer extends RenderedObject {
  public float waitTime = 1;
  private float timeLeft = 1;
  
  public boolean oneShot = true;
  public boolean autoStart = false;
  public boolean paused = true;
  
  public TimeoutCallback timeoutCallback;
  
  private float startMillis;
  
  Timer(TimeoutCallback callback) {
    super();
    culling = false;
    timeoutCallback = callback;
    if (autoStart) Start();
  }
  
  public void draw() {
    if (paused) return; //<>//
    
    float elapsedTime = (millis() - startMillis)/1000;
    timeLeft = waitTime - elapsedTime;
    
    if (timeLeft <= 0) {
      Stop();
      timeLeft = waitTime;
      timeoutCallback.onTimeout();
    }
  }
  
  public void Start() {
    if (!paused) return;
    
    startMillis = millis();
    paused = false;
    timeLeft = waitTime;
  }
  
  public void Resume() {
    if (!paused) return;
    
    paused = false;
  }

  public void Stop() {
    if (paused) return;
    
    paused = true;
  }
}
