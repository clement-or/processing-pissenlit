public class CameraFollow extends Camera {
  public float speed = 1;
  public int followMargin = 1;
  
  public RenderedObject targetObj;
  public PVector targetPos;
  private PVector oldTargetPos = new PVector(0,0);
  
  CameraFollow() {
    super();
  }
  
  public void draw() {
    super.draw();
    
    // Get the target object position
    if (targetObj != null)
      targetPos = targetObj.position;
    
    if (targetPos != null)
      if (!isNear(targetPos)) {
        int dx = (int)(targetPos.x - (position.x + width/2));
        position.x = dx * 0.05;
      }
      
  }
  
  
  
  private boolean isNear(PVector pos) {
    int center = round(position.x + width/2);
    int dist = (int)abs(targetPos.x - center);
    return dist < followMargin;
  }
}
