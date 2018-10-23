# Exam Prep
## Lecture 5 - Modeling Distributed systems
### 2018-10-22
---
The other form of parallelization of systems are distributed systems. These exist on their own and communicate by sending messages through channels to one another.

These systems consists of nodes, communication channels and protocols for communication. In PROMELA, these three concepts are translated into processes, channels and algorithm distributed over processes.

In promela the channels are first class citizens and are used for sending and recieving messages. These are defined as
```
chan name = [capacity] of {type_1,..,type_n}
```
Where the types are what will be sent over the channel. Thus the messages are of a n-tuple. The capacity is the buffer, i.e. how many messages a channel can "save" for later. If the capacity is equal to 0, we have a rendevouz channel.

Sending and recieving messenges are as follows:
```
name ! expr_1, .. , expr_2
name ? var_1 , ... , var_n
```
Where expr are expressions to be sent that matches the channel type. And var are messages to be received that match names type.

# Client/ Server
Defining proctypes as client and servers are done by creating these and sending / receiving messages in a global, shared channel. If we define the channels as active, i.e. they start as an *active* , the order of sending and receiving messages are nondeterministic.

Receiving messages blocks if the channel is empty. Thus one can wrap these in a do-block as a guard. If we have a rendevouz channel, the send and receive is done synchronous, and as such both locations are updated at once. The first receive or send ask is thought of as engaging in rendevouz.  A further tip is to send the response channel with the message.

## Process IDs
One can also send process ids to be able to valiate communications. The process id can be accessed via the keyword *_pid*


Randevouz channels are often to restrictive. Thats is why we might want to use buffered channels. These hold up to a certain threshold of messages and work as a FIFO queue. A normal get-request reads and removes the message. The ?-operation is executable if there are messages in the queue and the !-operation is executable if there are space left in the channel.

One can also check the message using the following commands
```
full(chan) // Is full?
nfull(chan) // Not full?
empty(chan) // Empty
nempty(chan) // Not empty.
```
Illegal to negate these

One can also read messages without removing them with
```
ch ? <name1, name2>
```
One can also pattern match on incoming messages. If we wish to match on a value stored in a variable we use the *eval* keyword.

We can use the random receive *??* that matches if any message in the buffer matches. Then removes the first message.
