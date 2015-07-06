package dev.university.connector;

import com.dhtmlx.connector.GridConnector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Class CourseStudentsConnectorServlet.
 *
 * Provides students attending particular course.
 */
public class CourseStudentsConnectorServlet extends BaseConnectorServlet {
	@Override
	protected void configure(HttpServletRequest req, HttpServletResponse res) {
		try {
			// Getting courseId from parameters.
			final int courseId = Integer.valueOf(req.getParameterMap().get("id")[0]);

			final GridConnector gridConnector = makeGridConnector(req, res);
			gridConnector.render_sql(
					// I am aware of sql injections but I did not find the way how to use parameterized sql queries.
					String.format("select * from courses_students where courseId = %d", courseId),
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
