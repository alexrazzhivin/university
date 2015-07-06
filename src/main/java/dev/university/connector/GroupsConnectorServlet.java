package dev.university.connector;

import com.dhtmlx.connector.GridConnector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Class GroupsConnectorServlet.
 * <p/>
 * Provides groups with total students number.
 */
public class GroupsConnectorServlet extends BaseConnectorServlet {
	@Override
	protected void configure(HttpServletRequest req, HttpServletResponse res) {
		try {
			final GridConnector gridConnector = makeGridConnector(req, res);
			gridConnector.render_table(
					"groups_with_students_number",
					"id",
					String.join(",", new String[]{
							"id",
							"groupName",
							"studentsNumber"
					})
			);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
