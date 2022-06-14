int w=750;
int h=750;
float rateo=100;
float unitaAstronomica=(1496*(10e4));
float massaSolare=2*(10e30);

double speedX=0;
double speedY=2.9800*(10e04);
ArrayList<CorpoCeleste> universo = new ArrayList<CorpoCeleste>();
float lontananza =1;

void setup() {
  size(750, 750);
  smooth(2);
  //CorpoCeleste(RAGGIO,MASSA,X,Y,VELOCITA',DISTANZA,COLORE,NOME);
  universo.add(new CorpoCeleste(696340/10,random(2,5)*(10E30),w/2,h/2,0,0,color(0,0,0,50),""));
  //universo.add(new CorpoCeleste(696340/10,1.989*(10E30),w/2+200,h/2+200,-random(1,3)*(10e03),0,color(255,255,0),"Sole"));

  //universo.add(new CorpoCeleste(696340/100,1.989*(10E30),w/2-500,h/2,0,0,color(255,255,0),"Sole"));
  universo.add(nanoGassoso());
  universo.add(giganteGassoso());
  universo.add(nanoGassoso());
  universo.add(giganteGassoso());
  universo.add(nanoGassoso());
  universo.add(giganteGassoso());
  
  
}






void draw() {
  background(255,255, 255);
  stroke(255,255,255);
  scale(lontananza);
  //universo.get(0).update();
  //universo.get(1).orbita(universo.get(0));
  for(int i =0;i<universo.size();i++){
    for(int j=0;j<universo.size();j++){
      if(i!=j){ universo.get(i).orbita(universo.get(j));
    }}
  }
}

CorpoCeleste nanoGassoso(){
  return new CorpoCeleste(random(1000,3000),random(1,999)*(1E20),w/2,h/2,random(2,2.5)*(10e03),random(250000000,499999999),color(random(0,0), random(0,0), random(0,0), random(100,200)),"");
}


CorpoCeleste giganteGassoso(){
  float temp = random(10,13)*5.972*(1E24);
  return new CorpoCeleste(temp/(random(25,30)*(1E20)),temp,w/2,h/2,random(2,2.5)*(10e03),random(350000000,499999999),color(random(0,0), random(0,0), random(0,0),random(100,200)),"");
}



double fGravitazionale(double m,double M,double R){
  double G=6.67e-11;
  return m*G*M/(R*R);
}

double accelerazione(double forza, double massa){
  return forza/massa;
}

double acc(double m,double M, double R){
  double G=6.67e-11;
  return (G*m*M/(R*R))/m;
}

public void mouseDragged() 
{
  for(int i =0;i<universo.size();i++){
    universo.get(i).setX(universo.get(i).getX()+(mouseX-pmouseX));
      universo.get(i).setY(universo.get(i).getY()+(mouseY-pmouseY));
  }
}

void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  lontananza+=e/100;
}

void keyPressed() {
  if ( key == 'r' ){
  universo.add(new CorpoCeleste(696340/100,1.989*(10E30),200,200,0,0,color(255,255,0),"Sole"));  };
}
