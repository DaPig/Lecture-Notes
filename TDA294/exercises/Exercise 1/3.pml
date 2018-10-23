bool b;
int varTrue, varFalse;

proctype TRUE() {
  if
    :: b ->varTrue = 1
    :: true  -> varTrue = 2
  fi
}

proctype ELSE() {
  if
    :: b -> varFalse = 1
    :: else  -> varFalse = 2
  fi
}
init {
  if
    :: b = true
    :: b = false
  fi;
    run TRUE();
    run ELSE();

    (_nr_pr == 1) -> assert(varTrue == varFalse)
}
