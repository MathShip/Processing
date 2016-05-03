public abstract class Entity {
    protected int x,
                  y,
                  w, 
                  h;
    protected PImage img;
    
    public Entity(int x, int y, String imgName) {
        img = loadImage(imgName);
        this.x = x;
        this.y = y;
        this.w = img.width;
        this.h = img.height;
    }
    
    public int getX() {
        return this.x; 
    }
    
    public int getY() {
        return this.y; 
    }
    
    public int getW() {
        return this.w; 
    }
    
    public int getH() {
        return this.h; 
    }
    
    public abstract void drawSelf();
}