
// 1
proctype p() {
byte tmp = b;
tmp++;
b = tmp
}

init {
  p();
  p();
  _nr_ptr == 1;
  assert(n==2) // Will potentially fail
  }
// -----------2-5
  int N = 5;
  int i = 0;
  int b = 0;

  proctype p() {
    b++ // atomic
  }

  init {
    int n
    do
      :: (i>= N ) -> break
      :: p(); i++
    od

    _nr_ptr == 1;

    assert(n==N) // Will potentially fail
    }
