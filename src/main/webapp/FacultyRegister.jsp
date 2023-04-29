<!DOCTYPE html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <meta name="Generator" content="EditPlus®">
  <meta name="Author" content="">
  <meta name="Keywords" content="">
  <meta name="Description" content="">
  <style>
    .regdetails
   {
   height:300px;
   width:300px;
   background:white;
   box-shadow:2px 2px 4px;
   border-radius:3px;
   margin-top:50px;
   padding-top:20px;
   }
  </style>
  <title>Faculty Register</title>
  <link rel = "icon" href = "Images\logo.jpg">
 </head>
 <body style = "background-color:#66ccff;">
 <input type = "hidden" id = "status" value = "<%= request.getAttribute("status")%>">
 <form action = "facultyR" method = "POST">
  <center>
    <div class = "regdetails">
	   <img src="Images\Professor.jpg" style = "width:80px; height:80px;"><br>
	   <table>
			 <tr>
			   <th>User Id:</th>
			   <td><input type = text  size = "15px" required pattern = "(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{10}" title = "Username must contain only digits from 0 to 9 and Alphabets , and 10 Characters"  name = "userId" required></td>
			 </tr>
			 <tr>
			   <th>Password : </th>
			   <td><input type = "password"  size = "15px" id = "passwrd"  required pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@,#,$,^,&,*]).{8,16}" title="Must contain at least one number and one uppercase and lowercase letter and one symbol, and at least 8 or at most 16 characters" name = "pass" required></td>
			 </tr>
			 <tr>
			  <th>Confirm Password :</th>
			  <td><input type = "password"  size = "15px" id = "confirm_passwrd" onchange = "validateForm()" required onchange = "validateForm()"  name = "conpass" required></td>
			 </tr>
	  </table><br>
	  <input type = submit value =Submit> <br><br>
	  <span>I'm Already a member  </span>
	  <a href = "FacultyLogin.jsp"> Login</a>
	</div>
  </center>
 </form>
 <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
  <script type = "text/javascript">
  var status = document.getElementById("status").value;
  if(status == "success"){
	  swal("Congratulations !","Registration Successfull", "success");
  }
  else if(status == "failed"){
	  swal("Sorry !","UserId already exists","error");
	  }
  function validateForm()
  {
  	var password = document.getElementById("passwrd").value;
  	var confirm_password = document.getElementById("confirm_passwrd").value;
  	if(password != confirm_password)
  	{
  		swal("Sorry !","Password Mismatch", "error");
  	}
  }
  </script>
 </body>
</html>
