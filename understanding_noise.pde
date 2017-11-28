/*

 understanding noise
 
 */

void setup() {
    size(500, 300);
    background(0);
    noStroke();
    fill(255);
    noiseWorks();
}

void draw() {
    //background(0);

    //fill(255);
    //noiseWorks();
}



void noiseWorks() {
    // on program execution : noise generates a new random sequence of numbers
    // inifinite n-dimensional space
    // returns 0.0 < float < 1.0
    // decimal places?

    // Steps of 0.005-0.03 work best for most applications, 
    // but this will differ depending on use.

    // 1D noise - samples a x-point value on the generated sequence
    //            smaller distance/time between successive x-points queries
    //            == closer values between queries (smoother)  
    // 2D noise - samples a range between 2 x-points on the generated sequence
    // 3D noise - samples a area between 2 x-points on the generated sequence
    for (int i = 0; i < width; i++) {
        ellipse(i, 255 - noise(i*0.01) * 255, 2, 2);
    }
    
    rectMode(CORNERS);
    rect(0,255,width,256);
    //noiseSeed();
    //noiseDetail();

    // noise inputs floats?
    // outputs float 0.0 1.0
    // noise is repeating?
}