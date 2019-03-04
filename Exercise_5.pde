float x1=0;
float y1=0;
void exercise5() {
  surface.setSize(350,600);
  while(j==0){
    background(0);
    j++;
  }
  colorMode(HSB, 360, 99, 99);
  stroke(5, 3, 67);
  fill(y1+x1, 99, 99);
  y1+=7; 
  if (height>width);
  {
    x1+=.5;
  }

  if (y1>height) {
    y1=0;
  }
  ellipse(x1, y1, 50, 50);
}
