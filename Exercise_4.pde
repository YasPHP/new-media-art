 int j=0;
void exercise4(){
 
  surface.setSize(400,700);
 while(j==0){
  background(0);
  j++;
  }
  noStroke();
  colorMode(HSB, 360, 30, 50, 1);
  y+=4;
  x++;
  z+=.17;
  r++;
  fill(y%360, 30, 50, 1);
  //small
  ellipse(x, height/2, z, z );
  //big
  ellipse(width/2, y, x, x);
}
