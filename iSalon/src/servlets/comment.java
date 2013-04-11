package servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class login
 */
@WebServlet("/comment")
public class comment extends HttpServlet {
	private static final long serialVersionUID = 1L;
	List<commentObject> list;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public comment() {
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
		HttpServletRequest req = (HttpServletRequest) request;
		list = (List<commentObject>) req.getServletContext().getAttribute("feedback");
		if(list ==null)
		{
			list = new ArrayList<commentObject>();
			req.getServletContext().setAttribute("feedback",list);
		}
	
		if (req.getParameter("comment") != null )
		{
			list.add(new commentObject("joey",req.getParameter("comment")));
		}
		request.getRequestDispatcher("/WEB-INF/views/comment.jsp").forward(request, response);
	}

}
