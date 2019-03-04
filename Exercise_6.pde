int xCirc = 0;
int yCirc = 0;
int x2=0;
int y2=0;
void exercise6() {
  surface.setSize(320, 600);
  while(j==0){
    background(0);
    j++;
  }
  colorMode(HSB, 360, 99, 99);
  noStroke();
  xCirc = mouseX/9;
  yCirc = mouseY/9;
  background(360);

  while (x2 < xCirc) {

    while (y2 < yCirc) {
      fill( (x2*y2*100) % 360, 99, 99);
      ellipse((x2*9)+5, (y2*9)+5, 10, 10);
      y2++;
    } 
    x2++;
    y2=0;
  }
  x2=0;
}
