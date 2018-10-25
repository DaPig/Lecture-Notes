// 2a=
/*@
  @public  invariant
  @ (\forall int i; i>j &&  i<k; b[i] == 0 )
  @*/

  private /*@ spec_public @*/ int[] b;

// 2b)
/*@
  @ public invariant (\forall int i; i>0 && i<n; b[i] == 0 ==> (i <k && i >j))
  @*/

  // 2c)
  /*@
    @ public invariant (\exits int i; i>0 && i<n; b[i]== 0 && ( i<j || i>k)
    @*/

    // 2d)
    /*@
    @ public invariant(\exist i,j; i>0 && i<j && j<b.length; b[i] == 0 && b[j]== 0 && (\forall j; j>0 && j<b.length; j[i] != 0 => (j == i) || j==j))
    @*/
