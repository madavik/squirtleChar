package iSalon;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONException;
import org.json.JSONObject;

import db.Utils;
import db.Helpers;

/**
 * Servlet implementation class Register
 */
@WebServlet("/Register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Register() {
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
	protected void doPost(HttpServletRequest req, HttpServletResponse rsp) throws ServletException, IOException {
		// Turn off caching and grab the incoming prefix parameter
		rsp.setHeader("Cache-Control", "no-cache");
		rsp.setHeader("Pragma", "no-cache");
		JSONObject result = new JSONObject();
		//need to check in a book
		
		//to check in we need to remove the row from the checkedout books table where pid =  and bid = 
		
		Connection db = null;
		try {

			// Open a connection
			db = Utils.openConnection(this);
			
			
			String name = req.getParameter("username");
			String pw = Helpers.hash(req.getParameter("password"));
		
			
			String query = "Insert into Users (LoginName, Password) values(?,?)";
			PreparedStatement st = db.prepareStatement(query);
			st.setString(1, name);
			st.setString(2, pw);
			
			st.executeUpdate();

			
			
				try {
					result.put("success", true);

				}
				catch (JSONException e) {
					e.printStackTrace();
					result.put("message", "Error with Registering, Try again");
				}
		
			
			// Send back the result as an HTTP response
			rsp.setContentType("application/json"); //make sure you set the type
			rsp.getWriter().print(result);  //writes data directly to the network connection.
			rsp.getWriter().close();
			
			db.close();
			
			
		
		}
		catch (Exception e) {
			e.printStackTrace();
			try{
			result.put("message", "Error with Registering, Try again");
			}
			catch (Exception z) {
				z.printStackTrace();
			}
		}
		finally {
			Utils.close(db);
		}
	}
}
