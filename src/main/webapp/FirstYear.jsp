<!DOCTYPE html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <meta name="Generator" content="EditPlus®">
  <meta name="Author" content="">
  <meta name="Keywords" content="">
  <meta name="Description" content="">
  <title>First Year</title>
  <link rel = "icon" href = "Images\logo.jpg">
  <link rel ="stylesheet" href = "CSS\FirstYear.css">
 </head>
 <body style = "background-color:#66ffcc;">
 <input type = "hidden" id = "status" value = "<%= request.getAttribute("status")%>" >
 <input type = "hidden" id = "first" value = "<%= request.getAttribute("firstyear")%>" >
  <center>
  <div>
       <img src = "Images\UniversityLogo.gif">
     </div>
    <div class = "main">
	 <h2><u>First Year Marks </u> </h2>
       <form action = "firstY" method = "POST">
	   <div>
	   <table>
	      <tr> 
	        <th>Roll No : </th>
	        <td><input type = "text" size = "20px" pattern = "(?=.*\d)(?=.*[T]).{10}" 
	        title = "Must contain only 10 Characters in RollNo , one T character and remaining digits 0 to 9" 
	        name = "rno"  required></td>
	      </tr>
	      <tr>
		    <th>English</th>
			<td><input type = "number" size = "3px" max=100 min=0 id = "en" name = "en" required></td>
		  </tr>
	      <tr>
		    <th>Mathematics-I</th>
			<td><input type = "number" size = "3px" max=100 min=0 id = "m1"name = "m1" required></td>
		  </tr>
		  <tr>
		    <th>Mathematics-II</th>
			<td><input type = "number" size = "3px" max=100 min=0 id = "m2" name = "m2" required></td>
		  </tr>
		  <tr>
		    <th>Physics</th>
			<td><input type = "number" size = "3px" max=100 min=0 id = "phy" name = "phy" required></td>
		  </tr>
		  <tr>
		    <th>Chemistry</th>
			<td><input type = "number" size = "3px" max=100 min=0 id = "chem" name = "chem" required></td>
		  </tr>
		  <tr>
		    <th>Engineering Drawing</th>
			<td><input type = "number" size = "3px" max=100 min=0 id = "ed" name = "ed" required></td>
		  </tr>
		  <tr>
		    <th>C Programming</th>
			<td><input type = "number" size = "3px" max=100 min=0 id = "Cp" name = "Cp" required></td>
		  </tr>
		  <tr>
		    <th>Basic Electrical Engg</th>
			<td><input type = "number" size = "3px" max=100 min=0 id = "bee" name = "bee" required></td>
		  </tr>
		  <tr>
		    <th>Basic Mechanics</th>
			<td><input type = "number" size = "3px" max=100 min=0 id = "bme" name = "bme" required></td>
		  </tr>
	   </table>
	     <br><input type = "submit" value = "Submit">
	   </div>
	   </form>
	   <br><span>Back to Home Page </span>
	   <button><a href = "Years.html">Back</a></button>
	</div>
  </center>
  <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
  <script type = "text/javascript">
	   var first = document.getElementById("first").value;
	   var status = document.getElementById("status").value;
	   if(first == "failed"){
		   swal("Sorry !","RollNo already exists","error");
	   }
	   else if(status == "success"){
		   swal("Success ","Records Entered Successfully","success");
	   }
	</script>
 </body>
</html>
