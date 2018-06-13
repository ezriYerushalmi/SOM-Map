
void setup() {
  //fullScreen();
    size(1000, 1000);
    switch (running){
    case 1:
      initArraysUniformi(); 
      break;
    case 2:
      initArraysNotUniform();
      break;
    case 3:
      initArraysNotUniformQurter();
      break;
    
    }
    
    background(255);
    stroke(0);
    fill(255);
    ellipse(circelCenterX, circelCenterY , circelWidth, circelHeight);
    frameRate(1000000000);
}

void draw() {

   if(itrIndex < runIter){
     background(255);
     stroke(0);
     fill(255);
     ellipse(circelCenterX, circelCenterY , circelWidth, circelHeight);
     updateNeuronByPoints();
     printNeurons();
     textSize(32);
     text(itrIndex + 1,50,50);
     itrIndex ++;
     printInputs();
     if(itrIndex %  decAlphaByItr == 0){
       alpha = alpha / 1.2 ;
     }
     if(itrIndex %  decNeuronsByItr == 0){
      neuronsToUpdate -- ;
      println("neuronsToUpdate: " + neuronsToUpdate);
     }
   } else {
      noLoop();   
   }
 
}

 void initArraysNotUniformQurter(){
    int index = 0 ; 
    for (int i = 0; i < inputArray.length * primeryProb; i++, index++) {
      float a = random(0, 1) * 2 * PI;
      float r = R * sqrt(random(beginCNU1,endCNU1));
      float x = r * cos(a);
      float y = r * sin(a);
      x += 500;
      y += 500;
      float rand = random(707, 1848);
      while ((dist(x, y, px1, py1) + dist(x, y, px2, py2))<= rand) {
        a = random(0, 1) * 2 * PI;
        r = R * sqrt(random(beginCNU2,endCNU2));
        x = r * cos(a);
        y = r * sin(a);
        x += 500;
        y += 500;
      }
      inputArray[index] = new IPoint (x,y);
    }
    int size = inputArray.length - index ; 
    for (int i = 0; i < size; i++, index++) {
      float a = random(0.5,1) * 2 * PI ; 
      float r = (R * sqrt(random(beginCNU2,endCNU2)) * scatteringShapes) ;
      float x = r * cos(a) + circelCenterX ;
      float y = r * sin(a) + circelCenterY;
      inputArray[index] = new IPoint (x,y);
    }
    
    initNeoruns();
    
  }
   
    
  
    



   
 void initArraysNotUniform(){
    int index = 0 ; 
    for (int i = 0; i < inputArray.length * primeryProb; i++, index++) {
      float a = random(0,1) * 2 * PI ; 
      float r = (R * sqrt(random(beginCNU1,endCNU1)) * scatteringShapes) ;
      float x = r * cos(a) + circelCenterX ;
      float y = r * sin(a) + circelCenterY;
    inputArray[index] = new IPoint (x,y);
    } 
    int size = inputArray.length - index ; 
    for (int i = 0; i < size; i++, index++) {
      float a = random(0,1) * 2 * PI ; 
      float r = (R * sqrt(random(0,1)) * scatteringShapes) ;
      float x = r * cos(a) + circelCenterX ;
      float y = r * sin(a) + circelCenterY;
      inputArray[index] = new IPoint (x,y);
    } 
   
    initNeoruns();
  
    
}

void initNeoruns(){
  for (int i = 0; i < neuronArray.length; i++) {
      float a = random(0,1) * 2 * PI ; 
      float r = (R * sqrt(random(beginCNU1,endCNU1)) * scatteringShapes) ;
      float x = r * cos(a) + circelCenterX ;
      float y = r * sin(a) + circelCenterY;
      neuronArray[i] = new Neuron (x,y);
   } 

}



void initArraysUniformi(){
  for (int i = 0; i < inputArray.length; i++) {
  float a = random(0,1) * 2 * PI ; 
  float r = (R * sqrt(random(beginC,endC)) * scatteringShapes) ;
  float x = r * cos(a) + circelCenterX ;
  float y = r * sin(a) + circelCenterY;
  inputArray[i] = new IPoint (x,y);
  } 
  initNeoruns();
}


void updateNeuronByPoints(){
 
    int randInputIndex = (int) random(0,inputArray.length);
    int bmuIndex = findBmuIndex(inputArray[randInputIndex]);
     updateNeurons(randInputIndex,bmuIndex); //<>//
  
  
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



void updateNeurons(int pointIndex,int bmuIndex){ //<>//
 switch(mode){
  case 1:
    updateNeuronsByLinear( pointIndex, bmuIndex);
    break;
  
  case 2: 
    updateNeuronsByCircular( pointIndex, bmuIndex);
    break;
 }
  
}




void updateNeuronsWeights(int neuIndex, int pIndex , float update ){
  neuronArray[neuIndex].xPos += update * (inputArray[pIndex].xPos - neuronArray[neuIndex].xPos);
  neuronArray[neuIndex].yPos += update * (inputArray[pIndex].yPos - neuronArray[neuIndex].yPos);
}

float changeAxisPos(float inputAxis,float neournAxis,float alpha){
  float dist = inputAxis - neournAxis ; 
  if(dist < 0){
    return neournAxis - alpha ;
  } else {
    return neournAxis + alpha ;
  }

}

void printInputs(){
 for (int i = 0; i < inputArray.length; i++) {
      inputArray[i].update();
   }
}


void printNeurons(){

   for (int i = 0,j = 1; j < neuronArray.length ; i++, j++) {
      neuronArray[i].update();
      stroke(140);
      line( neuronArray[i].xPos, neuronArray[i].yPos, neuronArray[j].xPos, neuronArray[j].yPos);
   }
   int last = neuronArray.length - 1;
    neuronArray[last].update();
    if(mode != 1){
      stroke(140);
      line( neuronArray[last].xPos, neuronArray[last].yPos, neuronArray[0].xPos, neuronArray[0].yPos);
    }
}


float culcDistance(Neuron n, IPoint p){
  float distance ;
  distance = sqrt(pow(n.xPos - p.xPos,2) +  pow(n.yPos - p.yPos,2));
  return distance;
}
