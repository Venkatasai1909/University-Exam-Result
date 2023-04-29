<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <!DOCTYPE html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <meta name="Generator" content="EditPlus®">
  <meta name="Author" content="">
  <meta name="Keywords" content="">
  <meta name="Description" content="">
  <title>Student Register</title>
  <link rel = "icon" href = "Images\logo.jpg">
  <link rel = "stylesheet" href = "CSS\StudentRegister.css">
 </head>
 <body>
 <input type = "hidden" id = "status" value = "<%= request.getAttribute("status")%>">
 <form action = "studentR" method = "POST">
   <center>
   <div>
   <div>
       <img src = "Images\UniversityLogo.gif">
     </div>
     <div class = "main">
     <img src="Images\Student.png" style = "width:80px; height:80px;">
	    <table>
		  <tr>
		    <th>Enter Name</th>
			<td><input type ="text" size = "30px"  name = "name" required></td>
		  </tr>
		  <tr>
		    <th>Enter Father Name</th>
			<td><input type ="text" size = "30px"  name = "fname" required></td>
		  </tr>
		  <tr>
		    <th>Enter Mother Name</th>
			<td><input type ="text" size = "30px" name = "mname" required></td>
		  </tr>
		  <tr>
		    <th>Enter Email Id </th>
			<td><input type = "email" size = "30px" name = "mail" ></td>
		  </tr>
		  <tr>
		    <th>Enter Roll No.</th>
			<td><input type ="text" size = "10px" pattern = "(?=.*\d)(?=.*[T]).{10}" title = "Must contain only T character in Roll Number and 0 to 9 digits" name = "rno" required></td>
		  </tr>
		  <tr>
		    <th>Enter Branch</th>
			<td><input type ="text" size = "10px" pattern = "(?.=*[A-Z]).{3,20}" title = "Enter 3 to 6 chars branch code in capital letters" name = "branch" required></td>
		  </tr>
		  <tr>
		    <th>Enter Gender</th>
			<td><input type = "text" size = "10px" name = "gender" required></td>
		  </tr>
		  <tr>
		    <th>Enter Mobile Number</th>
			<td><input type = "text" size = "10px" pattern="[0-9]{10}" title = "Enter 10 digit Mobile Number" name = "mob" required></td>
		  </tr>
		</table>
		<br><input type = "submit" value = "Submit"><br><br>
		<span>Click here go back : </span>
		<a href = "Years.html">Back</a>
	 </div>
   </center>
  </div>
 </form>
 <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
  <script type = "text/javascript">
   var status = document.getElementById("status").value;		  
   if(status == "success"){
	   swal("Congratulations !","Registration Successfull", "success");
   }
   else if(status == "failed"){
	   swal("Sorry !","Roll_No already exists", "error");
   }
  </script>
 </body>
</html>
</body>
</html>