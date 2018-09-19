chan request = [0] of { byte, chan };

active [2] proctype Server() {
  byte clientID; chan ch;
end:
  do
    :: request ? clientID , ch -> 
       printf("client %d processed by server %d\n",
	      clientID, _pid);
       ch ! _pid, clientID
  od
}

active [2] proctype Client() {
  byte serverID, serversClient;
  chan reply = [0] of { byte , byte};
  request ! _pid, reply;
  reply ? serverID, serversClient;
  printf("client %d received reply from server %d\n",
	 _pid, serverID);
  assert(serversClient == _pid)
}
