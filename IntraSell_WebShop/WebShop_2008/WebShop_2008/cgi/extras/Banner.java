//-------------------------------------------------
// Applet News Display
// Author: Ioana Timariu
//-------------------------------------------------
// Parameters 
// 
// 

import java.io.*;
import java.applet.*;
import java.awt.*;
import java.lang.*;
import java.awt.image.*;
import java.util.*;
import java.awt.Color;
import java.net.*;

public class Banner extends Applet implements Runnable, ImageObserver{

    // string and url's that scroll across
    String [] news = new String[30];    // news strings
    URL [] url = new URL[30];         // url's 

    // is the mouse in the picture?
          boolean mouseIn = false;

    Image img;        
    int fading =  255;            // determines color

    int width, height, speed, atx, aty, startx, endx, starty;
    Thread runner;                
    
    int increasing = 1;      
    int lefttoright = 1; 
    
          Image offscreenImage;
          Graphics offscreenGraphics; 

    int index = 0;             // what url I'm at
     
        MediaTracker tracker = new MediaTracker(this);
    ImageObserver observ;

    int stop = 0;            // on stop = 1, applet was clicked
    int pars = 0;     
    int fontsize = 13;
    Font f;
    
    //-----------------------------------------------------
      public void init() {
    
    int i = 0;
    String param = new String();

    // get height and width of the applet
    try { height = Integer.parseInt(getParameter("HEIGHT"));} 
    catch (Exception e) { height = 70;};

    try { width = Integer.parseInt(getParameter("WIDTH")); }
    catch (Exception e) { width = 600; };

    getGraphics().drawString("Loading...", width/2, height/2);


    // get starting, ending points, etc
    get_direction();

    atx = startx; aty = starty;

    // try getting the speed: 
    try { speed = Integer.parseInt(getParameter("SPEED"));} 
    catch (Exception e) { speed = 18;};    

    // try getting the font size
    try { fontsize = Integer.parseInt(getParameter("FONTSIZE"));} 
    catch (Exception e) { fontsize = 12;};    
    

    // try to get the 1st parameter called "NEWS0"    
    try {    param = getParameter("NEWS0");} 
    catch (Exception e) { System.out.println("News 0 is bad"); };
    
            // find out how many parameters we have: 
            // and get the url's
    while (param != null) {
        news[pars] = param; 
        pars++;    
        param = getParameter("NEWS" + pars);     
    };    

            // get the corresponding url's
    for (i = 0; i < pars; i++) {
            try { url[i] = new URL(getParameter("LINK" + i));} 
            catch (Exception e) { 
            try {url[i] = new URL("http://applet.notproperly.configured/");} 
            catch (Exception e2) {};
        }; // end try 
    };

    
    // get the image name
    img = getImage(getDocumentBase(), getParameter("IMAGE"));                   

    prepareImage(img, width, height, observ);

    tracker.addImage(img,0);
    
    resize(width,height);

    offscreenImage = createImage(width,height);
        offscreenGraphics = offscreenImage.getGraphics();
    this.setBackground(new Color(255,255,255));
    f = new Font("Arial",Font.BOLD, fontsize);
    offscreenGraphics.setFont(f);
       
         wait_for_me();
      };
       

    //-----------------------------------------------------
      public void paint(Graphics g) {
    
    offscreenGraphics.drawImage(img, 0,0,this);    
    offscreenGraphics.setColor(new Color(fading,fading,fading));
    offscreenGraphics.drawString(news[index], atx, aty);

          g.drawImage(offscreenImage,0,0,this);
    
    }

    //------------------------------------------------------------
    // if x1 is bigger than x2 and relationship is left to right,
    // return true

    public boolean passed_horizontal (int x1, int x2, int l_to_r) {
        boolean bigger = x1 > x2;
        boolean goingright = l_to_r > 0;
        if ( ( bigger && goingright ) || ( !bigger && !goingright ) ) { 
            return true; 
        }         else { return false; };  
        };
    //-----------------------------------------------------
      public void moveMe() {

    if (stop ==1) return; // user clicked
    int i;
    
    if (passed_horizontal(atx, endx, lefttoright) || fading == 0) { 
        atx = startx; fading=255; index++;        
        if (index == pars) { index = 0;};
    };
        atx = atx + lefttoright;

        if (passed_horizontal(atx, 2*endx/3, lefttoright))  fading--;    // fade the font (to black)
            
    if (mouseIn) {
        getAppletContext().showStatus(url[index].toString());
        mouseIn = false;
        };

    if (stop != 1) { repaint(); };    // if applet was stopped, 
                            // stop immediately
    };

    //---------------------------------------------------------------
      public void start () {
        if (runner == null) {
            runner = new Thread (this);
            runner.start ();
          stop = 0;
        } //endif
      }      
   
      public void stop () {
        if (runner != null) {
            runner.stop ();
            runner = null;
        stop = 0;
        }
      };

     //***************************************************************
     public void wait_for_me() {
    try { tracker.waitForID(0);} 
    catch (InterruptedException e) { 
        wait_for_me(); 
        System.out.println("Waiting"); 
    };
     
     };

     //***************************************************************
     public void run () {

     while (true) {
          moveMe();
          try { Thread.sleep (speed); }
          catch (InterruptedException e) { }
      }
    }      
   
   public void update (Graphics g) {             
    paint(g);
   }
         
  public boolean mouseDown( Event event, int x, int y) {
     //System.out.println("Actually heard that"+index);
     stop = 1;
     getAppletContext().showDocument(url[index]);
     getAppletContext().showStatus("Contacting url: " + url[index].toString());
     return true;
  };
 
  public boolean mouseEnter(Event event, int x, int y) {
    mouseIn = true;
    repaint();
    return true;
  };

  public boolean mouseExit(Event event, int x, int y) {
    mouseIn = false;
    return true;
  };
  

   public void get_direction () {
    // get starting x
    try { startx = Integer.parseInt(getParameter("STARTX"));} 
    catch (Exception e) { startx = 0; };

    // get starting y
    try { starty = Integer.parseInt(getParameter("Y")); } 
    catch (Exception e) {  starty = height/2 + fontsize/2 + 1; };

    // get endx
    try { endx = Integer.parseInt(getParameter("ENDX"));} 
    catch (Exception e) { endx = width; };


    if (startx > endx) { lefttoright = -1; };
    // if (starty > endy) { increasing = -1; }; 

    System.out.println("Start x broken " + startx + " start y "  + starty);
    System.out.println("iNCREASING " + increasing + " lefttoright "  + lefttoright);
   };

}    

 
