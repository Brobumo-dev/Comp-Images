// Composition Maker 2.0
// Name, date

// Variables
PImage[] images; // Array to store images
int totalImages = 0; // Total number of images in the directory

void setup() {
  size(1024, 800); // Set window size
  background(random(255), random(255), random(255)); // Random background color
  LoadFiles();
}

void draw() {
  int randomNumber = ceil(random(4));
  fill(random(255), random(255), random(255), random(50, 100));
  rect(random(width), random(height), random(width / randomNumber), random(height / randomNumber));

  if (totalImages > 0) {
    DisplayImage();
  }

  frameRate(60); // Controls speed of composition creation
}

void mousePressed() {
  noLoop();
  saveFrame(timeStamp() + ".png");
}

void mouseReleased() {
  loop();
}

String timeStamp() {
  return nf(month(), 2) + "-" + nf(day(), 2) + "-" + year() + "_" + nf(hour(), 2) + "." + nf(minute(), 2) + "." + nf(second(), 2);
}

void LoadFiles() {
  File folder = new File(sketchPath("media")); // Ensure correct path
  File[] files = folder.listFiles();
  
  if (files != null) {
    totalImages = files.length;
    images = new PImage[totalImages];
    
    for (int i = 0; i < totalImages; i++) {
      images[i] = loadImage(files[i].getAbsolutePath());
    }
  }
}

void DisplayImage() {
  tint(random(255), random(255), random(255), ceil(random(100) + 130));
  int randomIndex = (int) random(totalImages);
  image(images[randomIndex], random(width), random(height));
}
