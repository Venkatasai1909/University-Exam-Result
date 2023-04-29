<!DOCTYPE html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <meta name="Generator" content="EditPlus®">
  <meta name="Author" content="">
  <meta name="Keywords" content="">
  <meta name="Description" content="">
  <title>Third Year</title>
  <link rel = "icon" href = "Images\logo.jpg">
  <link rel ="stylesheet" href = "CSS\ThirdYear.css">
 </head>
 <body style = "background-color:#66ffcc;">
 <input type = "hidden" id = "status" value = "<%= request.getAttribute("status")%>" >
 <input type = "hidden" id = "first" value = "<%= request.getAttribute("thirdyear")%>" >
  <center>
  <div>
       <img src = "Images\UniversityLogo.gif">
     </div>
    <div class = "main">
	 <h2><u>Third Year Marks </u> </h2>
       <form action = "thirdY" method = "POST">
	   <div>
	   <table>
	      <tr> 
	        <th>Roll No : </th>
	        <td><input type = "text" size = "20px" pattern = "(?=.*\d)(?=.*[T]).{10}" 
	        title = "Must contain only 10 Characters in RollNo , one T character and remaining digits 0 to 9" 
	        name = "rno"	required></td>
	      </tr>
	      <tr>
		    <th>Rock Mechanics</th>
			<td><input type = "number" size = "3px" max=100 min=0  id = "rm" name = "rm"	required></td>
		  </tr> 
	      <tr>
		    <th>UG Mining Methods(Coal)</th>
			<td><input type = "number" size = "3px" max=100 min=0 id = "uc"name = "uc"	required></td>
		  </tr>
		  <tr>
		    <th>UG Mining Methods(Metal)</th>
			<td><input type = "number" size = "3px" max=100 min=0 id = "um" name = "um"	required></td>
		  </tr>
		  <tr>
		    <th>Mine Hazards and Rescue</th>
			<td><input type = "number" size = "3px" max=100 min=0 id = "mhr" name = "mhr"	required></td> 
		  </tr>
		  <tr>
		    <th>Mining Machinary</th>
			<td><input type = "number" size = "3px" max=100 min=0 id = "mm" name = "mm"	required></td>
		  </tr>
		  <tr>
		    <th>Mining Instrumentation and Automation</th>
			<td><input type = "number" size = "3px" max=100 min=0 id = "mia" name = "mia"	required></td>
		  </tr>
		  <tr>
		    <th>Mine Ground Control</th>
			<td><input type = "number" size = "3px" max=100 min=0 id = "mgc" name = "mgc"	required></td>
		  </tr>
		  <tr>
		    <th>Surface Mining Method</th>
			<td><input type = "number" size = "3px" max=100 min=0 id = "smm" name = "smm"	required></td>
		  </tr>
		  <tr>
		    <th>Mine Mechanization</th>
			<td><input type = "number" size = "3px" max=100 min=0 id = "mmz" name = "mmz"	required></td>
		  </tr>
		  <tr>
		    <th>Fundamentals of AI</th>
			<td><input type = "number" size = "3px" max=100 min=0 id = "fai" name = "fai"	required></td>
		  </tr>
		  
		  <tr>
		    <th>Mine Surface Environment Management</th>
			<td><input type = "number" size = "3px" max=100 min=0 id = "mse" name = "mse"	required></td>
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