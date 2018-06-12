
void setup() {
  //fullScreen();
  size(1000, 1000);
  background(255);
  initArrays(); 
  
   stroke(0);
   fill(255);
   ellipse(circelCenterX, circelCenterY , circelWidth, circelHeight);
  updateNeuronByPoints();
  
}

void draw() {
 
   printShapes();
  // textSize(32);
   // text(indexItr,100,100);
   //updateNeuronByPoints();
   loop();
 
}


void initArrays(){
  for (int i = 0; i < inputArray.length; i++) {
  float a = random(0,1) * 2 * PI ; 
  float r = R * sqrt(random(0,1));
  float x = r * cos(a) + circelCenterX ;
  float y = r * sin(a) + circelCenterY;
  inputArray[i] = new IPoint (x,y);
  } 
  for (int i = 0; i < neuronArray.length; i++) {
    float a = random(0,1) * 2 * PI ; 
    float r = R * sqrt(random(0,1));
    float x = r * cos(a) + circelCenterX ;
    float y = r * sin(a) + circelCenterY;
    neuronArray[i] = new Neuron (x,y);
  }
}


void updateNeuronByPoints(){
   for (int i = 0; i < runIter; i++) {
    int randInputIndex = (int) random(0,inputArray.length);
    int bmuIndex = findBmuIndex(inputArray[randInputIndex]);
     updateNeurons(randInputIndex,bmuIndex); //<>//
    // printShapes();
   }
  
}


int findBmuIndex(IPoint point){
  float minDistance,tempDistance;
  int  minNeuronIndex ;
  minDistance = culcDistance(neuronArray[0], point);
  minNeuronIndex = 0;
  for(int i = 1; i < neuronArray.length ; i++){
    tempDistance = culcDistance(neuronArray[i], point);
    if(tempDistance < minDistance){
      minDistance = tempDistance;
      minNeuronIndex = i;
    }
  }
  return minNeuronIndex;
}



void updateNeurons(int pointIndex,int bmuIndex){
 //<>//
  neuronArray[bmuIndex].xPos += alpha * (inputArray[pointIndex].xPos - neuronArray[bmuIndex].xPos);
  neuronArray[bmuIndex].yPos += alpha * (inputArray[pointIndex].yPos - neuronArray[bmuIndex].yPos);
  float updateNighbor = alpha / 10 ; 
  int upIndex = bmuIndex + 1;
  int downIndex = bmuIndex - 1 ;
  //while(0 < downIndex && upIndex < neuronsSize && update > 0){
     if(upIndex < neuronsSize ){
       neuronArray[upIndex].xPos = updateNighbor * (inputArray[pointIndex].xPos - neuronArray[upIndex].xPos);
       neuronArray[upIndex].yPos = updateNighbor * (inputArray[pointIndex].yPos - neuronArray[upIndex].yPos);
     }
     if(0 < downIndex ){
        neuronArray[downIndex].xPos = updateNighbor * (inputArray[pointIndex].xPos - neuronArray[downIndex].xPos);
       neuronArray[downIndex].yPos = updateNighbor * (inputArray[pointIndex].yPos - neuronArray[downIndex].yPos);
     }
      //neuronArray[upIndex].setIsChagne(true);
      //neuronArray[bmuIndex].setIsChagne(true);
      //neuronArray[downIndex].setIsChagne(true);
     
     //upIndex ++;
     //downIndex --;
  //}
  
  //while(upIndex < neuronsSize && update > 0){
  //  neuronArray[upIndex].xPos +=  update;
  //   neuronArray[upIndex].yPos +=  update;
  //   upIndex ++;
  //} 
  //while(0 < downIndex  && update > 0){
  //    neuronArray[downIndex].xPos +=  update;
  //   neuronArray[downIndex].yPos +=  update;
  //   downIndex --;
  //}
}


float changeAxisPos(float inputAxis,float neournAxis,float alpha){
  float dist = inputAxis - neournAxis ; 
  if(dist < 0){
    return neournAxis - alpha ;
  } else {
    return neournAxis + alpha ;
  }

}


void printShapes(){
  for (int i = 0; i < inputArray.length; i++) {
      inputArray[i].update();
   }
   for (int i = 0; i < neuronArray.length; i++) {
      neuronArray[i].update();
   }
}


float culcDistance(Neuron n, IPoint p){
float distance ;
distance = sqrt(pow(n.xPos - p.xPos,2) +  pow(n.yPos - p.yPos,2));
return distance;
}
