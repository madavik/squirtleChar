<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Register</title>
<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js" ></script>    
<script>
function register()
{
	var name = $('#username').val();
	
	var pw = $('#password').val();
	
	if (name == "" && pw == "")
		{
			$("#errorL").html("Enter your login name");
			$("#errorP").html("Enter your password");
			return;
		}
	//first check that both boxes have values
	if (name == "")
		{
		
			$("#errorL").html("Enter your login name");
			return;
		}
	if( pw == "")
		{
			$("#errorP").html("Enter your password");
			return;
			
		}
	else 
		{
			
			if (pw.length < 9)
				{
					$("#errorP").text("Password must be at least 8 characters!");
				}
			else
				{
				//everything should be ok by this point so we can call the server function
				$.get('Register', {username: name, password : pw }).done(
						function( result )
						{
							
							//.checkout is a class on a checkout button. if not successfull login then
							//user can't enter comments
							$(".comment").prop('disabled', !result.success);
							if( !result.success )
							{
								loginID = -1;
								$("#error").html("Error with Registering, Try again");
								$("#name").html("");
								$("#password").val("");
								return;
							}
							Uid = result.uid;
							var url = '<%=request.getContextPath()%>/Home';
							window.location.replace(url);
							
						});
				}
			
		
		}
	
	
	
	
	
}

</script>
</head>

<body>
<h3>Please Register</h3>

<p><span style="color:#ff0000" id="error"></span></p>

<%-- The action j_security_check and the names j_username and j_password must
     be present for container-based security to work. --%>
     



User name: <span id="name"></span><input type="text" name="username" id="username"><span style="color:#ff0000" id="errorL"></span><br/>
 Password: <input type="password" name="password" id="password"><span style="color:#ff0000" id="errorP"></span><br/>
<input type="submit" value="Log In" name = "login" onclick="register()">



</body>
</html>