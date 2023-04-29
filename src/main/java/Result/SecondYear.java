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
 * Servlet implementation class SecondYear
 */
@WebServlet("/secondY")
public class SecondYear extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SecondYear() {
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
		RequestDispatcher rd = request.getRequestDispatcher("SecondYear.jsp");
		try {
		String rollno = request.getParameter("rno");
		PreparedStatement pstmt2 = con.prepareStatement("select * from secondyear where Roll_No=?");
		pstmt2.setString(1,rollno);
		ResultSet rs = pstmt2.executeQuery();
		boolean flag = rs.next();
		if(flag)
		{
			request.setAttribute("secondyear","failed");
		}
		else
		{
			int M3 = Integer.parseInt(request.getParameter("M3"));
			int md = Integer.parseInt(request.getParameter("md"));
			int ms1 = Integer.parseInt(request.getParameter("ms1"));
			int ms2 = Integer.parseInt(request.getParameter("ms2"));
			int mg1 = Integer.parseInt(request.getParameter("mg1"));
			int mg2 = Integer.parseInt(request.getParameter("mg2"));
			int bee = Integer.parseInt(request.getParameter("bee"));
			int mv = Integer.parseInt(request.getParameter("mv"));
			int mt = Integer.parseInt(request.getParameter("mt"));
			int db = Integer.parseInt(request.getParameter("db"));
			int ci = Integer.parseInt(request.getParameter("ci"));
			int es = Integer.parseInt(request.getParameter("es"));
			int totalMarks = M3+md+ms1+ms2+mg1+mg2+bee+mv+mt+db+ci+es;
			float percent = totalMarks*100/1200;
			String grade = SecondYear.getGrade(percent);
				PreparedStatement pstmt = con.prepareStatement("insert into secondyear values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
				pstmt.setInt(1,M3);
				pstmt.setInt(2,md);
				pstmt.setInt(3,ms1);
				pstmt.setInt(4,ms2);
				pstmt.setInt(5,mg1);
				pstmt.setInt(6,mg2);
				pstmt.setInt(7,bee);
				pstmt.setInt(8,mv);
				pstmt.setInt(9,mt);
				pstmt.setInt(10,db);
				pstmt.setInt(11,ci);
				pstmt.setInt(12,es);
				pstmt.setString(13,rollno);
				pstmt.setInt(14,totalMarks);
				pstmt.setFloat(15,percent);
				pstmt.setString(16,grade);
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
