package Student;
import DataBase.MyListener;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Servlet implementation class StudentLogin
 */
@WebServlet("/studentL")
public class StudentLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StudentLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
    static String Hno;
    Connection con;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		ServletContext sc = getServletContext();
		con = (Connection)sc.getAttribute("database");
		String Rno = request.getParameter("hno");
		StudentLogin.Hno = Rno;
		long mob = Long.parseLong(request.getParameter("pass"));
		try {
			PreparedStatement pstmt = con.prepareStatement("select * from student where Roll_No = ? and Mobile_Number = ?");
			pstmt.setString(1, Rno);
			pstmt.setLong(2, mob);
			ResultSet rs = pstmt.executeQuery();
			RequestDispatcher rd ;
			if(rs.next())
			{
				rd = request.getRequestDispatcher("SYears.html");
			}
			else
			{
				rd = request.getRequestDispatcher("StudentLogin.jsp");
				request.setAttribute("status", "failed");
			}
			rd.forward(request, response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public static String getRollNo() {
		return Hno;
	}

}
