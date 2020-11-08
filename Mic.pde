public static class Mic {
  public static float blowThreshold = .18;
  
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
  
  public static ArrayList<Float> silenceSamples = new ArrayList<Float>();
  public static void recordSilence() {
    silenceSamples.add(amplitude.analyze());
  }
  
  public static ArrayList<Float> blowSamples = new ArrayList<Float>();
  public static void recordBlow() {
    blowSamples.add(amplitude.analyze());
  }
  
  public static void calibrate() {
    float averageSilence = 0;
    for (int i = 0; i < silenceSamples.size(); i++) {
      averageSilence += silenceSamples.get(i);
    }
    averageSilence /= silenceSamples.size();
    
    float averageBlow = 0;
    for (int i = 0; i < blowSamples.size(); i++) {
      averageBlow += blowSamples.get(i);
    }
    averageBlow /= blowSamples.size();
    
    blowThreshold = (averageSilence + averageBlow) / 2;
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
    if (autoStart) start();
  }
  
  public void draw() {
    if (paused) return;
    
    float elapsedTime = (millis() - startMillis)/1000;
    timeLeft = waitTime - elapsedTime;
    
    if (timeLeft <= 0) {
      stop();
      timeLeft = waitTime;
      timeoutCallback.onTimeout();
    }
  }
  
  public void start() {
    if (!paused) return;
    
    startMillis = millis();
    paused = false;
    timeLeft = waitTime;
  }
  
  public void resume() {
    if (!paused) return;
    
    paused = false;
  }

  public void stop() {
    if (paused) return;
    
    paused = true;
  }
}



public class ProgressBar extends RenderedObject {
  public float value = 0;
  public float maxValue = 3;
  
  PVector size = new PVector(0, 0);
  color barColor = rouge;
  float borderWidth = 5;
  
  ProgressBar(int xPos, int yPos, int xSize, int ySize) {
    position = new PVector(xPos, yPos);
    size = new PVector(xSize, ySize);
    culling = false;
  }

  public void draw() {
    value += .01;
    
    // Bloquer la valeur entre 0 et max
    value = constrain(value, 0, maxValue);
    
    // Calculer la position du coin haut gauche
    renderedPosition = new PVector(position.x - size.x/2, position.y - size.y/2);
    
    // Calculer la largeur de la barre de remplissage
    float barWidth = (value * size.x) / maxValue;
    
    // Dessiner la barre
    noStroke();
    fill(rouge);
    rect(renderedPosition.x, renderedPosition.y, barWidth, size.y);
    
    // Dessiner la bordure par dessus
    stroke(0, 0, 0);
    strokeWeight(borderWidth);
    noFill();
    rect(renderedPosition.x, renderedPosition.y, size.x, size.y);
    noStroke();
    strokeWeight(0);
  }
}

public class Text extends RenderedObject {
  
  PFont font;
  String text;
  color textColor = color(0, 0, 0, 0);
  float opacity = 0;
  float size;
  float textWidth;
  
  public Text(String text, float size, float xPos, float yPos) {
    super();
    this.text = text;
    font = createFont("Roboto-Thin.ttf", size);
    position.x = xPos;
    position.y = yPos;
    textWidth = text.length() * size;
    culling = false;
  }
  
  public Text(String text, float size, float xPos, float yPos, float o) {
    super();
    opacity = o;
    this.text = text;
    font = createFont("Roboto-Thin.ttf", size);
    position.x = xPos;
    position.y = yPos;
    textWidth = text.length() * size;
    culling = false;
  }
  
  public void draw() {
    opacity = constrain(opacity, 0, 255); //<>//
    
    fill(color(red(textColor), green(textColor), blue(textColor), opacity));
    textFont(font);
    text(this.text, position.x - textWidth/4, position.y - size/2);
  }
  
}

public static class EasingFunctions {
  
  public static float linear(float t) { return t; }
  
  public static float easeInOutCubic(float t) { return t<.5 ? 4*t*t*t : (t-1)*(2*t-2)*(2*t-2)+1; }
  
  public static float easeOutCubic(float t) { return (--t)*t*t+1; }
  
  public static float easeInCubic(float t) { return t*t*t; }
}



public static class Time {
  
  public static PApplet app;
  public static float prevMillis = 0;
  public static float deltaTime = 0;
  
  public static void init(PApplet a) {
    app = a;
  }
  
  public static void update() {
    deltaTime = (app.millis() - prevMillis)/1000;
    prevMillis = app.millis();
  }
}



public class TimedSequence extends RenderedObject {
  protected TimedElement[] elements;
  private int curIndex = 0;
  public boolean paused = false;
  public boolean hasBeenSetup = false;
  
  TimedSequence() {
    super();
    culling = false;
  }
  
  public void draw() {
    if (paused) return;
    TimedElement cur = elements[curIndex];
    if (!hasBeenSetup) {
      cur.setup();
      hasBeenSetup = true;
    }
    cur.update();
  }
  
  public void nextElement() {
    if (curIndex < elements.length - 1) {
      curIndex++;
      hasBeenSetup = false;
    } else paused = true;
  }
}

public interface TimedElement extends TimeoutCallback {
  public void update();
  public void setup();
  public void onTimeout();
}

public class MySeq extends TimedSequence {
  
  public MySeq() {
    super();
    
    elements = new TimedElement[] {
      
      new TimedElement() {
        public void setup() { Timer t = new Timer(this); t.start(); }
        public void update() {}
        public void onTimeout() { nextElement();}
      },
      
      new TimedElement () {
        Text text;
        int step = 0;
        Timer t;
        float time = 0;
        
        public void setup() { 
          text = new Text("Bienvenue", 48, width/2, height/2, 0);
          text.opacity = 0;
        }
        public void update() {
          switch (step) {
            case 0:
              time += Time.deltaTime;
              text.opacity = EasingFunctions.easeInCubic(time) * 100;
              if (text.opacity >= 255)
                step++;
              break;
            case 1:
              if (t != null) break;
              time = 0;
              t = new Timer(this);
              t.start();
              break;
            case 2:
              time += Time.deltaTime;
              text.opacity = 255 - EasingFunctions.easeInCubic(time) * 100;
              if (text.opacity <= 0) {
                text.culling = true;
                text.position.x = -1000;
                nextElement();
              }
              break;
          }
          
        }
        public void onTimeout() { step++;}
      },
      
      
      
      new TimedElement () {
        Text text;
        int step = 0;
        Timer t;
        float time = 0;
        
        public void setup() { 
          text = new Text("Faites le silence", 48, width/2, height/2, 0);
          text.opacity = 0;
        }
        public void update() {
          switch (step) {
            case 0:
              time += Time.deltaTime;
              text.opacity = EasingFunctions.easeInCubic(time) * 100;
              if (text.opacity >= 255)
                step++;
              break;
            case 1:
              if (t != null) break;
              time = 0;
              t = new Timer(this);
              t.start();
              break;
            case 2:
              time += Time.deltaTime;
              text.opacity = 255 - EasingFunctions.easeInCubic(time) * 100;
              if (text.opacity <= 0) {
                text.culling = true;
                text.position.x = -1000;
                nextElement();
              }
              break;
          }
          
        }
        public void onTimeout() { step++; }
      },
      
      
      new TimedElement() {
        ProgressBar p;
        Timer t;
        ProgressBar s;
        
        public void setup() {
          t = new Timer(this);
          t.start();
          t.waitTime = 5;
          p = new ProgressBar(width/2, height/2, 300, 30);
          s = new ProgressBar(width/2, height/2 + 100, 100, 10);
          s.maxValue = 1;
          s.borderWidth = 3;
          p.value = 0;
          p.maxValue = 5;
        }
        public void update() {
          p.value = 5 - t.timeLeft;
          Mic.recordSilence();
          s.value = Mic.getAmplitude();
        }
        public void onTimeout() { 
          nextElement();
          s.culling = true;
          s.position.x = -1000;
          p.culling = true;
          p.position.x = -1000;
        }
      },
      
      
      
      new TimedElement () {
        Text text;
        int step = 0;
        Timer t;
        float time = 0;
        
        public void setup() { 
          text = new Text("Maintenant, soufflez", 48, width/2, height/2, 0);
          text.opacity = 0;
        }
        public void update() {
          switch (step) {
            case 0:
              time += Time.deltaTime;
              text.opacity = EasingFunctions.easeInCubic(time) * 100;
              if (text.opacity >= 255)
                step++;
              break;
            case 1:
              if (t != null) break;
              time = 0;
              t = new Timer(this);
              t.start();
              break;
            case 2:
              time += Time.deltaTime;
              text.opacity = 255 - EasingFunctions.easeInCubic(time) * 100;
              if (text.opacity <= 0) {
                text.culling = true;
                text.position.x = -1000;
                nextElement();
              }
              break;
          }
          
        }
        public void onTimeout() { step++; }
      },
      
      
      new TimedElement() {
        ProgressBar p;
        Timer t;
        ProgressBar s;
        
        public void setup() {
          t = new Timer(this);
          t.start();
          t.waitTime = 5;
          p = new ProgressBar(width/2, height/2, 300, 30);
          s = new ProgressBar(width/2, height/2 + 100, 100, 10);
          s.borderWidth = 3;
          s.maxValue = 1;
          p.value = 0;
          p.maxValue = 5;
        }
        public void update() {
          p.value = 5 - t.timeLeft;
          Mic.recordBlow();
          s.value = Mic.getAmplitude();
        }
        public void onTimeout() { 
          nextElement();
          s.culling = true;
          s.position.x = -1000;
          p.culling = true;
          p.position.x = -1000;
          Mic.calibrate();
          println("Seuil de souffle : " + Mic.blowThreshold);
          println("Assignez cette valeur à Mic.blowThreshold pour tester sans avoir à lancer la séquence d'intro.");
          new Intro(600, -50);
        }
      },
      
    };
  }
}
