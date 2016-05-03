public class Ring extends Entity {
    private int value;
    private PFont font;
  
    public Ring(int x, int y, int value, PFont font) {
         super(x, y, "img/ring.png");
         this.value = value;
         this.font = font;
    }
    
    public void drawSelf() {
         fill(255);
         textAlign(LEFT);
         textFont(this.font);
         image(this.img, this.x, this.y);
         text(this.value + "", this.x + this.w + 25, this.y + this.h / 2);
         this.move();
    }
    
    public int getValue() {
        return this.value; 
    }
    
    public void move() {
         this.x--; 
    }
    
    public void changeState(boolean state) {
          if (state) {
              this.img = loadImage("img/green_ring.png"); 
          }
          else {
              this.img = loadImage("img/red_ring.png"); 
          }
    }
}