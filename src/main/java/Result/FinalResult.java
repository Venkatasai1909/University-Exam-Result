package Result;
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
 * Servlet implementation class FinalResult
 */
@WebServlet("/finalR")
public class FinalResult extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FinalResult() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
    Connection con;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		ServletContext sc = getServletContext();
		con = (Connection)sc.getAttribute("database");
		String rollno = request.getParameter("rno");
		RequestDispatcher rd = request.getRequestDispatcher("FinalResult.jsp");
		try {
			PreparedStatement pstmt2 = con.prepareStatement("select * from finalresult where Roll_No = ?");
			pstmt2.setString(1, rollno);
			ResultSet rs = pstmt2.executeQuery();
			boolean flag = rs.next();
			if(flag)
			{
				request.setAttribute("finalresult", rollno);
			}
			else {
				int firstyear = Integer.parseInt(request.getParameter("fy"));
				int secondyear = Integer.parseInt(request.getParameter("sy"));
				int thirdyear = Integer.parseInt(request.getParameter("ty"));
				int fourthyear = Integer.parseInt(request.getParameter("fty"));
				int totalPercent = firstyear+secondyear+thirdyear+fourthyear;
				float percent = totalPercent/4;
				String grade = FinalResult.getGrade(percent);
				PreparedStatement pstmt = con.prepareStatement("insert into finalresult values(?,?,?,?,?,?,?)");
				pstmt.setString(1,rollno);
				pstmt.setInt(2, firstyear);
				pstmt.setInt(3, secondyear);
				pstmt.setInt(4, thirdyear);
				pstmt.setInt(5, fourthyear);
				pstmt.setFloat(6, percent);
				pstmt.setString(7, grade);
				if(pstmt.executeUpdate()!=0){
					request.setAttribute("status", "success");
				}
		}
				rd.forward(request, response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	private static String getGrade(float percent)
	{
		if(percent>=90 && percent<=100)
		{
			return "A+";
		}
		else if(percent>=75 && percent<90)
		{
			return "A";
		}
		else if(percent>=60 && percent<75)
		{
			return "B";
		}
		else if(percent>=50 && percent<60)
		{
			return "C";
		}
		else if(percent>=40 && percent<50)
		{
			return "D";
		}
		else 
		{
			return "E";
		}
	}

}
