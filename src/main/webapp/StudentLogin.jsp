<!DOCTYPE html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <meta name="Generator" content="EditPlus®">
  <meta name="Author" content="">
  <meta name="Keywords" content="">
  <meta name="Description" content="">
  <link rel = "stylesheet" href = "CSS\StudentLogin.css">
  <title>Student Login</title>
  <link rel = "icon" href = "Images\logo.jpg">
 </head>
 <body style = "background-color:#66ccff;">
 <input type = "hidden" id = "status" value = "<%= request.getAttribute("status")%>">
 <form action = "studentL" method="POST" >
  <center>
    <div class = "container">
	   <a href = "HomePage.html"><img src="Images\Student.png" style = "width:80px; height:80px;"></a>
	   <h3>Enter Roll Number</h3>
	   <input type = "text"  size = "20px" pattern = "(?=.*\d)(?=.*[T]).{10}" title = "Must contain only 10 Characters in RollNo , one T character and remaining digits 0 to 9"  name = "hno" required><br>
	   <h3>Enter Password</h3>
	   <input type = "password"  size = "20px" pattern = "(?=.*\d).{10}" title = "Enter your 10 digit mobile number" name = "pass" required><br><br>
	   <input type = "submit" value = "Submit">&nbsp;&nbsp;&nbsp;<input type = "reset" value ="Reset"><br><br>
	  <br><br><span>Click here go back : </span>
		<a href = "HomePage.html">Back</a>
	 </div>
	 
  </center>
 </form>
 <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
 <script>
   var status = document.getElementById("status").value;
   if(status == "failed"){
	   swal("Sorry !","Invalid Username or Password", "error");
	}
 </script>
 </body>
</html>