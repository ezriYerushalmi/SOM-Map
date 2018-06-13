void updateNeuronsByCircular(int pointIndex,int bmuIndex){
int upIndex = bmuIndex + 1;
  int downIndex = bmuIndex - 1 ;
  int counterUpdate = 1 ; 
  float updateNighbor = 0; 
  
  for(int i = 1; i <= neuronsToUpdate ; i++ ){
    if(i == 1){
        updateNeuronsWeights(bmuIndex , pointIndex , alpha) ;
    } else{
      if (downIndex < 0 ){
         downIndex = neuronsSize - 1 ; 
      }
      upIndex = upIndex % (neuronsSize - 1 );
      updateNighbor = alpha / (i); 
      updateNeuronsWeights(downIndex , pointIndex , updateNighbor) ;
      updateNeuronsWeights(upIndex , pointIndex , updateNighbor) ;
      upIndex ++;
      downIndex -- ;
    }
      
       println("num itr: " +itrIndex + 
       " counterUpdate: " + i 
       + " BMU: " + bmuIndex 
       + " downIndex: " + downIndex 
       + " upIndex: " + upIndex 
       + " updateNighbor: " + updateNighbor );
  }

}

void updateNeuronsByLinear(int pointIndex,int bmuIndex){
int upIndex = bmuIndex + 1;
  int downIndex = bmuIndex - 1 ;
  int counterUpdate = 1 ; 
  float updateNighbor = 0; 
  
  for(int i = 1; i <= neuronsToUpdate ; i++ ){
    if(i == 1){
        updateNeuronsWeights(bmuIndex , pointIndex , alpha) ;
    } else{
       updateNighbor = alpha / (i + 1); 
      if (0 < downIndex){
         updateNeuronsWeights(downIndex , pointIndex , updateNighbor) ;
         downIndex -- ;
      }
      if(upIndex < neuronsSize){
       updateNeuronsWeights(upIndex , pointIndex , updateNighbor) ;
       upIndex ++;
      }
    
    }
      
       println("num itr: " +itrIndex + 
       " counterUpdate: " + counterUpdate 
       + " BMU: " + bmuIndex 
       + " downIndex: " + downIndex 
       + " upIndex: " + upIndex 
       + " updateNighbor: " + updateNighbor );
  }

}
