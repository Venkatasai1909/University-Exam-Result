<!DOCTYPE html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <meta name="Generator" content="EditPlus®">
  <meta name="Author" content="">
  <meta name="Keywords" content="">
  <meta name="Description" content="">
  <title>Second Year</title>
  <link rel = "icon" href = "Images\logo.jpg">
  <link rel ="stylesheet" href = "CSS\SecondYear.css">
 </head>
 <body style = "background-color:#66ffcc;">
 <input type = "hidden" id = "status" value = "<%= request.getAttribute("status")%>" >
 <input type = "hidden" id = "first" value = "<%= request.getAttribute("secondyear")%>" >
  <center>
  <div>
       <img src = "Images\UniversityLogo.gif">
     </div>
    <div class = "main">
	 <h2><u>Second Year Marks </u> </h2>
       <form action = "secondY" method = "POST">
	   <div>
	   <table>
	      <tr> 
	        <th>Roll No : </th>
	        <td><input type = "text" size = "20px" pattern = "(?=.*\d)(?=.*[T]).{10}" title = "Must contain only 10 Characters in RollNo , one T character and remaining digits 0 to 9" 
	        name = "rno" 	required></td>
	      </tr>
	      <tr>
		    <th>Mathematics - III</th>
			<td><input type = "number" size = "3px" max=100 min=0 id = "M3" name = "M3"	required></td>
		  </tr>
	      <tr>
		    <th>Mine Development</th>
			<td><input type = "number" size = "3px" max=100 min=0 id = "md"name = "md"	required></td>
		  </tr>
		  <tr>
		    <th>Mine Surveying - I</th>
			<td><input type = "number" size = "3px" max=100 min=0 id = "ms1" name = "ms1"	required></td>
		  </tr>
		  <tr>
		    <th>Mine Surveying - II</th>
			<td><input type = "number" size = "3px" max=100 min=0 id = "ms2" name = "ms2"	required></td> 
		  </tr>
		  <tr>
		    <th>Mining Geology - I</th>
			<td><input type = "number" size = "3px" max=100 min=0 id = "mg1" name = "mg1"	required></td>
		  </tr>
		  <tr>
		    <th>Mining Geology - II</th>
			<td><input type = "number" size = "3px" max=100 min=0 id = "mg2" name = "mg2"	required></td>
		  </tr>
		  <tr>
		    <th>Basic Electronics Engg</th>
			<td><input type = "number" size = "3px" max=100 min=0 id = "bee" name = "bee"	required></td>
		  </tr>
		  <tr>
		    <th>Mine Ventilation</th>
			<td><input type = "number" size = "3px" max=100 min=0 id = "mv" name = "mv"	required></td>
		  </tr>
		  <tr>
		    <th>Mechanical Technology</th>
			<td><input type = "number" size = "3px" max=100 min=0 id = "mt" name = "mt"	required></td>
		  </tr>
		  <tr>
		    <th>Drilling and Blasting</th>
			<td><input type = "number" size = "3px" max=100 min=0 id = "db" name = "db"	required></td>
		  </tr>
		  
		  <tr>
		    <th>Constitution of India</th>
			<td><input type = "number" size = "3px" max=100 min=0 id = "ci" name = "ci"	required></td>
		  </tr>
		  <tr>
		    <th>Environmental Sciences</th>
			<td><input type = "number" size = "3px" max=100 min=0 id = "es" name = "es"	required></td>
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
