public class Question {
   private int num1,
               num2,
               max,
               answer;
   private String question;
   
   public Question(int max) {
       this.num1 = (int)random(1, max);
       this.num2 = (int)random(1, max);
       this.max = max;
       boolean sign = boolean((int)random(0, 2));
       
       if (sign) {
           question = num1 + " + " + num2 + " = ?";
           answer = num1 + num2;
       }
       else {
           if (num1 < num2) {
               int temp = num2;
               num2 = num1;
               num1 = temp;
           }
           question = num1 + " - " + num2 + " = ?";
           answer = num1 - num2;
       }
   }
   
   public boolean checkValue(Ring ring) {
       if (ring.getValue() == this.answer) {
          return true; 
       }
       return false; 
   }
   
   public int getAnswer() {
       return this.answer; 
   }
   
   public int getMax() {
       return this.max;
   }
   
   public void drawSelf() {      
       text(this.question, width / 2, 50); 
   }
}