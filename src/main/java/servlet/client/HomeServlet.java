package servlet.client;

import java.io.IOException;
import java.util.List;

import dao.VideoDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet({ "", "/signin", "/register", "/forgotPassword", "/editProfile", "/changePassword", "/videoFavorite",
		"/videoDetail" })
public class HomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private VideoDAO videoDAO = new VideoDAO();

	public HomeServlet() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String uri = request.getRequestURI();
		if (uri.contains("/signin")) {
			request.getRequestDispatcher("/views/client/login.jsp").forward(request, response);
			return;
		} else if (uri.contains("/register")) {
			request.getRequestDispatcher("/views/client/register.jsp").forward(request, response);
			return;
		} else if (uri.contains("/forgotPassword")) {
			request.getRequestDispatcher("/views/client/forgotPassword.jsp").forward(request, response);
			return;
		} else if (uri.contains("/editProfile")) {
			request.getRequestDispatcher("/views/client/editProfile.jsp").forward(request, response);
			return;
		} else if (uri.contains("/changePassword")) {
			request.getRequestDispatcher("/views/client/changePassword.jsp").forward(request, response);
			return;
		} else if (uri.contains("/videoFavorite")) {
			request.getRequestDispatcher("/views/client/videoFavorite.jsp").forward(request, response);
			return;
		} else if (uri.contains("/videoDetail")) {
			request.getRequestDispatcher("/views/client/videoDetail.jsp").forward(request, response);
			return;
		}
		request.setAttribute("listVideo", videoDAO.findAll());
		request.getRequestDispatcher("/views/client/home.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}
