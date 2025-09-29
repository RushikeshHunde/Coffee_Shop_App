<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href = css/Admin.css  rel="stylesheet">
</head>
<body>
<div class="login-container">
  <h1>Admin Login</h1>
  <p class="error-message">
    <%
      // Check for the error message from the servlet
      String errorMessage = (String) request.getAttribute("errorMessage");
      if (errorMessage != null) {
        out.println(errorMessage);
      }
    %>
  </p>
  <form class="login-form" action="AdminLoginServlet" method="post">
    <div class="form-group">
      <label for="username">Username:</label>
      <input type="text" id="username" name="username" required>
    </div>
    <div class="form-group">
      <label for="password">Password:</label>
      <input type="password" id="password" name="password" required>
    </div>
    <button type="submit" class="login-btn">Sign In</button>
  </form>
  </div>
</body>
</html>