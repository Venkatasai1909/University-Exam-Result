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
 * Servlet implementation class FourthYear
 */
@WebServlet("/fourthY")
public class FourthYear extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FourthYear() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServ
	 * let#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
    Connection con;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		ServletContext sc = getServletContext();
		con = (Connection)sc.getAttribute("database");
		RequestDispatcher rd = request.getRequestDispatcher("FourthYear.jsp");
		String rollno = request.getParameter("rno");
		try {
			
			PreparedStatement pstmt2 = con.prepareStatement("select * from fourthyear where Roll_No=?");
			pstmt2.setString(1,rollno);
			ResultSet rs = pstmt2.executeQuery();
			boolean flag = rs.next();
			if(flag)
			{
				request.setAttribute("thirdyear","failed");
			}
			else
			{
			int MP = Integer.parseInt(request.getParameter("mp"));
			int NMM = Integer.parseInt(request.getParameter("nmm"));
			int MPS = Integer.parseInt(request.getParameter("mps"));
			int HRM = Integer.parseInt(request.getParameter("hrm"));
			int MLS = Integer.parseInt(request.getParameter("mls"));
			int RFE = Integer.parseInt(request.getParameter("rfe"));
			int HMPE = Integer.parseInt(request.getParameter("hmpe"));
			int ME = Integer.parseInt(request.getParameter("me"));
			int PS1 = Integer.parseInt(request.getParameter("ps1"));
			int PS2 = Integer.parseInt(request.getParameter("ps2"));
			int totalMarks =MP+NMM+MPS+HRM+MLS+RFE+HMPE+ME+PS1+PS2;
			float percent = totalMarks*100/1000;
			String grade = FourthYear.getGrade(percent);
				PreparedStatement pstmt = con.prepareStatement("insert into fourthyear values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
				pstmt.setString(1, rollno);
				pstmt.setInt(2, MP);
				pstmt.setInt(3, NMM);
				pstmt.setInt(4, MPS);
				pstmt.setInt(5, HRM);
				pstmt.setInt(6, MLS);
				pstmt.setInt(7, RFE);
				pstmt.setInt(8, HMPE);
				pstmt.setInt(9,ME);
				pstmt.setInt(10, PS1);
				pstmt.setInt(11, PS2);
				pstmt.setInt(12, totalMarks);
				pstmt.setFloat(13, percent);
				pstmt.setString(14, grade);
				if(pstmt.executeUpdate()!=0)
				{
					request.setAttribute("status", "success");
				}
			}
			rd.forward(request, response);
		}
		 catch (SQLException e) {
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
