float x;
float y;
int dim;
PGraphics img;

void setup() {
  size(600,600);
  dim = 3000;
  x = 0;
  y = 0;
  img = createGraphics(dim,dim);
  
  img.beginDraw();
  img.colorMode(HSB);
  img.background(0);
  img.endDraw();
}


void drawPoint() {
  float px = map(x, -2.1820, 2.6558, 0, dim);
  float py = map(y, 0, 9.9983, dim, 0);
  float h = map(x*x+y*y,0,107.04927364,0,255);//99.966
  img.stroke(h,255,255);
  img.strokeWeight(1);
  img.point(px, py);
}

void nextPoint() {
  float nx;
  float ny;

  float r = random(1);
  if (r < 0.01) {
    // 1
    nx = 0;
    ny = 0.16 * y;
  } else if (r < 0.86) {
    // 2
    nx = 0.85 * x + 0.04 * y;
    ny = -0.04 * x + 0.85 * y + 1.6;
  } else if (r < 0.93) {
    // 3
    nx = 0.20 * x - 0.26 * y;
    ny = 0.23 * x + 0.22 * y + 1.6;
  } else {
    // 4
    nx = -0.15 * x + 0.28 * y;
    ny = 0.26 * x + 0.24 * y + 0.44;
  }
  x = nx;
  y = ny;
}

void draw() {
  img.beginDraw();
  for (int i=0; i<1000000; i++) {
    drawPoint();
    nextPoint();
  }
  img.endDraw();
  image(img,0,0,width,height);
  println(frameCount);
  if (frameCount % 10 == 0){
   img.save("image_"+(frameCount / 300)+".jpg"); 
  }
}
