class Loop3 {
  /*@ public invariant a!= null; @*/
    public int a[];

    /*@ public normal_behavior
    @ requires a.length >= 0;
    @ ensures (\forall int i; i>= 0 && i < a.length; a[i] >= 0);
    @ assignable a[*];
    @*/
    public void method() {
      /*@
      @ loop_invariant
      @ (\forall int j; j>= 0 && j<i; a[j] >= 0) && i>= 0;
      @ decreasing (a.length - i);
      @ assignable a[*];
      @*/
	for (int i = 0; i < a.length; i++) {
	    if (a[i] < 0)
		   a[i] *= -1;
	}
    }
}
