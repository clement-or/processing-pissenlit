public class Camera { 

  // La position de la caméra dans le monde 2D
  public PVector position = new PVector(0, 0);

  // La liste des objets que la caméra va afficher
  public ArrayList<RenderedObject> renderedObjects = new ArrayList<RenderedObject>();

  private ArrayList<RenderedObject> queuedObjects = new ArrayList<RenderedObject>();

  Background background = new Background();

  Camera() {
    if (CameraManager.current == null)
      CameraManager.current = this;
  }

  // Appellé à chaque frame
  public void draw() {
    // Nettoyer l'écran
    clear();

    // Dessiner le fond
    background.renderedPosition = background.position.sub(this.position);
    background.draw();

    // Dessiner chaque objet 
    for (RenderedObject obj : renderedObjects) {                                                                                                                                                                                                                          
      obj.renderedPosition = obj.position.sub(this.position);
      //println(obj.renderedPosition + " / " + this.position);
      
      if (!obj.culling || isInBounds(obj)) {
        if (!obj.disabled)
          obj.draw();
      } else if (obj instanceof Seed) {
        SeedManager.remove((Seed)obj);
      }
    }

    // Ajouter les objets de la queue
    renderedObjects.addAll(queuedObjects);
    queuedObjects.clear();
  }

  // Vérifier si l'objet est visible par la caméra ou non
  // Inutile pour le moment
  public boolean isInBounds(RenderedObject obj) {
    return obj.renderedPosition.x >= -width/4; 
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
