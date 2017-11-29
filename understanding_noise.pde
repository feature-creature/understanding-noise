/*

 understanding noise
 
 */

float resolutionFactor;


void setup() {
    size(500, 350);
    background(0);
    noStroke();
    fill(255);
    noiseWorks();

    resolutionFactor = 0.01;
}

void draw() {
    background(0);

    noiseWorks();
}



void noiseWorks() {
    // on program execution : noise generates (and seeds) a new random sequence of numbers "smooth random"
    // do all noise calls in the program reference this one sequence or are/can multiple sequences be created?
    // inifinite n-dimensional space
    // returns 0.0 < float < 1.0
    // aside: pure random should have an even distrobution of values between 0.0 and 1.0 over time
    // aside: perlin noise values cluster around the mean (0.5) over time (bell curve-ish)
    // decimal places?
    // procedural

    // if you don't want the variability of a new sequence every program execution
    // you can actually use the same generated sequence every time the program is run
    // (instead of creating and using a new sequence each time) save the desired sequence as seed (int)
    // loading a seed prevents generating a new sequence: noiseSeed(int);
    // ? how does a single int give enough info ?
    // how do you determine your current sequence's seed value (int)

    // Steps of 0.005-0.03 work best for most applications, 
    // but this will differ depending on use.

    // 1D noise - samples a x-point value on the generated sequence
    //            smaller distance/time between successive x-points queries
    //            == closer values between queries (smoother)  
    // 2D noise - samples a range between 2 x-points on the generated sequence
    // 3D noise - samples a area between 2 x-points on the generated sequence
    for (int i = 0; i < width; i++) {
        ellipse(i, 255 - noise(i* resolutionFactor) * 255, 2, 2);
    }
    rectMode(CORNERS);
    rect(0, 255, width, 256);

    text("0", 0, 275);
    text("1", 0, 15);
    text(width * resolutionFactor, width - 50, 275);
    text(resolutionFactor, width - 50, 300);

    // interface : 1D
    // select noise a specific noise value in the noise sequence
    // 
    pushStyle();
    fill(255, 0, 0);
    stroke(255, 0, 0);
    strokeWeight(1);
    // 1D
    line(mouseX, 257 - noise(mouseX*resolutionFactor)*255, mouseX, 255);
    text(mouseX*resolutionFactor, mouseX, 275);
    text(noise(mouseX*resolutionFactor), mouseX, 300);
    // + for 2D
    line(mouseX + 50, 257 - noise((mouseX + 50)*resolutionFactor)*255, mouseX + 50, 255);
    text((mouseX + 50)*resolutionFactor, mouseX + 50, 275);
    text(noise((mouseX + 50)*resolutionFactor), mouseX + 50, 300);


    text(noise(mouseX*resolutionFactor)-noise((mouseX + 50)*resolutionFactor), mouseX + 25, 325);

    text(noise(mouseX*resolutionFactor, (mouseX + 50)*resolutionFactor), mouseX + 25, 345);

    popStyle();




    //noiseSeed();
    //noiseDetail();

    // noise inputs floats?
    // outputs float 0.0 1.0
    // noise is repeating?
}

void keyPressed() {
    // interface : manipulate resolution of the generated noise sequence
    // ? resolution limits of the noise function
    if (key == '1') {
        resolutionFactor = 1.0;
    }
    if (key == '2') {
        resolutionFactor = 0.1;
    }
    if (key == '3') {
        resolutionFactor = 0.01;
    }
    if (key == '4') {
        resolutionFactor = 0.001;
    }
    if (key == '5') {
        resolutionFactor = 0.0001;
    }
}