class IPoint { 
  private float xPos;
  private float yPos; 
  private float pointWidth = 10 ;
  private float pointHeight = 10 ; 
  IPoint (float x, float y) {  
    xPos = x; 
    yPos = y; 
  } 
  
  void update(){
    fill(255);
    stroke(190, 32, 73);
    ellipse(xPos, yPos , pointWidth, pointHeight);
  }

} 
