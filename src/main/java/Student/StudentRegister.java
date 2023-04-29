package Student;
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
 * Servlet implementation class StudentRegister
 */
@WebServlet("/studentR")
public class StudentRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StudentRegister() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
    Connection con;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		ServletContext sc = getServletContext();
		con = (Connection)sc.getAttribute("database");
		String rollno = request.getParameter("rno");
		RequestDispatcher rd = request.getRequestDispatcher("StudentRegister.jsp");
		try {
			PreparedStatement pstmt2 = con.prepareStatement("select * from student where Roll_No = ?");
			pstmt2.setString(1, rollno);
			ResultSet rs = pstmt2.executeQuery();
			if(rs.next()==true)
			{
				request.setAttribute("status", "failed");
			}
			else
			{
				String name = request.getParameter("name");
				String fname = request.getParameter("fname");
				String mname = request.getParameter("mname");
				String mail = request.getParameter("mail");
				String branch = request.getParameter("branch");
				String gender = request.getParameter("gender");
				long mob = Long.parseLong(request.getParameter("mob"));
				PreparedStatement pstmt = con.prepareStatement("insert into student values(?,?,?,?,?,?,?,?)");
				pstmt.setString(1, name);
				pstmt.setString(2, fname);
				pstmt.setString(3, mname);
				pstmt.setString(4, branch);
				pstmt.setString(5, gender);
				pstmt.setString(6, mail);
				pstmt.setString(7, rollno);
				pstmt.setLong(8, mob);
				if(pstmt.executeUpdate()!=0)
				{
					request.setAttribute("status", "success");
				}
			}
			rd.forward(request, response);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
