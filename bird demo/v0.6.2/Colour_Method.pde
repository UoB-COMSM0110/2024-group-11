color stringGetColor(String name) {
  int r, g, b;
  switch(name) {
  case "red":
    r = 255;
    g = 0;
    b = 0;
    break;
  case "orange":
    r = 255;
    g = 127;
    b = 0;
    break;
  case "yellow":
    r = 255;
    g = 255;
    b = 0;
    break;
  case "green":
    r = 0;
    g = 255;
    b = 0;
    break;
  case "blue":
    r = 0;
    g = 0;
    b = 255;
    break;
  case "indigo":
    r = 0;
    g = 255;
    b = 255;
    break;
  case "violet":
    r = 148;
    g = 0;
    b = 211;
    break;
  default:
    r = 255;
    g = 0;
    b = 0;
    break;
  }
  return color(r, g, b);
}

color numGetColor(int num) {
  int r, g, b;
  switch(num) {
  case 0:
    r = 255;
    g = 0;
    b = 0;
    break;
  case 1:
    r = 255;
    g = 127;
    b = 0;
    break;
  case 2:
    r = 255;
    g = 255;
    b = 0;
    break;
  case 3:
    r = 0;
    g = 255;
    b = 0;
    break;
  case 4:
    r = 0;
    g = 0;
    b = 255;
    break;
  case 5:
    r = 0;
    g = 255;
    b = 255;
    break;
  case 6:
    r = 148;
    g = 0;
    b = 211;
    break;
  default:
    r = 255;
    g = 0;
    b = 0;
    break;
  }
  return color(r, g, b);
}
