<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
  <title>User Login & Registration</title>
  <meta name="viewport" content="width=device-width, initial-scale=1"/>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/style.css"/>
</head>

<body class="bg">
<header class="nav">
  <div class="brand">User<span>Authentication</span></div>
  <nav>
  <a href="${pageContext.request.contextPath}/login.jsp" class="btn btn-ghost">Login</a>
  <a href="${pageContext.request.contextPath}/register.jsp" class="btn">Register</a>
</nav>

</header>

<section class="hero fade-in">
  <h1>Welcome 👋</h1>
  <p>A clean, responsive & animated JSP/Servlet auth starter.</p>
  <div class="cta">
    <a href="register.jsp" class="btn btn-lg">Get Started</a>
    <a href="login.jsp" class="btn btn-ghost btn-lg">I already have an account</a>
  </div>
</section>

<script src="${pageContext.request.contextPath}/assets/app.js"></script>
</body>
</html>
