int CenterX;
int CenterY;
PImage Nucleus;
color Red = color(255,0,32);
color Blue = color(30,135,180);
float InnerCircle = 400;
float OuterCircle = 1000;
float ElectronSize = 60;

int RedElectron = 2;
int BlueElectron = 8;

String[] Data;

void setup() {
  fullScreen();
  CenterX = width/2;
  CenterY = height/2;
  imageMode(CENTER);
  
  Data = loadStrings("Data.csv");
  for(int i=0; i < Data.length; i++){
    String[] dataItems = split(Data[i], ",");
    
    printArray(dataItems);

  }
  }

void draw()
{
  background(0);
  Nucleus = loadImage("Nucleus.png");
  image(Nucleus,CenterX,CenterY);
  
  strokeWeight(20);
  stroke(255);
  noFill();
  circle(CenterX,CenterY,InnerCircle); 
  
  strokeWeight(20);
  stroke(255);
  noFill();
  circle(CenterX,CenterY,OuterCircle); 
  
  for(int i=0; i < RedElectron; i++){
    float x = electronX(i, RedElectron, InnerCircle);
    float y = electronY(i, RedElectron, InnerCircle);
    fill(Red);
    stroke(255);
    strokeWeight(3);
    circle(x, y, ElectronSize);
  }
  
  for(int i=0; i < BlueElectron; i++){
    float x = electronX(i, BlueElectron, OuterCircle);
    float y = electronY(i, BlueElectron, OuterCircle);
    fill(Blue);
    stroke(255);
    strokeWeight(3);
    circle(x, y, ElectronSize);
  }
}

// Position of electron i out of count, evenly spaced around a ring
float electronX(int i, int count, float diameter){
  float angle = TWO_PI * i / count - HALF_PI;
  return CenterX + cos(angle) * diameter / 2;
}

float electronY(int i, int count, float diameter){
  float angle = TWO_PI * i / count - HALF_PI;
  return CenterY + sin(angle) * diameter / 2;
}

void mousePressed(){
  // Check red electrons
  for(int i=0; i < RedElectron; i++){
    float x = electronX(i, RedElectron, InnerCircle);
    float y = electronY(i, RedElectron, InnerCircle);
    if(dist(mouseX, mouseY, x, y) < ElectronSize/2){
      electronPressed(Red, i);
      return;
    }
  }
  
  // Check blue electrons
  for(int i=0; i < BlueElectron; i++){
    float x = electronX(i, BlueElectron, OuterCircle);
    float y = electronY(i, BlueElectron, OuterCircle);
    if(dist(mouseX, mouseY, x, y) < ElectronSize/2){
      electronPressed(Blue, i);
      return;
    }
  }
}


void electronPressed(color c, int index){
  
}
