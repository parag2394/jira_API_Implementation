<%
session.setAttribute("username", null);
session.invalidate();

response.sendRedirect("user_login");
%>