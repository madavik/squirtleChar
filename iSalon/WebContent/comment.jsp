<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="./style/style.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js" ></script> 
<script>

function getComments(id)
{
	
	Submit = id;
	$.get('Comment',{Submit: Submit, comment: $('#comment').val() }, populate);
}


// on load call a function that pulls all patrons names and card #'s
//build a table based on what you get back
$(document).ready(function(){
	$.get('Comment', populate); //jquery with JSON and callback to js method
});


// Populates the page with new data provided by the servlet
function populate (result) {
	$("#comment").val("");
	$('#commentsList').empty(); //jquery syntax
	var comments = "<tr><th>User Name</th><th>Comment</th></tr>";
	 
	for(var i = 0; i<result.names.length; i++)
		{
			comments += "<tr><td>" + result.names[i] +" : </td><td>" + result.comments[i] + "</td></tr>";
		}
	$('#commentsList').html(comments);
	
}

</script>
<title>Comments</title>

</head>
<body>
<!-- Start Main Container -->
<!-- TOP Section -->
<div class="topStretch">
	<div class="topWrap">
		<div class="centerContainer">
			<h2>iSalon</h2>
			<span class="tagline">~ A CharkApps Production</span>

			
			<!-- SOCIAL ICONS START -->

			<div class="buttons">
				<!--<a href="#" title="charkApps"><img src="../images/iSalonIcon.png" width="27" height="26" border="0" alt="Follow me on Twitter!" /></a>-->
				<a href="Logout">Logout</a>
			</div>

			<!-- SOCIAL ICONS END -->

		</div> <!-- END CENTERCONTAINER -->
	</div> <!-- END BARWRAP -->
</div>
<!-- END TOP Section -->
 <div id="header">  

 <div id="header-main">  <!-- Start Header Wrapper --> 
 <div class="wrapper">  


  
<div id="commentArea">

   	<textarea name="comment" rows="10" cols="50" id="comment"></textarea> 
    <input type="submit" value="Submit" name = "Submit" onclick="getComments('submit');" > 

</div>

  
     </div><!-- End Header Wrapper -->  </div> 
    
      </div><!-- End Header -->  
		<div id="headerBottom"></div>
		
<div id="comments">		
<a href="Home">HOME</a>
</div>
<div id="footer"></div>
<div id="comments">
<table  id="commentsList"> <!---References a jquery method  --->
</table>

</div>
</body>
</html>