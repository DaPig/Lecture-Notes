#define NUM_PHIL 10

byte forks[NUM_PHIL];
byte philEats[NUM_PHIL];
int hasEaten[NUM_PHIL];

proctype phil(int id) {
    int secID;
    if
        :: id == (NUM_PHIL - 1) -> secID = 0;
         :: else -> secID = id + 1;
    fi
    do
        ::
            if
               :: (id % 2 == 0 && philEats[id] == 0) ->
                   atomic{
                       if
                         :: (forks[secID] != 0 && forks[id] != 0) -> forks[secID]--;
                         :: else -> goto forksBusy;
                       fi
                   }
                   atomic {
                    if
                     :: (forks[id] != 0 && forks[secID] == 0) -> forks[id]--; philEats[id]++;
                     :: else -> forks[secID]++; goto forksBusy;
                    fi
                    }
               :: (id % 2 == 1 && philEats[id] == 0) ->
                    atomic {
                        if
                         :: (forks[id] != 0 && forks[secID] != 0) -> forks[id]--;
                         :: else -> goto forksBusy;
                        fi
                    }
                    atomic {
                        if
                         :: (forks[secID] != 0 && forks[id] == 0) -> forks[secID]--; philEats[id]++;
                         :: else -> forks[id]++; goto forksBusy;
                        fi
                    }
            fi
            assert(forks[id] == 0 && forks[secID] == 0 && philEats[id] == 1);
            printf("Pilosopher %d is eating with forks %d and %d\n", id, id, secID);
            hasEaten[id]++;
            forksBusy:

    ::  if
            :: (philEats[id] == 1) -> philEats[id] = 0; forks[id] = 1; forks[secID] =1;
                printf("Phil %d released fork %d and %d \n" , id, id, secID);
        fi
        printf("Pilosopher %d is thinking\n", id);
  od
}

init  {
  int i = 0;

  do
  :: i >= NUM_PHIL -> break
  :: else ->
        run phil(i);
        forks[i] = 1;
        philEats[i] = 0;
        hasEaten[i] = 0;
        i++
  od
}
