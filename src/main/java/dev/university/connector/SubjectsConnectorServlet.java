package dev.university.connector;

import com.dhtmlx.connector.TreeGridConnector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Class SubjectsConnectorServlet.
 *
 * Provides hierarchical structure of subjects.
 */
public class SubjectsConnectorServlet extends BaseConnectorServlet {
	@Override
	protected void configure(HttpServletRequest req, HttpServletResponse res) {
		try {
			final TreeGridConnector treeGridConnector = makeTreeGridConnector(req, res);
				treeGridConnector.render_table(
					"subjects",
					"id",
					String.join(",", new String[]{
							"subjectName",
							"id"
					}),
					"",
					"parentId"
			);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
