  <!DOCTYPE html>
  <html lang="en">
  <head>
    <title>Forget Password</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/templates/jquery/jquery-1.12.3.min.js" ></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/templates/jquery/jquery.validate.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/templates/css/css.css">
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"  %>
    
  </head>
  <body>
  <center>
  <div class="container" style="border: 1px solid; width:450px;border-radius: 8px;background-color: #92C8FD;padding: 20px">
    <h2>Here, You can get a new password</h2>
    <c:if test="${param['msg'] eq 'wrong'}"> 
   <div style="width:400px;height:50px" class="alert alert-danger" role="alert">Email is not exists in this system</div>
</c:if>
    <form id="submitform" action="${pageContext.request.contextPath}/forgetpass" name="submitform" method="post">
      <div class="form-group">
        <label>Your email:</label>
        <input type="text" class="form-control" placeholder="Your email" name="email" id="email" 
         onkeyup="validate1()">
      </div>
      <h3 style="font-weight: bold" id="result"></h3>
      <button name="submit" type="submit" class="btn btn-login" id="validate">Send</button>
    </form>
  </div>
  </center>
  </body>
  <script type="text/javascript">
  function validateEmail(email) {
	  var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
	  return re.test(email);
	}

  function validate1() {
	  $("#result").text("");
	  var email = $("#email").val();
	  if (validateEmail(email)) {
	    $("#result").text(email + " is valid");
	    $("#result").css("color", "green");
	  } else {
		  if(email.length!=0){
			  $("#result").text(email + " is not valid");
			    $("#result").css("color", "red");
		  }
	  }
	  return false;
	}
	function validate() {
	  $("#result").text("");
	  var email = $("#email").val();
	  if (validateEmail(email)) {
	    $("#result").text(email + " is valid");
	    $("#result").css("color", "green");
	    return true;
	  } else {
		  if(email.length!=0){
			  $("#result").text(email + " is not valid. Try again");
			    $("#result").css("color", "red");
			    return false;
		  }
	  }
	}

	$("#validate").bind("click", validate);
  
  </script>
  <script type="text/javascript">
              $(document).ready(function(){
            $("#submitform").validate({
              rules:{
                email:{
                  required: true,
                },
              },
              messages:{
                email:{
                  required: "<span style='color:red'>Email is required</span>",
                },
              },
            });
          });

</script>
  </html>
         

