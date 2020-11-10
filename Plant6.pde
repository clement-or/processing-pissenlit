import java.util.Map;

public class Plant6 extends RenderedObject {
  private float timer = 0;
  private float flowerHeight;
  
  private float curHeight = 0;
  
  private int petalCount = 4;
  
  private ArrayList<Petal> petals = new ArrayList<Petal>();
  private ArrayList<Branch> branches = new ArrayList<Branch>();
  
  private HashMap<Branch, Petal> petalMap = new HashMap<Branch, Petal>();
  
  Plant6(int positionX, int positionY, int flowerHeight) {
    super();
    position = new PVector(positionX, positionY);
    this.flowerHeight = flowerHeight;
    //new Petal(position, 60, 3);
    
    petalCount = round(random(1, 6));
    
    // Créer les pétales
    int petalRadius = 100/petalCount;
    for (int i = 1; i <= petalCount; i++) {
      float yPos = position.y - i * (flowerHeight/(petalCount+1));
      PVector pos = new PVector(position.x + petalRadius*2 * (i%2==0 ? -1 : 1), yPos);
      
      Petal p = new Petal(pos, petalRadius, .3);
      Branch b = new Branch(new PVector(position.x, yPos + (flowerHeight/(2*(petalCount+1)))), pos);
      petalMap.put(b, p);
    }
  }
  
  SeedOnPlant sop;
  
  public void draw() {
    if (curHeight < flowerHeight)
      curHeight += .01 * (flowerHeight/3);   // Je veux que la fleur pousse en 2 secondes donc je divise par 2+1
    else if (sop == null)
      sop = new SeedOnPlant(position.x, position.y - flowerHeight, 0, 40);
    
    // Dessiner la partie tigeuse de la plante
    stroke(noir);
    strokeWeight(3);
    fill(noir);
    line(renderedPosition.x, renderedPosition.y, renderedPosition.x, renderedPosition.y - curHeight);
    
    // Vérifier si les branches ont poussé ou pas
    for (Map.Entry<Branch, Petal> entry : petalMap.entrySet()) {
      Petal p = entry.getValue();
      Branch b = entry.getKey();
      
      b.isGrowing = renderedPosition.y - curHeight <= b.position.y || b.isGrowing;
      p.isGrowing = b.finished || p.isGrowing;
    }
    
    timer += Time.deltaTime;
  }
  
  
  
  
  private class Petal extends RenderedObject {
    
    public boolean isGrowing = false;
    
    private float growTime = 1; // Secondes
    private float radius = 30;  // Pixels
    private float innerRadius;
    private float innerRadiusPercent = .7;
    
    private float curRadius = 0;
    private float timer = 0;
    
    Petal(PVector position, float size, float time) {
      this.position = position;
      this.growTime = time;
      this.radius = size;
      this.innerRadius = innerRadiusPercent * this.radius;  // 90% du rayon de la pétale
    }
    
    public void draw() {
      if (!isGrowing) return;
      
      // Faire grandir le rayon
      if (curRadius <= radius) {
        curRadius = timer * (radius/(growTime+1));
      }
      
      // Dessiner la partie noire
      noStroke();
      fill(noir);
      arc(renderedPosition.x, renderedPosition.y - curRadius, //<>// //<>//
          curRadius*2, curRadius*2,
          0, PI);
      
      // Dessiner la partie rouge par dessus
      fill(rouge);
      float offset = (1.1*curRadius)/2;
      arc(renderedPosition.x, renderedPosition.y - curRadius,
          innerRadiusPercent * curRadius * 2, innerRadiusPercent * curRadius * 2,
          0, PI);
          
      timer += Time.deltaTime; // Pixels/secondes
    }
  }
  
  
  
  
  private class Branch extends RenderedObject {
    public PVector endOffset;
    private PVector curOffset = new PVector(0, 0);
    private float timer = 0;
    public boolean isGrowing = false;
    
    private boolean finished = false;
    
    Branch(PVector pos, PVector endPos) {
      position = pos;
      endOffset = new PVector(endPos.x - pos.x, endPos.y - pos.y);
    }
    
    public void draw() {
      if (!isGrowing) return;
      
      // Vérifier si ça a fini de pousser
      PVector dist = new PVector(endOffset.x, endOffset.y);
      dist.sub(curOffset);
      
      finished = dist.mag() < 2 || finished;
      
      // Faire grandir la branche
      curOffset.lerp(endOffset, .1);
      
      // Dessiner la branche
      noFill();
      stroke(noir);
      strokeWeight(3);
      PVector renderedEnd = new PVector(renderedPosition.x + curOffset.x, renderedPosition.y + curOffset.y);
      
      bezier(renderedPosition.x, renderedPosition.y,
             renderedEnd.x - curOffset.x/2, renderedPosition.y,
             renderedEnd.x, renderedEnd.y - curOffset.y/2,
             renderedEnd.x, renderedEnd.y);
      
      timer = Time.deltaTime;
    }
  }
  
  
}
