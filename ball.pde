class Ball {
 PVector pos, vel, acc;
 
 float size, mass;
 
 Ball(float x, float y){
   pos = new PVector(x, y);
   
   vel = new PVector();
   acc = new PVector();
   
   size = 30;
   
   mass = 1;
 }
 
 void render(){
   circle(pos.x, pos.y, size);
 }
 
 void update(){
   pos.add(vel.add(acc));
   
   if (pos.x < 0) vel.x = -vel.x;
   if (pos.x > width) vel.x = -vel.x;
   if (pos.y < 0) vel.y = -vel.y;
   if (pos.y > height) vel.y = -vel.y;
 }
 
}
