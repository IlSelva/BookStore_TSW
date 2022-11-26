<%--
  Created by IntelliJ IDEA.
  User: silvi
  Date: 28/07/2020
  Time: 17:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%><%@taglib prefix="c"
                                uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="header.jsp">
    <jsp:param name="pageTitle" value="Modifica Utente"/>
</jsp:include>
<section>
    <h1>Modifica Dati Utente</h1>
    <form action="ModificaUtente" method="post">
        <input type="hidden" name="id" value="${utente.id}">
        <label>Nome</label>
        <input type="text" name="nome" value="${utente.nome}" required>
        <label>e-mail</label>
        <input type="text" name="email" value="${utente.email}" required>
        <c:if test="${utente != null}">
            <input type="submit" name="modifica" value="Modifica">
        </c:if>
    </form>
</section>
<%@include file="footer.html"%>