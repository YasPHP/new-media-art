void exercise2() {
  surface.setSize(350,700);
  if(k==0){
    background(0);
  }
    stroke(100);
    fill(mouseX, mouseY, 255);
    ellipse(mouseX, mouseY, 50, 50);
    k=1;
}
