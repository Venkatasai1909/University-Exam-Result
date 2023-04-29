<!DOCTYPE html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <meta name="Generator" content="EditPlus®">
  <meta name="Author" content="">
  <meta name="Keywords" content="">
  <meta name="Description" content="">
  <link rel = "stylesheet" href = "CSS\FacultyLogin.css">
  <title>Faculty Login</title>
  <link rel = "icon" href = "Images\logo.jpg">
 </head>
 <body style = "background-color:#66ccff;">
  <input type = "hidden" id = "status" value = "<%= request.getAttribute("status")%>">
  <form action = "facultyL" method = "POST">
   <center>
    <div class = "container">
	   <a href = "HomePage.html"><img src="Images\Professor.jpg" style = "width:80px; height:80px;"></a>
	   <h3>Enter UserId</h3>
	   <input type = "text" size = "20px" pattern = "(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{10}" title = "Username must contain only digits from 0 to 9 and Alphabets , and 10 Characters" name = "userId" required><br>
	   <h3>Enter Password</h3>
	   <input type = "password" size = "16px" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@,#,$,^,&,*]).{8,16}" title="Must contain at least one number and uppercase and lowercase letter and symbol, and at least 8 or at most 16 characters" required name = "pword" required><br><br>
	   <input type = "submit" value = "Submit">&nbsp;&nbsp;&nbsp;<input type = "reset" value ="Reset"><br><br>
	   <span>If you are a New User: </span>
	   <a href = "FacultyRegister.jsp">Register</a>
	   <br><br><span>Click here go back : </span>
		<a href = "HomePage.html">Back</a>
	 </div>
	 
  </center>
  </form>
  <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
  <script type = "text/javascript">
    var status = document.getElementById("status").value;
    if(status=="failure"){
    	swal("Sorry !","Invalid Credentails", "error");
    }
  </script>
 </body>
</html>