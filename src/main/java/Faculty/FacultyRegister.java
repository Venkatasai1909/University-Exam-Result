package Faculty;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import DataBase.MyListener;
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
 * Servlet implementation class FacultyRegister
 */
@WebServlet("/facultyR")
public class FacultyRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FacultyRegister() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
    Connection con;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		try {
			ServletContext sce = getServletContext();
			con = (Connection)sce.getAttribute("database");
			String userId = request.getParameter("userId");
			PreparedStatement pstmt2 = con.prepareStatement("select * from faculty where UserId=?");
			pstmt2.setString(1, userId);
			ResultSet rs = pstmt2.executeQuery();
			RequestDispatcher rd = request.getRequestDispatcher("FacultyRegister.jsp");
			if(rs.next()==true)
			{
				request.setAttribute("status", "failed");
			}
			else
			{
				String pass = request.getParameter("pass");
				PreparedStatement pstmt = con.prepareStatement("insert into faculty values(?,?)");
				pstmt.setString(1, userId);
				pstmt.setString(2, pass);
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
