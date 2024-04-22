void collision(Ball b1, Ball b2){
  PVector normal = PVector.sub(b2.pos,b1.pos);
  
  float angle = normal.heading();
  //float angle = atan2(normal.y, normal.x);
  
  b1.vel.rotate(-angle);
  b2.vel.rotate(-angle);
  
  float x1 = b2.vel.x;
  float x2 = b1.vel.x;
  
  b1.vel.x = x1;
  b2.vel.x = x2;
  
  b1.vel.rotate(angle);
  b2.vel.rotate(angle);
  
}
