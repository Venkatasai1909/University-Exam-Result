package Faculty;
import DataBase.MyListener;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Servlet implementation class FacultyLogin
 */
@WebServlet("/facultyL")
public class FacultyLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FacultyLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
    Connection con;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String userId = request.getParameter("userId");
		String password = request.getParameter("pword");
		ServletContext sc  = getServletContext();
		con = (Connection)sc.getAttribute("database");
		
		try {
			RequestDispatcher rd ;
			PreparedStatement pstmt =  con.prepareStatement("select * from faculty where userId=? and password=?");
			pstmt.setString(1, userId);
			pstmt.setString(2,password);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next())
			{
				rd = request.getRequestDispatcher("Years.html");
			}
			else
			{
				rd = request.getRequestDispatcher("FacultyLogin.jsp");
				request.setAttribute("status","failure");
			}
			rd.forward(request, response);
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
