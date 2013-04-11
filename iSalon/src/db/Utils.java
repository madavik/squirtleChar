package db;

import java.sql.*;
import javax.servlet.http.*;
import javax.naming.*;
import javax.sql.*;

public class Utils {

	// This opens a connection by obtaining a DataSource that is configured
	// in WEB-INF/web.xml and META-INF/context.html.  It takes care of pooling
	// DB connections.
	
	//Method 1.  The pure Java solution is to first create a driver object:

//Driver driver = (Driver) Class.forName("com.mysql.jdbc.Driver").newInstance();

//where com.mysql.jdbc.Driver is the Java class name of the driver.  The next step is to open the connection:

       //Connection c = DriverManager.connect("jdbc:mysql://atr.eng.utah.edu/dbname", username, userpassword);
	
	
	public static Connection openConnection (HttpServlet servlet) throws SQLException, NamingException, InstantiationException, IllegalAccessException, ClassNotFoundException {
		
		/*Driver driver = (Driver)Class.forName("com.mysql.jdbc.Driver").newInstance();
		
		Connection c = DriverManager.getConnection("jdbc:mysql://atr.eng.utah.edu/collection", "library", "library");
		
		return c;
		
		*/
		
		Context initContext = new InitialContext();
		Context envContext = 
				(Context) initContext.lookup("java:comp/env");
		DataSource ds = (DataSource) envContext.lookup("jdbc/myDB");
		//DataSource ds = (DataSource) envContext.lookup("jdbc/myDB");
		
		return ds.getConnection();
		
	}
	
	public static void close (Connection db) {
		try {
			db.close();
		}
		catch (Exception e) {
		}
	}

	public static void commitAndClose (Connection db) {
		try {
			db.commit();
			db.close();
		}
		catch (Exception e) {
		}
	}

	public static void rollbackAndClose (Connection db) {
		try {
			db.rollback();
			db.close();
		}
		catch (Exception e) {
		}
	}
}
