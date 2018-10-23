# define N 5
byte b = 0;

proctype p() {
  byte tmp = b;
  tmp++;
  b = tmp;
}

init {
    int s = 0;
    atomic {
    do
        :: (s >= N) -> break;
        :: else ->
            s++;
            run p()
    od
    }
  (_nr_pr == 1) -> assert(b == N)
}
