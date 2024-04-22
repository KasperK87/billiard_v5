Ball[] balls;

float energy;

void setup(){
 size(600,400); 
 
 balls = new Ball[16];
 
 for (int i = 0; i < 5; i++){
  for (int j = 0; j < 3; j++){
   balls[i+j*5] = new Ball(100+100*i, 100+100*j); 
  }
 }
 
 balls[0] = new Ball(150, 200);
 balls[15] = new Ball(250, 200);
 balls[1] = new Ball(280, 200-20); balls[2] = new Ball(280, 200+20);
 balls[3] = new Ball(310, 200); balls[4] = new Ball(310, 200+35); balls[5] = new Ball(310, 200-35);
 balls[6] = new Ball(340, 200-20); balls[7] = new Ball(340, 200+20); balls[8] = new Ball(340, 200-55);
 balls[9] = new Ball(340, 200+55);
 balls[10] = new Ball(370, 200); balls[11] = new Ball(370, 200+35); balls[12] = new Ball(370, 200-35);
 balls[13] = new Ball(370, 200+70); balls[14] = new Ball(370, 200-70);
 //balls[13].vel.x = 1;
 //balls[0].vel.x = 1;
 //balls[0].vel.y = 1;
}

void draw(){
  background(0);
  energy = 0;
  for (Ball b : balls){
    b.render();
    b.update();
    energy += 0.5*pow(b.vel.mag(),2);
   }
   
   println((float)round(energy*100)/(float)100);
   
   //collision
   for (int i = 0; i < balls.length-1; i++){
     for (int j = i+1; j < balls.length; j++){
       if (dist(balls[i].pos.x, balls[i].pos.y, balls[j].pos.x, balls[j].pos.y) < 30){
        
        collision(balls[i], balls[j]);
        
      }
     }
   } 
}

void mouseReleased(){
  PVector dir = new PVector(balls[0].pos.x-mouseX, balls[0].pos.y-mouseY).normalize();
  dir.mult(dist(mouseX, mouseY, balls[0].pos.x, balls[0].pos.y)/50);  
  balls[0].vel = dir;
  
  println(pow(balls[0].vel.mag(),2));
}
