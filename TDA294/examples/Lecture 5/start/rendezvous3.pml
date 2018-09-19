chan request = [0] of { byte };
chan reply = [0] of { byte };

active [2] proctype Server() {
  byte clientID;
end:
  do
    :: request ? clientID -> 
       printf("server %d serving client %d\n",
	      _pid, clientID);
       reply ! _pid
  od
}

active [2] proctype Client() {
  byte serverID;
  request ! _pid;
  reply ? serverID;
  printf("client %d received reply from server %d\n",
	 _pid, serverID)
}
