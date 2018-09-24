chan request = [2] of { byte, chan};
chan reply[5] = [2] of { byte };

active [2] proctype Server() {
  byte client;
  chan replyChannel;

  do
     :: request ? client, replyChannel ->
        printf("Client %d processed by server %d\n", client, _pid);
        replyChannel ! _pid
  od
}

proctype Client(byte id) {
    int messageToCall = 0;
    do
        :: messageToCall == 2 -> printf("Client, %d  finished \n", id); break
        :: else -> request ! id, reply[id];
                    reply[id] ? _;
                    messageToCall++;
    od
}

init {
  int initializedServers = 0;
  int initializedClients = 0;

  do
    :: initializedClients == 5 -> break;
    :: else -> run Client(initializedClients); initializedClients++;
  od
    do
    :: initializedServers == 2 -> break;
    :: else -> run Server(); initializedServers++;
  od
}
