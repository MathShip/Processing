public class Spaceship extends Entity {   
   public Spaceship(int x, int y) {
        super(x, y, "img/spaceship.png");
   }
   
   public void drawSelf() {
       fill(255);
       image(this.img, this.x, this.y);
   }
   
   public void setPos(int y) {
       this.y = y;
   }
}