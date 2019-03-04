void exercise1() {
  //TOP HALF OF SCREEN
  noStroke();
  surface.setSize(700, 525);
  fill(119, 176, 245);
  rect(0, 0, 700, 262.5);

  //SUN
  noStroke();
  fill(252, 245, 0);
  ellipse(175, 262, 105, 105); 

  //BOTTOM HALF OF SCREEN
  strokeWeight(1);
  noStroke();
  fill(22, 213, 125);
  rect(0, 262.5, 700, 262.5);

  //ROOF OF HOUSE
  strokeWeight(1);
  stroke(0);
  fill(0, 0, 0);
  triangle(463, 220, 542, 175, 619, 220);

  //HOUSE FRAME
  strokeWeight(1);
  stroke(0);
  fill(240, 97, 123);
  rect(471, 220, 142, 89); 

  //DOOR
  strokeWeight(1);
  stroke(0);
  fill(255);
  rect(529, 237, 29, 62);

  //DOOR KNOB
  strokeWeight(1);
  stroke(0);
  fill(0);
  ellipse(537, 268, 7, 7);

  //Rays of sun

  {
    for (float x=0; x<195; x=x+19.8)
    {
      strokeWeight(4);
      stroke(252, 245, 0);
      line(175, 262, 90*cos(radians(x))+175, -90*sin(radians(x))+262);
    }
  }
}
