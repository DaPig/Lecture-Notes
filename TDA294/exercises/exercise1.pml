active proctype NumFive() {
bool printAccessable = true;

proctype COMP1() {
    int s = 1
    do
        if
            :: printAccessable == true -> // Do nothing
            :: printAccessable = false; break ;
        fi
    od
    do
        if
            :: s > 5 -> break
            :: else ->  printf("Printing from comp1: %s", s)
        fi
        s++
    od
    printAccessable = true;
}

proctype COMP2() {
    int s = 1;
    do
        if
            :: printAccessable == true -> // Do nothing
            :: printAccessable = false; break

        fi
    od
    do
        if
            :: s > 5 -> break
            :: else ->  print("Printing from comp2: %s", s)
        fi
        s++
    od
    printAccessable = true;
}
}
