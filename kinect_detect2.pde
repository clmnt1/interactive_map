import SimpleOpenNI.*;


SimpleOpenNI  context;

void setup()
{
  context = new SimpleOpenNI(this);
   
  context.setMirror(true);
  
  if(context.enableDepth() == false)
  {
     println("Can't open the depthMap, maybe the camera is not connected!"); 
     exit();
     return;
  }
  
 
  size(context.depthWidth(), context.depthHeight()); 
}

void draw()
{
  // update the cam
  context.update();
  
  background(200,0,0);
  
  // draw depthImageMap
  image(context.depthImage(),0,0);
 
  colline(mouseX, mouseY, 7000, 1);
//  colline(100, 100, 500, 2);
  //colline(200, 200, 500, 3);
  //colline(200, 25, 500, 4);
  
}

void colline(int posX, int posY, int depth_min, int id){
   color c = get(posX, posY);
   int depth = (c/1000)*-1;
   println ("zone"+id+"="+depth);
   
   if(depth < depth_min){
      fill(255, 0, 0);
      rect(posX, posY , 25, 25);     
   }
}
