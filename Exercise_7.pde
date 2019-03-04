void exercise7() {
  surface.setSize(330, 630);
  while (j==0) {
    colorMode(HSB, 360, 99, 99);
    background(360);
    j++;
  }
  stroke(0);
  for (float x = 10; x<width; x=x+20.5) {
    for (int y = 11; y<360; y+=20) {
      fill(y%360, 99, 99);
      ellipse(x, y, 20, 20);
    }
  }
  noStroke();
  for (int r = 310; r>0; r-=1) {
    fill(r, 99, 99);
    ellipse(width/2, 480, r/1.5, r/1.5);
  }
}
