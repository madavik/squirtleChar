package iSalon;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import db.Utils;
/**
 * Servlet implementation class login
 */
@WebServlet("/Comment")
public class Comment extends HttpServlet {
	private static final long serialVersionUID = 1L;
	List<CommentObject> list;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Comment() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		// Turn off caching and grab the incoming prefix parameter
				response.setHeader("Cache-Control", "no-cache");
				response.setHeader("Pragma", "no-cache");
		 
		HttpServletRequest req = (HttpServletRequest) request;
		Connection db = null;
		
	
		//if they hit the submit button need to insert text into the db
		if (req.getParameter("Submit")!= null)
		{
			
			int Uid = -1;
			Object name1 = req.getSession().getAttribute("Name");
			Object text1 = req.getParameter("comment");
			
			try {
				
				// Open a connection
				db = Utils.openConnection(this);
				
				String name = (String) name1;
				String text = (String) text1;
				
				//need to get out the Uid from the users table
				
				String q = "Select Uid from Users WHERE LoginName = ? ";
				PreparedStatement st = db.prepareStatement(q);
				st.setString(1, name);
				ResultSet rs = st.executeQuery();
				
				while (rs.next())
				{
					Uid = rs.getInt("Uid");
				}
				
				//then use that to insert the comment into the comment table
				
				String u = "Insert into Comments (Uid, Text) VALUES(?,?)";
				PreparedStatement stmt = db.prepareStatement(u);
				stmt.setInt(1, Uid);
				stmt.setString(2, text);
				stmt.executeUpdate();
				
				
				//then select all from comment join users and get out all names and comments
				
				String v = "Select U.LoginName, C.Text from {oj Comments C LEFT OUTER JOIN Users U ON (C.Uid = U.Uid)}";
				PreparedStatement stm = db.prepareStatement(v);
				ResultSet r = stm.executeQuery();
				
				//build json array to display the comments.
				JSONArray names = new JSONArray();
				JSONArray comment = new JSONArray();
				JSONObject result = new JSONObject();
				if(r != null)
				{
					while( r.next() )
					{
						names.put(r.getString("LoginName"));
						comment.put(r.getString("Text"));
					}
					
					
				}
				else
				{
					try {
							result.put("success", false);
						}
						catch (JSONException e) 
						{
							e.printStackTrace();
							result.put("message", "Error with login, Try again");
						}
				}
				
				try {
					result.put("success", true);
					result.put("names", names);
					result.put("comments", comment);
					
				}

				catch (JSONException e) {
					e.printStackTrace();
				}
					// Send back the result as an HTTP response
					response.setContentType("application/json"); //make sure you set the type
					response.getWriter().print(result);  //writes data directly to the network connection.
					response.getWriter().close();
					
					db.close();
					
					
				}
			
				catch (Exception e) {
					e.printStackTrace();
					
				}
				finally 
				{
					Utils.close(db);
				}
			
		}
		//if not then just get all comments from the db to populate but verify that they are logged in first
		else
		{
			
			
			if (req.getSession().getAttribute("Name") == null)
			{
				//if they are not logged in then redirect to the login.jsp page
				request.getRequestDispatcher("login.jsp").forward(request, response);
				return;
			}
			// select all from comments join users and get out all names and comments
			try{
				
				// Open a connection
				db = Utils.openConnection(this);
				
			String v = "Select U.LoginName, C.Text from {oj Comments C LEFT OUTER JOIN Users U ON (C.Uid = U.Uid)}";
			PreparedStatement stm = db.prepareStatement(v);
			ResultSet r = stm.executeQuery();
			
			//build json array to display the comments.
			JSONArray names = new JSONArray();
			JSONArray comment = new JSONArray();
			JSONObject result = new JSONObject();
			if(r != null)
			{
				while( r.next() )
				{
					names.put(r.getString("LoginName"));
					comment.put(r.getString("Text"));
				}
				
				
			}
			else
			{
				try {
						result.put("success", false);
					}
					catch (JSONException e) 
					{
						e.printStackTrace();
						result.put("message", "Error with login, Try again");
					}
			}
			
			try {
				result.put("success", true);
				result.put("names", names);
				result.put("comments", comment);
				
			}

			catch (JSONException e) {
				e.printStackTrace();
			}
				// Send back the result as an HTTP response
				response.setContentType("application/json"); //make sure you set the type
				response.getWriter().print(result);  //writes data directly to the network connection.
				response.getWriter().close();
				
				db.close();
				
				
			}
		
			catch (Exception e) {
				e.printStackTrace();
				
			}
			finally 
			{
				Utils.close(db);
			}
			
		}
		
		
	}// end of doPost
	
	
}//end of class
/*
list = (List<CommentObject>) req.getServletContext().getAttribute("feedback");

if(list ==null)
{
	list = new ArrayList<CommentObject>();
	req.getServletContext().setAttribute("feedback",list);
}

if (req.getParameter("comment") != null )
{
	list.add(new CommentObject((String)name ,req.getParameter("comment")));
}
request.getRequestDispatcher("/WEB-INF/comment.jsp").forward(request, response);
}

}
*/
