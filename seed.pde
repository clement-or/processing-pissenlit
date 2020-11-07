public class Seed extends RenderedObject {

  float gravity = random(1.7, 2.2);          // vitesse de chute
  float size = random(5, 10);                // rayon de la graine
  PVector speedMultiplier = new PVector(random(30, 70), random(30, 70));  // Remplace push_ratio_x et y
  boolean is_planted = false;                // Est-ce que la graine a été plantée ?
  
  boolean isFertile = true;                 // une graine isFertile pousse obligatoirement
  float growProb = 0.1;                         // Probabilité que la graine pousse

  Seed(float pos_x, float pos_y) {
    super();
    position.x = pos_x;
    position.y = pos_y;
    SeedManager.add(this);
  }

  private void physics() {
    // Si graine au-dessus du sol, elle descend
    if (position.y < height-niv_sol+size) {    
      position.y += gravity;
      
      float amplitude = Mic.getAmplitudeAbove();
      
      position.x += speedMultiplier.x * amplitude;
      position.y -= speedMultiplier.y * amplitude;
    }

    if (position.y >= height-niv_sol+size && !is_planted) {   // si touche sol, la plante pousse
      is_planted = true;
      
      float rnd = random(1);
      if (isFertile || rnd < growProb)
        createRandomPlant(position.x, position.y);
      
    }
  }

  public void draw() {
    // Si la graine a déjà été plantée, on ne fait rien
    if (is_planted) return;

    // D'abord on calcule la physique
    physics();

    // Après, on affiche la graine
    fill(noir);
    noStroke();
    circle(renderedPosition.x, renderedPosition.y, size);   // dessin graine
  }
  
  
  
  public RenderedObject createRandomPlant(float x, float y) {
    int rnd = (int)random(0, 4);
    //int rnd = 3;
    RenderedObject r = null;
  
    switch (rnd) {
    case 0:
      r = new Plant1(x, y);
      break;
  
    case 1:
      r = new Plant5(x, y);
      break;
  
    case 2:
      r = new Plant2(x, y);
      break;
  
    case 3:
      r = new Plant3(x, y);
      break;
    }
  
    return r != null ? r : null;
  }
}

public static class SeedManager {
  public static ArrayList<Seed> seeds = new ArrayList<Seed>();
  public static int maxSeeds = 10;

  public static void add(Seed s) {
    if (seeds.size() <= 15)
      seeds.add(s);
    else {
      s.isFertile = false;
      s.growProb = 0;
    }
  }
  
  public static void remove(Seed s) {
    for (int i = seeds.size() - 1; i >= 0; i--) {
      Seed seed = seeds.get(i);
      if (seed.equals(s))
        seeds.remove(i);
    }
  }
  
  public static Seed getFurthestSeed() {
    int prevX = 0;
    //println(seeds.size());
    if (seeds.size() == 0) return null;
    Seed returnSeed = seeds.get(0);
    
    for (int i = 0; i < seeds.size(); i++) {
      Seed seed = seeds.get(i);
      seed.isFertile = false;
      if (seed.position.x > prevX) {
        returnSeed = seed;
        prevX = (int)seed.position.x;
        returnSeed.isFertile = true;
      }
    }
    
    return returnSeed;
  }
  
}
