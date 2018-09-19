chan request = [0] of { byte };
chan ack = [0] of { bool };

active proctype Server() {
  byte num;
end:
  do :: request ? num -> 
	printf("serving client %d\n", num);
	ack ! true
  od
}

active proctype Client0() {
  request ! 0;
  ack ? _;
  printf("acknowledged\n")
}

active proctype Client1() {
  request ! 1;
  ack ? _;
  printf("acknowledged\n")
}
