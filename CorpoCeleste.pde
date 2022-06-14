class CorpoCeleste {
  String nome;
  float raggio, massa, distance, x, y, val;
  double accX,accY,forza ,speedX,speedY;
  ArrayList<Float> Traiettoria = new ArrayList<Float>();
  int tCount=0;
  int c;
  
  CorpoCeleste(float rag, float massa, float x, float y, double speed, float distance, int colore, String nome) {
    this.nome=nome;
    this.raggio = rag;
    this.massa = massa;
    this.y =y;
    this.x =x+distance/unitaAstronomica*rateo;
    this.c = colore;
    this.speedY = speed/1000;
    speedX=0;
    this.distance=distance;
  }
  public void update() {
    //disegnaTraiettoria();
    noStroke();
    fill(c);
    ellipse(x, y,raggio/1000,raggio/1000);
    noStroke();
    textSize(10);
    text(nome,x+raggio/1000,y);
  }
  
  void orbitaS() {
   forza = fGravitazionale(massa,universo.get(0).getMassa(),dist(universo.get(0).getX(),universo.get(0).getY(),x,y)*unitaAstronomica);
   accX = (forza*((universo.get(0).getX()-x)/(dist(universo.get(0).getX(),universo.get(0).getY(),x,y))*unitaAstronomica))/massa;
   accY = (forza*((universo.get(0).getY()-y)/(dist(universo.get(0).getX(),universo.get(0).getY(),x,y))*unitaAstronomica))/massa;
   speedX+=accX/10e4;
   speedY+=accY/10e4;
   //println(nome+" accX "+accX+" accY "+accY);
   //println(nome+" speedX "+speedX+" speedY "+speedY);
   //println(nome+" distanza "+(dist(universo.get(0).getX(),universo.get(0).getY(),x,y))*(unitaAstronomica)/1000);
   x+=speedX/(10e5);
   y+=speedY/(10e5);
   
   update();
  }
  
  void orbita(CorpoCeleste c) {
   forza = fGravitazionale(massa,c.getMassa(),((dist(c.getX(),c.getY(),x,y))*(unitaAstronomica/rateo)));
   accX = (forza*((c.getX()-x)/((dist(c.getX(),c.getY(),x,y))*((unitaAstronomica)/rateo))))/massa;
   accY = (forza*((c.getY()-y)/((dist(c.getX(),c.getY(),x,y))*((unitaAstronomica)/rateo))))/massa;
   speedX=speedX + (accX* (18));
   speedY=speedY + (accY* (18));
   //println(nome+ " "+ c.getNome() + " "+ " accX " +  accX  + " accY " + accY);
   //println(nome+" speedX "+speedX+" speedY "+speedY);
   if(this.nome=="Terra" &&c.getNome()=="Sole") println(nome+" distanza "+((dist(c.getX(),c.getY(),x,y))*((unitaAstronomica)/rateo)));
   x+=((speedX/100));
   y+=((speedY/100));
   
   update();
  }
  
  void traiettoria(){
    if(Traiettoria.size()>=5000){
      Traiettoria.remove(0);
      Traiettoria.remove(0);
    }
    Traiettoria.add(x);
    Traiettoria.add(y);
    
  }
  void disegnaTraiettoria(){
    traiettoria();
    stroke(c,10);
    noFill();
    beginShape();
    for(int i=0;i<Traiettoria.size()-2;i+=50){
      curveVertex(Traiettoria.get(i),Traiettoria.get(i+1));
    }
    endShape();
  }

  public float getX() {
    return x;
  }
  public float getY() {
    return y;
  }
   color colore() {
    return c;
  }
  public float getR() {
    return raggio;
  }
  public float getVal() {
    return this.val;
  }
  public float getDistance() {
    return this.distance;
  }
  public double getSpeed() {
    return this.speedY;
  }
  public void setVal(float v) {
    this.val = v;
  }
  public void setX(float x) {
    this.x = x;
  }
  public void setY(float y) {
    this.y = y;
  }
  
  
  public void setR(float r) {
    this.raggio = r;
  }
  
  public void setMassa(float m) {
    this.massa = m;
  }
  
  public float getMassa() {
    return massa;
  }
  public String getNome() {
    return nome;
  }
}
