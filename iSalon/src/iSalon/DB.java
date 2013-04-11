package iSalon;

import java.sql.*;

import javax.naming.*;
import javax.sql.*;

public class DB {

	/**
	 *  This opens a connection by obtaining a DataSource that is 
	 * configured in META-INF/context.html.  It takes care of pooling
	 * DB connections.
	 */
	public static Connection openConnection () throws SQLException {
		try {
			Context initContext = new InitialContext();
			Context envContext = (Context) initContext.lookup("java:comp/env");
			DataSource ds = (DataSource) envContext.lookup("jdbc/myDB");
			return ds.getConnection();
		}
		catch (NamingException e) {
			return null;
		}
	}

	/**
	 * Assuming that a transaction has been started, commits the transaction.
	 * @param db
	 */
	public static void commit (Connection db) {
		try {
			db.commit();
		}
		catch (Exception e) {
		}
	}

	/**
	 * Assuming that a transaction has been started, aborts the transaction.
	 * @param db
	 */
	public static void rollback (Connection db) {
		try {
			db.rollback();
		}
		catch (Exception e) {
		}
	}

	public static void close(Connection db) {
		try {
			db.close();
		}
		catch (Exception e) {
		}
		
	}
}
