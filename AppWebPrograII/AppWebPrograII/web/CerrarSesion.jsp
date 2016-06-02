<%@page import="javax.servlet.http.HttpSession" %>
<%
    HttpSession hs = request.getSession(false);
    if(hs!=null)
        hs.invalidate();
    
    response.sendRedirect("index.jsp");
%>