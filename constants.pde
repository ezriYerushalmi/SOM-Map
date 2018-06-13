//frame
float circelWidth = 1000;
float circelHeight = 1000;
float circelCenterX = 500;
float circelCenterY  = 500;
int R = 500;
float scatteringShapes = 1 ; 

//data
int inputsSize = 500 ; 
int neuronsSize = 200 ; 
IPoint [] inputArray = new  IPoint [inputsSize] ; 
Neuron [] neuronArray = new Neuron [neuronsSize];

//learning rate
float alpha = 0.8 ;

//iterations
int itrIndex = 0 ;
int runIter = 10000;
int decAlphaByItr = 1000;
int decNeuronsByItr = 1000 ; 
int neuronsToUpdate = 100;

//begin - end for random inputs raduis 
float endC = 1;
float beginC = 0.9 ;

//Q.3 init params
float beginCNU1 = 0.5 ;
float endCNU1 = 1;

float beginCNU2 = 0.5 ;
float endCNU2 = 1;

float primeryProb = 0.7 ; 
float seconderyProb = 0.3 ; 

//Q.4 add init prams 

float px1=500;
float py1=0;
float px2=1000;
float py2=500;



//Mode 1 - linear , 2 - circular  
int mode = 2 ; 

// running 1 - uniformi , 2 - not uniformi To Perimeter ,  2 - not uniformi to (1,0) and (0,1)
int running = 3 ; 
