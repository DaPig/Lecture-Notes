public class Person {

  /*@ public invariant name != null; @*/
    private /*@ spec_public @*/ String name;

    /*@ public invariant age >= 0; @*/
    private /*@ spec_public @*/ int age;

    /*@ public invariant license.active ==> age >= 18 && license != null; @*/
    private /*@ spec_public @*/ DriverLicense license;


    public Person(String name, int age, DriverLicense license) {
	this.name    = name;
	this.age     = age;
	this.license = license;
    }


    /*@ public normal_behavior
      @ requires true;
      @ ensures \result == license.active();
      @*/
    public /*@ pure @*/ boolean canDrive() {
	return license.active();
    }

    /*@ public normal_behavior
      @ ensures age == \old(age) + 1;
      @ assignable age;
      @*/
    public void birthday() {
	age++;
    }

    /*@ public normal_behavior
    @ requires age >= 18;
    @ ensures license.active == true;
    @ assignable license.active;
    @
    @ also
    @ public exceptional_behavior
    @ requires age < 18;
    @ signals_only NotOldEnoughException;
    @ assignable \nothing;
    @*/
    public void activateLicense() throws NotOldEnoughException {
	if (age < 18) {
	    throw new NotOldEnoughException();
	}
	 license.setActive(true);
    }

}
