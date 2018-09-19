mtype = {hi, bye};
chan ch = [0] of {mtype};

active proctype Server () {
  do
    :: ch ? hi  -> printf("Hello.\n")
    :: ch ? bye -> printf("See you.\n"); break
  od
}

active proctype Client() {
  ch ! hi; ch ! hi; ch ! bye
}

// same as dispatch0, pattern matching
