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
 * Servlet implementation class FirstYear
 */
@WebServlet("/firstY")
public class FirstYear extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FirstYear() {
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
		RequestDispatcher rd = request.getRequestDispatcher("FirstYear.jsp");
		try {
			PreparedStatement pstmt2 = con.prepareStatement("select * from firstyear where Roll_No=?");
			pstmt2.setString(1,rollno);
			ResultSet rs = pstmt2.executeQuery();
			boolean flag = rs.next();
			if(flag)
			{
				request.setAttribute("firstyear","failed");
			}
			else
			{
				int eng = Integer.parseInt(request.getParameter("en"));
				int M1 = Integer.parseInt(request.getParameter("m1"));
				int M2 = Integer.parseInt(request.getParameter("m2"));
				int Phy = Integer.parseInt(request.getParameter("phy"));
				int Chem = Integer.parseInt(request.getParameter("chem"));
				int Ed = Integer.parseInt(request.getParameter("ed"));
				int Cp = Integer.parseInt(request.getParameter("Cp"));
				int BEE = Integer.parseInt(request.getParameter("bee"));
				int BME = Integer.parseInt(request.getParameter("bme"));
				int totalMarks = eng+M1+M2+Phy+Chem+Ed+Cp+BEE+BME;
				float Percentage = totalMarks*100/900;
				String grade = FirstYear.getGrade(Percentage);
				PreparedStatement pstmt = con.prepareStatement("insert into firstyear values(?,?,?,?,?,?,?,?,?,?,?,?,?)");
				pstmt.setInt(1,eng);
				pstmt.setInt(2,M1);
				pstmt.setInt(3,M2);
				pstmt.setInt(4,Phy);
				pstmt.setInt(5,Chem);
				pstmt.setInt(6,BEE);
				pstmt.setInt(7,BME);
				pstmt.setInt(8,Cp);
				pstmt.setInt(9,Ed);
				pstmt.setInt(10,totalMarks);
				pstmt.setFloat(11,Percentage);
				pstmt.setString(12, grade);
				pstmt.setString(13, rollno);
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
