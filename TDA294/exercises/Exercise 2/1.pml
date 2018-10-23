#define MSG 10
/**
 * Exercise 1
 * Create two processes.
 * The first process sends the numbers 0 through 9 onto the channel.
 * The second process reads the values of the channel and outputs them.
 **/
chan myChan = [0] of { byte }

active proctype P() {
    byte count = 0;
    do
        :: count >= MSG -> break;
        :: else -> myChan ! count;
            count ++;
    od

}

active proctype Q() {
    byte count = 0;
    byte value = 0;
    do
        :: count >= MSG -> break;
        :: else -> myChan ? value
            printf("Recieved Value: %d \n", value);
            count ++;

    od
}
