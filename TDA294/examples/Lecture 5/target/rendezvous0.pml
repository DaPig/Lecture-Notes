mtype = { red, yellow, green };
chan ch = [0] of { mtype, byte, bool };

active proctype Sender1() {
  ch ! red, 11, false
}

active proctype Sender2() {
  ch ! yellow, 7, true
}

active proctype Receiver() {
  mtype color;
  byte time;
  bool flash;
  ch ? color, time, flash;
  if
    :: flash ->
       printf("\n\n At %d, there was a %e flash.\n\n",
	      time, color)
    :: else ->
       printf("\n\n At %d, there was no %e flash.\n\n",
	      time, color)
  fi
}
