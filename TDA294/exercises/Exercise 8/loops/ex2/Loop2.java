class Loop2 {
  /*@public invariant x >= 0 && y >= 0 @;*/
    public int x;
    public int y;

    /*@ public normal_behavior
      @ ensures \result == ((x / y) + 1);
      @*/
    public int method() {
	     int  x1 = x, q = 0;
       /*@ loop_invariant
       @  q <= (x1/y);
       @ assignable q, x1;
       @  decreasing x1;
       @*/
       while (x1 >= y) {
                       x1 = x1 - y;
                       q = q + 1;
                       }

       return q;
    }
}
