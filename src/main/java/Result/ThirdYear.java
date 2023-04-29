package Result;

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
 * Servlet implementation class ThirdYear
 */
@WebServlet("/thirdY")
public class ThirdYear extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ThirdYear() {
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
		RequestDispatcher rd = request.getRequestDispatcher("ThirdYear.jsp");
		try {
			
			PreparedStatement pstmt2 = con.prepareStatement("select * from thirdyear where Roll_No=?");
			pstmt2.setString(1,rollno);
			ResultSet rs = pstmt2.executeQuery();
			boolean flag = rs.next();
			if(flag)
			{
				request.setAttribute("thirdyear","failed");
			}
			else
			{
				int RockM = Integer.parseInt(request.getParameter("rm"));
				int Ugcoal = Integer.parseInt(request.getParameter("uc"));
				int UgMetal = Integer.parseInt(request.getParameter("um"));
				int MineHR = Integer.parseInt(request.getParameter("mhr"));
				int MineM = Integer.parseInt(request.getParameter("mm"));
				int MineIA = Integer.parseInt(request.getParameter("mia"));
				int MineGC = Integer.parseInt(request.getParameter("mgc"));
				int SMM = Integer.parseInt(request.getParameter("smm"));
				int MineMZ = Integer.parseInt(request.getParameter("mmz"));
				int FAI = Integer.parseInt(request.getParameter("fai"));
				int MineSE = Integer.parseInt(request.getParameter("mse"));
				int totalMarks = RockM + Ugcoal+UgMetal + MineHR+MineM+MineIA+MineGC+SMM+MineMZ+FAI+MineSE;
				float percent = totalMarks*100/1100;
				String grade = ThirdYear.getGrade(percent);
					PreparedStatement pstmt = con.prepareStatement("insert into thirdyear values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
					pstmt.setInt(1,RockM);
					pstmt.setInt(2,Ugcoal);
					pstmt.setInt(3,UgMetal);
					pstmt.setInt(4,MineHR);
					pstmt.setInt(5,MineM);
					pstmt.setInt(6,MineMZ);
					pstmt.setInt(7,MineIA);
					pstmt.setInt(8,MineGC);
					pstmt.setInt(9,FAI);
					pstmt.setInt(10,SMM);
					pstmt.setInt(11,MineSE);
					pstmt.setString(12,rollno);
					pstmt.setInt(13,totalMarks);
					pstmt.setFloat(14,percent);
					pstmt.setString(15,grade);
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
