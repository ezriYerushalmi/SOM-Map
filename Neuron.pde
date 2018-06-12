

class Neuron { 
   float xPos;
   float yPos; 
   boolean isChange;
  float neuronWidth = 10 , neuronHeight = 10 ; 
  Neuron (float x, float y) {  
    xPos = x; 
    yPos = y; 
    isChange = false;
  } 
  
  void update(){
    stroke(255);
    if(isChange){
      fill(#50D14A);
    } else {
      fill(122, 10, 234);
    }
    rect(xPos, yPos , neuronWidth, neuronHeight);
  }
  
  void setIsChagne(boolean bool){
    isChange = bool; 
  }
  
} 
