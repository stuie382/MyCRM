<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>List Customers</title>
    <link type="text/css"
          rel="stylesheet"
          href="${pageContext.request.contextPath}/resources/css/style.css"/>
</head>
<body>

<div id="wrapper">
    <div id="header">
        <h2>CRM - Customer Relationship Manager</h2>
    </div>
</div>

<div id="container">
    <div id="content">
        <security:authorize access="hasAnyRole('MANAGER', 'ADMIN')">
            <input type="button" value="Add Customer"
                   onclick="window.location.href='showFormForAdd'; return false;"
                   class="add-button"
            />
        </security:authorize>

        <!--  add a search box -->
        <form:form action="search" method="GET">
            <label>Search customer:
                <input type="text" name="searchName"/>
            </label>

            <input type="submit" value="Search" class="add-button"/>
        </form:form>

        <table>
            <caption>Customers</caption>
            <tr>
                <th scope="col">First Name</th>
                <th scope="col">Last Name</th>
                <th scope="col">Email</th>
                <security:authorize access="hasAnyRole('MANAGER','ADMIN')">
                    <th scope="col">Action</th>
                </security:authorize>
            </tr>
            <c:forEach var="tempCustomer" items="${customers}">

                <!-- "update" link customer id -->
                <c:url var="updateLink" value="/customer/showFormForUpdate">
                    <c:param name="customerId" value="${tempCustomer.id}"/>
                </c:url>

                <!-- "delete" link customer id -->
                <c:url var="deleteLink" value="/customer/delete">
                    <c:param name="customerId" value="${tempCustomer.id}"/>
                </c:url>

                <tr>
                    <td> ${tempCustomer.firstName} </td>
                    <td> ${tempCustomer.lastName} </td>
                    <td> ${tempCustomer.email} </td>

                    <td>
                        <!-- display update|delete link -->
                        <security:authorize access="hasAnyRole('MANAGER','ADMIN')">
                            <a href="${updateLink}">Update</a>
                            <security:authorize access="hasAnyRole('ADMIN')">
                            |
                                <a href="${deleteLink}"
                                   onclick="if (!(confirm('Are you sure you want to delete this customer?'))) return false">
                                    Delete
                                </a>
                            </security:authorize>
                        </security:authorize>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>
</body>
</html>
