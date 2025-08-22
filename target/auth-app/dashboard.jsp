<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  Long userId = (Long) session.getAttribute("userId");
  String userName = (String) session.getAttribute("userName");
%>
<!doctype html>
<html lang="en">
<head>
  <title>Dashboard</title>
  <meta name="viewport" content="width=device-width, initial-scale=1"/>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/style.css"/>

</head>
<body class="bg">
<header class="nav">
  <div class="brand">User<span>Authentication</span></div>
  <nav>
    <span class="hello">Hi, <%= (userName != null ? userName : "User") %>!</span>
    <a href="${pageContext.request.contextPath}/logout" class="btn btn-ghost">Logout</a>

  </nav>
</header>

<section class="card fade-in">
  <h2>Dashboard</h2>
  <p>You are logged in ✅ (User ID: <%= userId %>)</p>
  <p class="muted">This page is protected by an auth filter.</p>
</section>
<script src="${pageContext.request.contextPath}/assets/app.js"></script>

</body>
</html>
