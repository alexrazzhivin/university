package dev.university.connector;

import com.dhtmlx.connector.GridConnector;
import com.dhtmlx.connector.ThreadSafeConnectorServlet;
import com.dhtmlx.connector.TreeGridConnector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * Abstract Class BaseConnectorServlet.
 *
 */
public abstract class BaseConnectorServlet extends ThreadSafeConnectorServlet {
	private static final String SQL_DRIVER_NAME = "com.mysql.jdbc.Driver";
	private static final String DATABASE_URL = "jdbc:mysql://localhost/university";
	private static final String DATABASE_USER = "webuser";
	private static final String DATABASE_PASSWORD = "";

	/**
	 * Attempts to establish connection to predefined database.
	 * @return A connection to predefined database.
	 */
	protected Connection openDatabase() throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException {
		Class.forName(SQL_DRIVER_NAME).newInstance();

		return DriverManager.getConnection(DATABASE_URL, DATABASE_USER, DATABASE_PASSWORD);
	}

	/**
	 * Instantiates a new grid connector over predefined database.
	 * @param req The HTTP request
	 * @param res The HTTP response
	 * @return A grid connector object.
	 */
	protected GridConnector makeGridConnector(HttpServletRequest req, HttpServletResponse res) throws ClassNotFoundException, SQLException, InstantiationException, IllegalAccessException {
		final Connection connection = openDatabase();
		final GridConnector gridConnector = new GridConnector(connection);
		gridConnector.servlet(req, res);

		return gridConnector;
	}

	/**
	 * Instantiates a new tree grid connector over predefined database.
	 * @param req The HTTP request
	 * @param res The HTTP response
	 * @return A tree grid connector object.
	 */
	protected TreeGridConnector makeTreeGridConnector(HttpServletRequest req, HttpServletResponse res) throws ClassNotFoundException, SQLException, InstantiationException, IllegalAccessException {
		final Connection connection = openDatabase();
		final TreeGridConnector treeGridConnector = new TreeGridConnector(connection);
		treeGridConnector.servlet(req, res);

		return treeGridConnector;
	}
}
