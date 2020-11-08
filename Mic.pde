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
    if (autoStart) start();
  }
  
  public void draw() {
    if (paused) return; //<>//
    
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
  color textColor = color(0, 0, 0);
  float opacity = 0;
  float size;
  float elapsedTime = 0;
  float textWidth;
  public boolean fadeIn = true;
  
  public Text(String text, float size, float xPos, float yPos) {
    super();
    this.text = text;
    font = createFont("Roboto-Thin.ttf", size);
    position.x = xPos;
    position.y = yPos;
    textWidth = text.length() * size;
    culling = false;
  }
  
  public void draw() {
    elapsedTime += Time.deltaTime;
    if (fadeIn)
      opacity = EasingFunctions.easeInOutCubic(elapsedTime) * 10;
    else
      opacity = 255 - EasingFunctions.easeInOutCubic(elapsedTime) * 10; //<>//
    opacity = constrain(opacity, 0, 255);
    
    fill(color(red(textColor), green(textColor), blue(textColor), opacity));
    textFont(font);
    text(this.text, position.x - textWidth/4, position.y - size/2);
  }
  
  public void fadeOut() {
    elapsedTime = 0;
    fadeIn = false;
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
      
      
      
      new TimedElement () {
        ProgressBar p = new ProgressBar(width/2, height/2, 300, 30);
        Timer t;
        
        public void setup() {
          p.maxValue = 5;
          p.value = 0;
          t = new Timer(this);
          t.waitTime = 5;
          t.start();
        }
        public void update() {
          p.value = 5 - t.timeLeft;
        }
        public void onTimeout() { 
          p.culling = true;
          p.position.x = -100;
          nextElement(); 
        }
      },
      
      
      
      new TimedElement () {
        Text text;
        public void setup() {
          text = new Text("Good, this is working.", 48, width/2, height/2);
          text.opacity = .00001;
        }
        public void update() { 
          if (text.opacity >= 255)
            text.fadeOut();
          if (text.opacity <= 0) {
            text.culling = true;
            text.position.x = -1000;
            nextElement();
          }
        }
        public void onTimeout() { }
      },
      
      
      
      new TimedElement () {
        public void setup() {
          println("This is the end");
        }
        public void update() { }
        public void onTimeout() { }
      },
      
    };
  }
}
