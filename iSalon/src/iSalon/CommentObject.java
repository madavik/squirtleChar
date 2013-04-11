package iSalon;

public class CommentObject {

	private String name;
	private String comment;
	
	
	
	public CommentObject(String name, String comment)
	{
		setName(name);
		setComment(comment);
		
	}


	/**
	 * @return the bgColor
	 */
	public String getName() {
		return name;
	}


	/**
	 * @param bgColor the bgColor to set
	 */
	public void setName(String n) 
	{
		this.name = n;
	}


	/**
	 * @return comment
	 */
	public String getComment() {
		return comment;
	}


	/**
	 * @param sets comment
	 */
	public void setComment(String c) 
	{
		this.comment = c;
	}
	
}