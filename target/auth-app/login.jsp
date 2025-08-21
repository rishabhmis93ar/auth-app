<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!doctype html>
<html lang="en">
<head>
  <title>Login - Auth App</title>
  <meta name="viewport" content="width=device-width, initial-scale=1"/>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/styles.css"/>

</head>
<body class="bg">
<header class="nav">
  <div class="brand">Auth<span>App</span></div>
  <nav>
  <a href="${pageContext.request.contextPath}/index.jsp" class="btn btn-ghost">Home</a>
  <a href="${pageContext.request.contextPath}/register.jsp" class="btn">Register</a>
</nav>

</header>

<section class="card slide-up">
  <h2>Login</h2>
  <c:if test="${not empty param.redirect}">
    <div class="alert">Please login to continue.</div>
  </c:if>
  <c:if test="${not empty error}">
    <div class="alert alert-error">${error}</div>
  </c:if>
  <form action="${pageContext.request.contextPath}/login" method="post" class="form" onsubmit="return validateLogin()">

    <label>Email
      <input type="email" name="email" id="loginEmail" placeholder="you@example.com" required>
    </label>
    <label>Password
      <input type="password" name="password" id="loginPassword" placeholder="••••••••" required minlength="6">
    </label>
    <button class="btn btn-lg w-100" type="submit">Sign In</button>
  </form>
</section>

<script src="${pageContext.request.contextPath}/assets/app.js"></script>

</body>
</html>
