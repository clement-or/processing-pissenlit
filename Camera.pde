public class Camera { //<>// //<>// //<>//

  // La position de la caméra dans le monde 2D
  public PVector position = new PVector(0, 0);

  // La liste des objets que la caméra va afficher
  public ArrayList<RenderedObject> renderedObjects = new ArrayList<RenderedObject>();
  
  private ArrayList<RenderedObject> queuedObjects = new ArrayList<RenderedObject>();

  Camera() {
    if (CameraManager.current == null)
      CameraManager.current = this;
  }

  // Appellé à chaque frame
  public void draw() {
    // Nettoyer l'écran
    clear();
    decor();

    // Dessiner chaque objet 
    for (RenderedObject obj : renderedObjects) {                                                                                                                                                                                                                          
      obj.renderedPosition = obj.position.sub(this.position);
      //println(obj.renderedPosition + " / " + this.position);
      obj.draw();
    }
    
    // Ajouter les objets de la queue
    renderedObjects.addAll(queuedObjects);
    queuedObjects.clear();
    
  }

  // Vérifier si l'objet est visible par la caméra ou non
  // Inutile pour le moment
  public boolean isInBounds(RenderedObject obj) {
    PVector topLeft = this.position.sub(new PVector(width/2, height/2)); //<>// //<>// //<>//
    PVector bottomRight = this.position.add(new PVector(width/2, height/2));

    boolean tooFarLeft = obj.renderedPosition.x < topLeft.x;
    boolean tooFarUp = obj.renderedPosition.y < topLeft.y;
    boolean tooFarRight = obj.renderedPosition.x > bottomRight.x;
    boolean tooFarDown = obj.renderedPosition.y > bottomRight.y;

    return tooFarLeft || tooFarUp || tooFarRight || tooFarDown;
  }

  // Ajouter un objet aux objets que la caméra va dessiner
  // uniquement après la boucle for
  public void add(RenderedObject obj) {
    queuedObjects.add(obj);
  }
}


// Pattern Singleton
// Permet d'accéder à la caméra de n'importe quel script
// En faisant : CameraManager.current;
public static class CameraManager {

  public static Camera current;

  CameraManager() {
  }
}
