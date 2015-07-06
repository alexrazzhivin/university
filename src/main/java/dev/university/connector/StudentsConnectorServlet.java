package dev.university.connector;

import com.dhtmlx.connector.GridConnector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Class StudentsConnectorServlet.
 *
 * Provides students for particular group.
 */
public class StudentsConnectorServlet extends BaseConnectorServlet {
	@Override
	protected void configure(HttpServletRequest req, HttpServletResponse res) {
		try {
			// Getting groupId from parameters.
			final int groupId = Integer.valueOf(req.getParameterMap().get("id")[0]);

			final GridConnector gridConnector = makeGridConnector(req, res);
			gridConnector.render_sql(
					// I am aware of sql injections but I did not find the way how to use parameterized sql queries.
					String.format("select * from students where groupId = %d", groupId),
					"id",
					String.join(",", new String[]{
							"familyName",
							"name",
							"patronymic"
					})
			);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
