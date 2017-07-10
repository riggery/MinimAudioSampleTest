import ddf.minim.*;
import javax.sound.sampled.AudioFormat;

Minim minim = new Minim(this);
AudioFormat format = new AudioFormat(44100, 16, 2, true, true);

AudioSample songIn, songOut;
float[] il, ir, ol, or;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

void setup() {
  size(512, 512);
  noLoop();
  
  songIn = minim.loadSample("wav.wav");
  
  il = songIn.getChannel(1);
  ir = songIn.getChannel(2);
  ol = new float[il.length];
  or = new float[ir.length];

  for (int s = 0; s < il.length; s++) {
    ol[s] = il[s]/8;
    or[s] = ir[s]/8;
  }
  
  songOut = minim.createSample(ol, or, format);
  songOut.trigger();
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


void draw() {}