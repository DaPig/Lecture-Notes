public class Queue {

    //@ public invariant 0 <= first && first < arr.length;
    //@ public invariant 0 <= next && next < arr.length;
    //@ public invariant first <= next ==> size == next - first;
    //@ public invariant first > next ==> size == next + arr.length - first;

    /*@ spec_public @*/ Object[] arr;
    /*@ spec_public @*/ int size;
    /*@ spec_public @*/ int first;
    /*@ spec_public @*/ int next;


    Queue( int max ) {
	arr   = new Object[max + 1];
	first = 0;
	next  = 0;
    }

    /*@ public normal_behavior
      @ ensures \result == size;
      @*/
    public /*@ pure @*/ int size() {
	return 0; // stub
        // ...
    }

    /*@ public normal_behavior
      @ requires size < arr.length - 1;
      @ ensures arr[\old(next)] == x;
      @ ensures next == (\old(next) + 1) % arr.length;
      @ ensures size == (\old(size) + 1);
      @ assignable next, arr[*], size;
      @
      @ also
      @ 
      @ requires size == arr.length ;
      @ ensures (\forall int i ; i >= 0 & i < arr.length ; arr[i] == \old(arr)[i]);
      @ assignable \nothing ; 
      @*/
    public void enqueue( Object x ) {
        // ...
    }

    /*@ public normal_behavior
      @ requires size > 0;
      @ ensures \result == arr[\old(first)];
      @ ensures first == (\old(first) + 1) % arr.length;
      @ ensures size == (\old(size) - 1);
      @ assignable first, size;
      @*/
    public Object dequeue() {
	return new Object(); // stub
        // ...
    }
}
