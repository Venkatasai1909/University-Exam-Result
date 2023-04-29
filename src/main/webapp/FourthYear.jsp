<!DOCTYPE html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <meta name="Generator" content="EditPlus®">
  <meta name="Author" content="">
  <meta name="Keywords" content="">
  <meta name="Description" content="">
  <title>Fourth Year</title>
  <link rel = "icon" href = "Images\logo.jpg">
  <link rel ="stylesheet" href = "CSS\FourthYear.css">
 </head>
 <body style = "background-color:#66ffcc;">
 <input type = "hidden" id = "status" value = "<%= request.getAttribute("status")%>" >
 <input type = "hidden" id = "first" value = "<%= request.getAttribute("fourthyear")%>" >
  <center>
  <div>
       <img src = "Images\UniversityLogo.gif">
     </div>
    <div class = "main">
	 <h2><u>Fourth Year Marks </u> </h2>
       <form action = "fourthY" method = "POST">
	   <div>
	   <table>
	      <tr> 
	        <th>Roll No : </th>
	        <td><input type = "text" size = "20px" pattern = "(?=.*\d)(?=.*[T]).{10}" 
	        title = "Must contain only 10 Characters in RollNo , one T character and remaining digits 0 to 9" 
	        name = "rno" required></td>
	      </tr>
	      <tr>
		    <th>Mine Planning</th>
			<td><input type = "number" size = "3px" max=100 min=0  name = "mp" required></td>
		  </tr> 
	      <tr>
		    <th>Numerical Modeling in Mining</th>
			<td><input type = "number" size = "3px" max=100 min=0  name = "nmm" required></td>
		  </tr>
		  <tr>
		    <th>Mineral Processing</th>
			<td><input type = "number" size = "3px" max=100 min=0  name = "mps" required></td>
		  </tr>
		  <tr>
		    <th>Human Resources Management</th>
			<td><input type = "number" size = "3px" max=100 min=0  name = "hrm" required></td> 
		  </tr>
		  <tr>
		    <th>Mine Legislation & Safety</th>
			<td><input type = "number" size = "3px" max=100 min=0  name = "mls" required></td>
		  </tr>
		  <tr>
		    <th>Rock Fragmentation Engg.</th>
			<td><input type = "number" size = "3px" max=100 min=0  name = "rfe" required></td>
		  </tr>
		  <tr>
		    <th>Human Values and Professional Ethics</th>
			<td><input type = "number" size = "3px" max=100 min=0  name = "hmpe" required></td>
		  </tr>
		  <tr>
		    <th>Mine Economics</th>
			<td><input type = "number" size = "3px" max=100 min=0  name = "me" required></td>
		  </tr>
		  <tr>
		    <th>Project Stage - I</th>
			<td><input type = "number" size = "3px" max=100 min=0  name = "ps1" required></td>
		  </tr>
		  <tr>
		    <th>Project Stage - II</th>
			<td><input type = "number" size = "3px" max=100 min=0   name = "ps2" required></td>
		  </tr>
	   </table>
	     <br><input type = "submit" value = "Submit" >
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