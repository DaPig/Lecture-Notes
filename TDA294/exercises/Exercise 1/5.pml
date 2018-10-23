#define ITERATION 5
byte counter = 0;
ltl alwaysME {[](counter >= 0 && counter <2)}

proctype printer( ){
int iter = 0;
  do
    :: (iter >= ITERATION) -> break;
    :: counter == 0 ->
      counter ++; 
      printf("Printing at %d", _pid);
      iter++;
      counter --
    :: else ->
      printf("Process %d is waiting", _pid)
  od
}

init {
  run printer();
  run printer()
}
