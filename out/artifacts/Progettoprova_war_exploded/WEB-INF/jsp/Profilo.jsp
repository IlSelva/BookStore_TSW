<%--
  Created by IntelliJ IDEA.
  User: silvi
  Date: 29/06/2020
  Time: 18:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%><%@taglib prefix="c"
                                         uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="header.jsp">
    <jsp:param name="pageTitle" value="${utente.nome}"/>
</jsp:include>
<style><%@include file="/WEB-INF/css/profiloStyle.css"%></style>
<h5 id="notifica">${notifica}</h5>
<section>
    <h4> Nome: <c:out value="${utente.nome}" /> </h4>
    <h4> E-mail: <c:out value="${utente.email}" /> </h4>

    <h5> id: <c:out value="${utente.id}" /> </h5>

    <a href="Logout">
        <button> Logout </button>
    </a>

    <a href="ModificaUtente">
        <button> Modifica informazioni</button>
    </a>

    <a href="ModificaPassword">
        <button> Modifica password </button>
    </a>
    <br>
    <c:if test="${utente.admin == true}">
        <a href="AdminUtenti">
            <button>Modifica utenti</button>
        </a>
        <a href="UploadProdotto">
            <button>Inserimento prodotto</button>
        </a>
    </c:if>
</section>