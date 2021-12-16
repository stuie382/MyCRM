<%@taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>MyCRM System</title>

</head>
<body>
<h2>Company home page</h2>
<hr>
Welcome to the home page, <security:authentication property="principal.username"/>!

<p>
    <a href="${pageContext.request.contextPath}/customer/list">Go to Customer List</a>
</p>
</body>
</html>