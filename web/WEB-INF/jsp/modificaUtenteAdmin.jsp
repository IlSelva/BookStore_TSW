<%--
  Created by IntelliJ IDEA.
  User: silvi
  Date: 28/07/2020
  Time: 15:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%><%@taglib prefix="c"
                                uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="header.jsp">
    <jsp:param name="pageTitle" value="Modifica Utente"/>
</jsp:include>
<section>
    <h1>Modifica Utente</h1>
    <form action="AdminUtenti" method="post">
        <input type="hidden" name="id" value="${cliente.id}">
        <label>Nome</label>
        <input type="text" name="nome" value="${cliente.nome}" required>
        <label>e-mail</label>
        <input type="text" name="email" value="${cliente.email}" required>
        <label>Passwordhash</label>
        <input type="text" name="passwordhash" value="${cliente.passwordhash}"disabled>
        <label> nuova password </label>
        <input type="text" name="password">
        <c:choose>
            <c:when test="${cliente.admin}">
                <input type="checkbox" name="admin" value=admin checked>
            </c:when>
            <c:otherwise>
                <input type="checkbox" name="admin" value=admin>
            </c:otherwise>
        </c:choose>
        <label>Admin</label> <br>

        <c:if test="${cliente != null}">
            <input type="submit" name="modifica" value="Modifica">
        </c:if>
    </form>
</section>
<%@include file="footer.html"%>