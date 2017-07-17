  <!DOCTYPE html>
  <html lang="en">
  <head>
    <title>Login</title>
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
  <body >
  <center>
  <div class="container" style="border: 1px solid; width:450px;border-radius: 8px;background-color: #92C8FD;">
    <h2>Welcome to DevicesManagement System</h2>
    <h1>Login</h1>
    <c:if test="${param['error'] eq 'loginErr'}"> 
   <div style="width:400px;height:50px" class="alert alert-danger" role="alert">Wrong username or password</div>
</c:if>
<c:if test="${param['new_pass'] eq 'success'}"> 
   <div style="width:400px;height:70px" class="alert alert-info" role="alert">A new password be sent for you. Please check your email and try again.</div>
</c:if>
    <form id="loginform" action="${pageContext.request.contextPath}/login" name="loginform" method="post">
      <div class="form-group">
        <label>Username:</label>
        <input type="text" class="form-control" placeholder="Your Username" name="username" 
        onKeyUp="return check(this)">
      </div>
      <div class="form-group">
        <label>Password:</label>
        <input type="password" class="form-control" placeholder="Your password" name="password">
      </div>
      <div class="form-group">
        <label>Remember me:</label>
        <input type="checkbox" style="width:20px;height:20px" name="remember-me">
      </div>
      
      <button name="submit" type="submit" class="btn btn-login">Login</button></br>
      <div style="margin:30px"><a href="${pageContext.request.contextPath}/forgetpass" style="text-decoration: underline;"> Forget password </a></div>
      <div style="margin-bottom:30px;color:black">&copy;  Copyright ENCLAVE</div>
    </form>
  </div>
  </center>
  </body>
  <script type="text/javascript">
              $(document).ready(function(){
            $("#loginform").validate({
              rules:{
                username:{
                  required: true,
                  maxlength: 30,
                },
                password:{
                  required: true,
                  maxlength: 50,
                },
              },
              messages:{
                username:{
                  required: "<span style='color:red'>Username is required</span>",
                  maxlength: "<span style='color:red'>Username maxlength: 30!</span>",
                },
                password:{
                  required: "<span style='color:red'>Password is required</span>",
                  maxlength: "<span style='color:red'>Password maxlength: 50!</span>",
                },
              },
            });
          });
        
var mikExp = /[$\\@\!\\\#%\^\&\*\(\)\[\]\+\_\{\}\`\~\=\|]/;
function check(val) {
var strPass = val.value;
var strLength = strPass.length;
var lchar = val.value.charAt((strLength) - 1);
if(lchar.search(mikExp) != -1) {
var tst = val.value.substring(0, (strLength) - 1);
val.value = tst;
   }
}

</script>
  </html>
         

