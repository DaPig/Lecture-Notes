/**
 * Exercise 1
 * Create two processes.
 * The first process sends the numbers 0 through 9 onto the channel.
 * The second process reads the values of the channel and outputs them.
 **/
chan myChan = [0] of { byte }

active proctype PrintChan() {
    int i = 0;
    do
        :: i>=10 -> break;
        :: else -> myChan ! i;
                    i++;
    od
}

active proctype SendChan() {
    int numRecievedMsg = 0;
    int recieved;
    do
        :: numRecievedMsg>=10 -> break;
        :: else -> myChan ? recieved
            printf("Recieved: %d, \n", recieved);
            numRecievedMsg++;
    od
}
