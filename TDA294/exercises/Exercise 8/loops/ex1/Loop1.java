class Loop1 {

  /*@public invariant x >= 0; */
    public /*@ spec_public @*/int x;

    /*@ public normal_behavior
      @ ensures \result ==  x * x;
      @*/
    public int method() {
      int  y = x;
      int  z = 0;
      /*@ public loop_invariant
        @  z == x*(x-y) && y >= 0 && x>= 0;
        @ assignable y,z;
        @ decreases y;
        @*/
       while (y > 0) {
                      z = z + x;
                      y = y - 1;
                      }

       return z;
    }
}
