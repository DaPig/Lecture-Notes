# TDA294: Formal Methods for software development
## Lecture 5 - Modeling Distribution
### 2018-09-14
---
Today we will talk about Modeling distributed systems. Distributed systems consists of stand-alone processes that communicate with one another using message passing, thus they does not have any shared memory.

Thus, distributed systems consists of different nodes that interact via communication channels dictated by protocols.  These can as such be complicated to model correcly, what we ususally do is abstract away details about communication technologies and protocols, such that we only validate our program.

## In PROMELA
In Promela we use `channels` for sending and receiving between nodes, these as such model communication channels.

These are described via the keyword `chan`. Channels can also have buffers (i.e. a capacity of messages). Messages communicated over channels are tupels consisting of n types `{type_1,..,type_n}`, a channel is described by the syntax:
```
chan name = [cap] of {type_1,..,type_n}
```
The channel with name *name* have a buffer of *cap*, i.e. can save *cap* messages.

A channel can be used to send and receive, utilizing the operators `!` for sending, and `?` for recieving. I.e. an example of two different channels with buffer 0 that sends and recieve can be
```
chan recChan = [0] of {byte}
chan sendChan  = [0] of {byte}

active proctype Server() {
  byte recData;
  do
      :: resChan ? recData;
          printf("returning data to client...");
          sendChan ! recData
  od
}
active proctype Client() {
  byte sendData = 1;
  byte recData;
  do
    :: resChan ! sendData;
    :: sendChan ? recData;
    assert(sendData == recData)
  od
}

```

Recieve statements `?`, are only executable when another process have sent on that channel. Channels with a buffer of length 0 are called rendevous channels, these are synchronous, i.e. both program counters of the receiving and sending channel are incremented at once.  These kinds of channels are often to restrictive for applications as they require synchronous behavior.

Channels with buffers implement a FIFO queue, receive statements read and remove messages, , one can also use pre exising methods for checking channel state
```
full(ch) // Is the channel buffer full?
nfull(ch) // Is it not full?
empty(ch) // IS ch empty?
nempty(ch) // Not empty?
```

A tip for having several clients communicating with a server is to have local reply channels and send these in the message to the server such that other clients does not confuse their reply.

Note: The popping of messages using a single `?` only checks the first message in the queue. Using  `??` checks the entire queue. You can also read messages without popping them using `<>`, example :
```
ch ? <mes1, mes2>
```
Reads the queue without popping.


One can also use pattern matching to validate data and do actions, example:
```
chan cat = [0] of {int, int};
int cat1 = 1;
ch ? 0, cat1;
```

This matches on [0, 1], [1,1], [ _ ,1].
