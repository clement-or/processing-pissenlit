public class RenderedObject {
  public PVector position = new PVector(0, 0);
  public PVector renderedPosition = new PVector(0, 0);
  public boolean culling = true;

  RenderedObject() {
    if (CameraManager.current != null)
      CameraManager.current.add(this);
  }

  public void draw() {
    print("Un objet qui hérite de RenderedObject doit avec une fonction public void draw()");
  }
}
