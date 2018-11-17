class Earth extends Planetoid {
  float mass;
  float radius;
  float offset;
  float angle = 0;
  PShape globe;
  boolean dead = false;
  float baseMass;

  
  // base constructor
  public Earth(){
  }
  
  //overloaded
  public Earth(float mass, float radius, float offset){
   super(mass, radius, offset);
   this.mass = mass;
   this.baseMass = mass;
   this.radius = radius;
   this.offset = offset;
  }
  

  
}
