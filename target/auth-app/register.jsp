<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!doctype html>
<html lang="en">
<head>
<title>Register - Auth App</title>
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/styles.css"/>

</head>
<body class="bg">
<header class="nav">
<div class="brand">Auth<span>App</span></div>
<nav>
  <a href="${pageContext.request.contextPath}/index.jsp" class="btn btn-ghost">Home</a>
  <a href="${pageContext.request.contextPath}/login.jsp" class="btn">Login</a>
</nav>

</header>

<section class="card slide-up">
<h2>Create account</h2>
<c:if test="${not empty error}">
<div class="alert alert-error">${error}</div>
</c:if>
<c:if test="${not empty success}">
<div class="alert">${success}</div>
</c:if>
<form action="${pageContext.request.contextPath}/register" method="post" class="form" onsubmit="return validateRegister()">

<label>Full Name
<input type="text" name="name" id="regName" placeholder="Rohit Sharma" required>
</label>
<label>Email
<input type="email" name="email" id="regEmail" placeholder="you@example.com" required>
</label>
<label>Password
<input type="password" name="password" id="regPassword" placeholder="Min 6 characters" minlength="6" required>
</label>
<label>Confirm Password
<input type="password" name="confirm" id="regConfirm" placeholder="Repeat your password" minlength="6" required>
</label>
<button class="btn btn-lg w-100" type="submit">Create Account</button>
</form>
</section>

<script src="${pageContext.request.contextPath}/assets/app.js"></script>

</body>
</html>
