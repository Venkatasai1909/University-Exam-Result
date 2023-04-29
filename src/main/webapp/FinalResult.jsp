<!DOCTYPE html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <meta name="Generator" content="EditPlus®">
  <meta name="Author" content="">
  <meta name="Keywords" content="">
  <meta name="Description" content="">
  <title>Final Result</title>
  <link rel = "icon" href = "Images\logo.jpg">
  <link rel ="stylesheet" href = "CSS\FinalResult.css">
 </head>
 <body style = "background-color:#66ffcc;">
 <input type = "hidden" id = "first" value = "<%= request.getAttribute("finalresult")%>" >
 <input type = "hidden" id = "status" value = "<%= request.getAttribute("status")%>" >
  <center>
  <div>
       <img src = "Images\UniversityLogo.gif">
     </div>
    <div class = "main">
	 <h2><u>Final Result </u> </h2>
       <form action = "finalR" method = "POST">
	   <div>
	   <table>
	      <tr> 
	        <th>Roll No : </th>
	        <td><input type = "text" size = "20px" name = "rno" required></td>
	      </tr>
	      <tr>
		    <th>Enter First Year Percentage</th>
			<td><input type = "number" size = "3px" id = "fy" name = "fy" required></td>
		  </tr> 
	      <tr>
		    <th>Enter Second Year Percentage</th>
			<td><input type = "number" size = "3px" id = "sy" name = "sy" required></td>
		  </tr>
		  <tr>
		    <th>Enter Third Year Percentage</th>
			<td><input type = "number" size = "3px" id = "ty" name = "ty" required></td>
		  </tr>
		  <tr>
		    <th>Enter Fourth Year Percentage</th>
			<td><input type = "number" size = "3px" id = "fty" name = "fty" required></td> 
		  </tr>
	   </table>
	     <br><input type = "submit" value = "Submit">
	   </div>
	   </form>
	   <br><span>Click here go back : </span>
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