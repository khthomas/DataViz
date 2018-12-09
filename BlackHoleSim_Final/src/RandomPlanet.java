import processing.core.PApplet;
import processing.core.PShape;

public class RandomPlanet extends Planetoid{
	float mass;
	  float radius;
	  float offset;
	  float angle = 0;
	  PShape globe;
	  boolean dead = false;
	  float baseMass;
	  Planetoid moon;
	  
	  // base constructor
	  public RandomPlanet(){
	  }
	  
	  //overloaded
	  public RandomPlanet(PApplet p, BlackHole b, float mass, float radius, float offset){
	   super(p, b, mass, radius, offset);
	   this.mass = mass;
	   this.baseMass = mass;
	   this.radius = radius;
	   this.offset = offset;

	  }
	  
	  public void spawnMoon(){
	    float moonMass = this.mass / 5;
	    float moonRadius = this.radius / 5;
	    float moonOffset = this.offset  + this.radius + 10;
	     
	    //public Planetoid(float mass, float radius, float offset){
	    moon = new Planetoid(p, b, moonMass, moonRadius, moonOffset);	    
	   
	  }

}