mtype = {hi, bye}; // Message
chan ch = [0] of {mtype}; // Randevouz server

// Server process
active proctype Server () {
  mtype msg;
read:
  ch ? msg;
  do // Pattern matching
    ::  msg == hi -> printf("Hello.\n"); goto read
    ::  msg == bye -> printf("See you.\n"); break
  od
}

active proctype Client() {
  ch ! hi; ch ! hi; ch ! bye
}
