package dev.university.connector;

import com.dhtmlx.connector.GridConnector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Class CoursesConnectorServlet.
 *
 * Provides courses for the particular subject.
 */
public class CoursesConnectorServlet extends BaseConnectorServlet {
	@Override
	protected void configure(HttpServletRequest req, HttpServletResponse res) {
		try {
			// Getting subjectId from parameters.
			final int subjectId = Integer.valueOf(req.getParameterMap().get("id")[0]);

			final GridConnector gridConnector = makeGridConnector(req, res);
			gridConnector.render_sql(
					// I am aware of sql injections but I did not find the way how to use parameterized sql queries.
					String.format("select * from courses where subjectId = %d", subjectId),
					"id",
					String.join(",", new String[]{
							"courseName"
					})
			);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
