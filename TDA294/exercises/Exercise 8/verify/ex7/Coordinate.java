

class Coordinate {

  /*@ spec_public @*/ int x;
  /*@ spec_public @*/ int y;

  /*@ public invariant 
    @ x >= 0 && y >= 0;
    @*/

  Stub(int x, int y) {
     this.x=x;
     this.y=y;
  }

  /*@ public normal_behavior
    @ requires x >= 0 && y >= 0; 
    @ ensures this.x == x && this.y == y ;
    @ assignable \everything;
    @*/
  public void set(int x, int y) {
     this.x = x;
     this.y = y;
  }

  /*@ public normal_behavior
    @ requires val > 0 ; 
    @ ensures x == \old(x) + val && y == \old(y) + val ;
    @ assignable \everything;
    @*/  
  public void moveUp (int val) {
    if (val > 0) {
     x = x + val;
     y = y + val;
    }
  }

  /*@ public normal_behavior
    @ requires val > 0 ; 
    @ ensures x == \old(x) * val && y == \old(y) * val ;
    @ assignable \everything;
    @*/  
  public void moveRight(int val) {
    return;
  }

  /*@ public normal_behavior
    @ requires false ; 
    @ ensures true ;
    @ assignable \nothing;
    @*/  
  public void explotion(int val) {
     ;
  }

  /*@ public normal_behavior
    @ requires val > 0 ; 
    @ ensures x == (\old(x) + val) * val && y == (\old(y) + val) * val ;
    @ assignable \everything;
    @*/  
  public void translation(int val) {
     moveUp(val);
     explotion(val);
     moveRight(val);   
  }

}
