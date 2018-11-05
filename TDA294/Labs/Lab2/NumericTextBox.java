/**
 * This class represents a text box for numeric values.
 * Its content is represented as an array of single digits.
 *
 * Your task is to add JML contracts for each method in this class
 * that reflect the informal descriptions in the Javadoc comments.
 *
 * Also add JML invariants for the fields "cursorPosition" and "content" that make sure that
 *
 *  - the cursorPosition is always a valid value (see comment for cursorPosition).
 *  - the content before the cursor contains only single digits
 *  - the content after the cursor is EMPTY
 *
 * Furthermore, think about which methods are pure and use the appropriate annotation.
 *
 * Hint: If you use variables for array indices in an assignable-clause,
 *       their values are evaluated in the pre-state.
 */
public class NumericTextBox
{
	public final int EMPTY = -1;

	/**
	 * The current cursor position, i.e. the position after the previously entered digit.
	 * If this is 0, then the cursor is placed at the very beginning of the text box.
	 * Note that the number of possible cursor positions is greater by one than
	 * the length of the text box.
	 */

	/*@
	  @ invariant (cursorPosition  <= content.length && cursorPosition >= 0);
	  @*/
	private /*@spec_public@ non_null*/int cursorPosition;

	/**
	 * This array stores the contents of the text box. At every position
	 * before the cursor, there is a valid value (i.e. a single digit).
	 * Positions after the cursor must be EMPTY.
	 */

	/*
	- the content before the cursor contains only single digits
	- the content after the cursor is EMPTY
	*/

	/*@
	@ invariant (\forall int i; i>=0 && i < cursorPosition; content[i] < 10 && content[i] >= 0);
	@*/

	/*@
	@ invariant (\forall int i; i>=cursorPosition && i<content.length; content[i]==EMPTY);
	@*/

	private /*@spec_public non_null@*/int[] content;

	/**
	 * Holds the current TextBoxRenderer. This can be null, which means that there
	 * is no renderer assigned.
	 */
	private /*@spec_public nullable@*/TextBoxRenderer textBoxRenderer;

	/**
	 * Gets the currently assigned TextBoxRenderer.
	 */

 /*@ public normal_behavior
	@ ensures textBoxRenderer != null ==> \result == this.textBoxRenderer;
	@ assignable \nothing;
	@*/
	public /*@ pure @*/ TextBoxRenderer getRenderer()
	{
		return textBoxRenderer;
	}

	/**
	 * Sets the TextBoxRenderer used for rendering this text box.
	 * It can also be set to null, if the text box is not rendered.
	 */
	/*@
	  @ public normal_behavior
		@ requires true;
	  @ ensures textBoxRenderer == renderer;
		@ ensures true;
		@ assignable textBoxRenderer;
	  @*/
	public void setRenderer(TextBoxRenderer renderer)
	{
		this.textBoxRenderer = renderer;
	}

	/**
	 * Checks whether a given input is a single digit (i.e. between 0 and 9).
	 *
	 * @param input The input character.
	 * @return true if the input is a single digit, false otherwise.
	 */
	/*@
	  @ public normal_behavior
	  @ requires input != null;
	  @ ensures \result == (input >= 0 && input <= 9);
	  @*/
	public /*@pure@*/boolean isSingleDigit(int input)
	{
		return input >= 0 && input <= 9;
	}

	/**
	 * Clears the text box and resets the cursor to the start.
	 * Also sets the contentChanged flag of the current TextBoxRenderer, if any.
	 */

	/*@
	  @ public normal_behavior
		@ requires true;
	  @ ensures cursorPosition == 0;
		@ ensures textBoxRenderer != null ==> (textBoxRenderer.contentChanged == true);
		@ ensures (\forall int i; i>=0 && i<content.length; content[i] == EMPTY);
		@ ensures true;
		@ assignable textBoxRenderer.contentChanged, content[*], cursorPosition;
	  @*/
	public void clear()
	{
		/*@ loop_invariant
		  @ i>= 0 && i <= content.length &&
			@   (\forall int x; x >= 0 && x < i; content[x] == EMPTY);
			@ decreasing content.length - i;
			@ assignable content[*];
			@*/
		for(int i = 0; i<content.length; i++) {
			content[i] = EMPTY;
		}
		cursorPosition = 0;
		if(this.textBoxRenderer != null) {
			this.textBoxRenderer.contentChanged = true;
		}
	}

	/**
	 * Enters a given input character into the text box and moves the cursor forward.
	 * If the input can be processed, the contentChanged flag of the current TextBoxRenderer (if any) is set.
	 * If an exception occurs, the TextBoxRenderer's showError flag is set instead.
	 *
	 * @param input the input character.
	 *
	 * @throws IllegalArgumentException if the input was not a single digit.
	 *
	 * @throws RuntimeException if the input was valid, but the cursor is at the end
	 *                          of the text box and no further input can be accepted.
	 */
	/*@
	  @ public normal_behavior
	  @ requires input != null && isSingleDigit(input) && cursorPosition < content.length;
		@ ensures cursorPosition == \old(cursorPosition) + 1;
		@ ensures content[(\old(cursorPosition))] == input;
	  @ ensures textBoxRenderer != null ==> textBoxRenderer.contentChanged;
	  @ assignable content[cursorPosition], cursorPosition, textBoxRenderer.contentChanged ;
	  @
	  @ also
	  @
	  @ public exceptional_behavior
	  @ requires  cursorPosition < content.length && !isSingleDigit(input);
	  @ signals_only IllegalArgumentException;
		@ signals (IllegalArgumentException) textBoxRenderer != null ==> textBoxRenderer.showError;
	  @ assignable textBoxRenderer.showError;
	  @
	  @ also
	  @
	  @ public exceptional_behaviour
	  @ requires cursorPosition >= content.length && isSingleDigit(input);
	  @ signals_only RuntimeException;
		@ signals (RuntimeException) textBoxRenderer != null ==> textBoxRenderer.showError;
	  @ assignable textBoxRenderer.showError;
	  @
	  @*/
	public void enterCharacter(int input)
	{
		if(!isSingleDigit(input)) {
			if(textBoxRenderer != null) {
				textBoxRenderer.showError = true;
			}
			throw new IllegalArgumentException();
		} else if(cursorPosition >= content.length) {
			if(textBoxRenderer != null) {
				textBoxRenderer.showError = true;
			 }
			throw new RuntimeException();
		} else {
				this.content[cursorPosition] = input;
				cursorPosition++;
				if(textBoxRenderer != null) {
					textBoxRenderer.contentChanged = true;
				}
		}
	}

	/**
	 * Deletes the most recently entered character and moves the cursor back one position.
	 * Also sets the current TextBoxRenderer's contentChanged flag (if any).
	 *
	 * @throws RuntimeException if the cursor is at the very beginning. In this case
	 *                          the showError flag of the TextBoxRenderer is set
	 *                          before the exception is thrown.
	 */
	/*@
	  @ public normal_behavior
		@ requires cursorPosition > 0;
		@ requires true;
	  @ ensures textBoxRenderer != null ==> textBoxRenderer.contentChanged;
	  @ ensures cursorPosition == \old(cursorPosition) - 1;
		@ ensures content[cursorPosition] == EMPTY;
	  @ assignable content[cursorPosition-1], cursorPosition, textBoxRenderer.contentChanged;
	  @
	  @ also
	  @
	  @ public exceptional_behavior
	  @ requires cursorPosition == 0;
	  @ signals_only RuntimeException;
		@ 	signals (RuntimeException) textBoxRenderer != null ==> textBoxRenderer.showError;
	  @ assignable textBoxRenderer.showError;
	  @
	  @*/
	public void backspace()
	{
		if(cursorPosition == 0) {
			if(textBoxRenderer != null) {
				textBoxRenderer.showError = true;
			}
			throw new RuntimeException();
		} else {
				cursorPosition--;
				content[cursorPosition] = EMPTY;
				if(this.textBoxRenderer != null) {
					textBoxRenderer.contentChanged = true;
				}
			}
		}
}

/**
 * This class represents a renderer that is responsible for displaying the
 * text box to the user in some way.
 */
class TextBoxRenderer
{
	/**
	 * Whether the content was changed (so the rendered text box needs a refresh).
	 */
	/*@
	  @ public invariant
	  @ requires contentChanged != null;
	  @*/
	public /*@spec_public@*/boolean contentChanged = false;

	/**
	 * Whether an exception occured (which should be represented in the rendered text box).
	 */
	/*@
	  @ public invariant
	  @ requires showError != null;
	  @*/
	public /*@spec_public@*/ boolean showError = false;
}
