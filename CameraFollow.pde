public class CameraFollow extends Camera {
  
  RenderedObject target;
  float followMargin = 5;
  float speed = 2;
  float cameraShakeScale = 1;
  
  
  CameraFollow() {
    super();
  }
  
  public void draw() {
    super.draw();
    doMovement();
  }
  
  private void doMovement() {
    // Si la caméra est trop loin de sa cible, se rapprocher
    if (!isNearTarget() || true) {
      PVector tPos = new PVector(target.position.x, target.position.y);
      PVector newPos = tPos.sub(new PVector(width/2, height/2));
      //this.position = newPos;
      this.position = PVector.lerp(this.position, newPos, .1);
    }
  }
  
  private boolean isNearTarget() {
    return target != null ? target.position.sub(this.position).mag() < this.followMargin : true;
  }
}
