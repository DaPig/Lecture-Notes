# Individual Milestone 2
## Tobias Alldén

---
# Web Frontend
Running Sonar scanner on the web frontend detects only `7` duplicated blocks. These are all in `node_modules` and are as such part of third-party addons to the project. Thus there is no refactoring needed here.

# Android Frontend
The android frontend is another matter however, here Sonarqube detects 142 duplicated blocks with a 14.2% duplication rate in total.
These clones includes 34 duplicated files, 2,561 duplicated lines, and as previously mentioned: 142 duplicated blocks. The files with the most duplicated  code are the following:

| Filename | Duplicated Lines | Percentage |
|-------|-------|--------|
| backend/models/StressRelieving.java   | 76    | 86.4%      |
| backend/models/UpdateAgingTreatmentTest.java   | 65     | 85.5%      |
| backend/models/UpdateStressRelieving.java  | 75     | 85.4%      |


Looking at the files and using Golomingis' classification we classify the clones into their respective area.

| Filename | Method name | Cloned Lines | Type of Clone| Notes |
|-------|-------|--------|
| backend/models/StressRelieving.java   | Entire Class (All methods)    | Entire Class      |Exact clone |The code is the exact same as in `UpdateStressRelieving` in the same directory|
| backend/models/UpdateAgingTreatmentTest.java      | Constructor    | 11-28| Exact Clone     | Exact same constructor as in ```backend/models/UpdateHardening.java```
| postPrinting/Tampering/tamperingTestActivity.java    | tempButtonPressed(View view)    | 11-83      |Exact clone |The code is the exact same as in `UpdateStressRelieving` in the same directory|
|postPrinting/Tampering/tamperingTestActivity.java    | tempButtonPressed(View view)    | 77-85      |Exact Clone | Exact same method as in ```postPrinting/AgingTreatment/agingTreatmentTestActivity.java``` in the same folder. Handles a button click, could be abstracted up to remove duplicate|

# Refactoring/ Removal
Refactoring the duplicated can be done in a multitude of ways. I chose to refactor the file ``` postPrinting/SolutionTreatment/solutionTreatmentTestActivity.java``` with the two methods ```  public void tempButtonPressed(View view)```and ```commentViewPressed(View view)```  since these basically contain the same code. I will create one common method for this that changes its behavior based on if tempButton or commentView is pressed.

``` java
// Original Code:

//region Temperature Button Pressed
public void tempButtonPressed(View view) {
    didSetTemp = true;
    didEditComment = false;
    int position = (int) view.getTag();
    didPresstag = position;
    EditTextDialog editTextDialog = new EditTextDialog(this, this);
    editTextDialog.showDialog("Edit temperature", "Change the temperature here...", InputType.TYPE_CLASS_NUMBER);
    temperatureButton = view.findViewById(R.id.tempButton);
}
//endregion

    //region Comment View Pressed
    public void commentViewPressed(View view) {
        didEditComment = true;
        didSetTemp = false;
        int position = (int) view.getTag();
        didPresstag = position;
        EditTextDialog editTextDialog = new EditTextDialog(this, this);
        editTextDialog.showDialog("Add comment", "Add your comment here...", InputType.TYPE_CLASS_TEXT);
        commentView = view.findViewById(R.id.text);
    }
    //endregion


    //----  Refactored Code: ---\\
    public void commentViewOrTempButtonPressed(View view) {
      int position = (int) view.getTag();
      didPresstag = position;
      EditTextDialog editTextDialog = new EditTextDialog(this, this);
      if(view instanceof Button) { // View vlicked have type of button, i.e. tempButton
        didEditComment = true;
        didSetTemp = false;
        editTextDialog.showDialog("Add comment", "Add your comment here...", InputType.TYPE_CLASS_TEXT);
        commentView = view.findViewById(R.id.text);
      } else {
        didSetTemp = true;
        didEditComment = false;
        editTextDialog.showDialog("Edit temperature", "Change the temperature here...", InputType.TYPE_CLASS_NUMBER);
        temperatureButton = view.findViewById(R.id.tempButton);
      }
    }

```
As additional methods in the class are very similar as well, this refactored method could also be extended. Further, as the class diagram does not change due to this changes (other than having only one public method instead of the previous two), i did not include this.

The refactoring done is basically combining these two methods, where the unique behaviour is based on whether the propagated view is of type button. I do not believe that this refactored code is better than the initial version as we only reduced the total number of lines by 1 while also including a if-statement, making debugging a bit more difficult. Thus this refactoring is not needed. 
