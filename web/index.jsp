<%@ page import="app.Constants" %>
<%@ page contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Response</title>
</head>
<body>

<div style="text-align: center">
    <form action="index.jsp">
        <label for="scope">Select scope: </label>

        <select name="scope" id="scope">
            <option value="request">REQUEST</option>
            <option value="session">SESSION</option>
            <option value="application">APPLICATION</option>
        </select>
        <br><br>

        <label for="key">Key:</label>
        <input type="text" name="key" id="key">
        <br><br>

        <label for="value">Value:</label>
        <input type="text" name="value" id="value">
        <br><br>

        <input type="submit" value="Submit">
    </form>

    <jsp:useBean id="requestScope" scope="request" class="beans.Scopes"/>
    <jsp:useBean id="sessionScope" scope="session" class="beans.Scopes"/>
    <jsp:useBean id="applicationScope" scope="application" class="beans.Scopes"/>

    <%
        if (request.getParameter("scope") != null) {
            String scope = request.getParameter("scope");

            switch (scope) {
                case Constants.REQUEST_SCOPE:
                    requestScope.put(request.getParameter("key"), request.getParameter("value"));
                    break;
                case Constants.SESSION_SCOPE:
                    sessionScope.put(request.getParameter("key"), request.getParameter("value"));
                    break;
                case Constants.APPLICATION_SCOPE:
                    applicationScope.put(request.getParameter("key"), request.getParameter("value"));
                    break;
            }
        }
    %>

    <% if (!requestScope.isEmpty()) { %>
    <h3>Request scope:</h3>

    <div style="color: red; border: 1px solid black; margin: 2rem 7rem;">
        <% for (String key : requestScope.getKeys()) { %>
        <p>
            <%= key %> - <%= requestScope.get(key) %>
        </p>
        <% } %>
    </div>
    <% } %>

    <% if (!sessionScope.isEmpty()) { %>
    <h3>Session scope:</h3>

    <%
        String JSESSIONID = "None";

        for (Cookie cookie : request.getCookies()) {
            if (cookie.getName().equals("JSESSIONID")) {
                JSESSIONID = cookie.getValue();
            }
        }
    %>

    <p>
        JSESSIONID:
        <strong>
            <%= JSESSIONID %>
        </strong>
    </p>

    <div style="color: green; border: 1px solid black; margin: 2rem 7rem;">
        <% for (String key : sessionScope.getKeys()) { %>
        <p>
            <%= key %> - <%= sessionScope.get(key) %>
        </p>
        <% } %>
    </div>
    <% } %>

    <% if (!applicationScope.isEmpty()) { %>
    <h3>Application scope:</h3>

    <div style="color: blue; border: 1px solid black; margin: 2rem 7rem;">
        <% for (String key : applicationScope.getKeys()) { %>
        <p>
            <%= key %> - <%= applicationScope.get(key) %>
        </p>
        <% } %>
    </div>
    <% } %>
</div>

</body>
</html>
