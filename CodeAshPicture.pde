PImage sorted;
int index = 0;
int i = 1;
int widthImage = 600;
int heightImage = 600;
String nameImage = "nameImage.jpg";
PImage img;

void setup() {
  size(600, 600);

  img = loadImage(nameImage);
  sorted = createImage(img.width, img.height, RGB);
  sorted = img.get();
}

void draw() {
  println(frameRate);

  sorted.loadPixels();

  // Selection sort!
  for (int n = 0; n < 600; n+=100) {
    float record = -1;
    int selectedPixel = index;
    for (int j = index; j < sorted.pixels.length; j+=100) {
      color pix = sorted.pixels[j];
      float b = hue(pix);
      if (b > record) {
        selectedPixel = j;
        record = b;
      }
    }

    // Swap selectedPixel with i
    color temp = sorted.pixels[index];
    sorted.pixels[index] = sorted.pixels[selectedPixel];
    sorted.pixels[selectedPixel] = temp;

    if (index < sorted.pixels.length -1) {
      index++;
    }
  }


  sorted.updatePixels();

  background(0);
  image(sorted, 0, 0);
}
void mousePressed() {

  String name = nameImage.substring(0, nameImage.length()-4);

  save(""+name+"/"+name+"0"+i+".png");
  i++;
}
