void changeBackground(){
  if(k==0){
    colorMode(HSB, 360, 30, 50, 1);
    background(0);
  }
surface.setSize(400,700);
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
  k=2;
}
