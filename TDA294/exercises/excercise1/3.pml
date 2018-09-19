bool b1,b2;
bool b;

proctype TRUE() {
  if
    :: b -> b1= true; printf("1\n")
    :: true  -> b1=false;  printf("2\n")
  fi
}

proctype ELSE() {
  if
    :: b -> b2=true; printf("1\n")
    :: else  -> b2=false;  printf("2\n")
  fi
}

init {
  if
    :: b = true;
    :: b = false;
  fi
  run TRUE()
  run ELSE()

  _nr_ptr == 1 -> assert(b1 == b2)


}
