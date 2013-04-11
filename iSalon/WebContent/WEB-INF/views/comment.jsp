<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="./style/style.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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
<form id="myForm" action="comment" method="post"> 
   	<textarea name="comment" rows="10" cols="50"></textarea> 
    <input type="submit" value="submit" /> 
</form>
</div>




  
     
     </div><!-- End Header Wrapper -->  </div> 
    
      </div><!-- End Header -->  
		<div id="headerBottom"></div>
		
<div id="comments">		
<a href="index.html">HOME</a>
</div>
<div id="footer"></div>
<div id="comments">

<table>
<c:forEach items="${feedback}"  var="t" >
        <tr>
        	<td>${t.name}</td>
          <td>${t.comment}</td> 
       </tr>
      </c:forEach>
</table>
</div>
</body>
</html>