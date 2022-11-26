<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@taglib prefix="c"
    uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://kit.fontawesome.com/4367acb6a6.js" crossorigin="anonymous"></script>
<style><%@include file="/WEB-INF/css/headerstyle.css"%> <%@include file="/WEB-INF/css/footerStyle.css"%> <%@include file="/WEB-INF/css/homestyle.css"%></style>
<!DOCTYPE html>
<html>
<head>
    <title>Bookshop Store - ${param.pageTitle}</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <link rel="stylesheet" type="text/css" href="jetbrains://idea/navigate/reference?project=Progettoprova&path=WEB-INF/css/general.css">
    <script src="ricerca.js"></script>
    <script src="https://use.fontawesome.com/ca2b672bf9.js"></script>
</head>

<body>
    <header>
        <nav>
            <a class="logo" href="." >
                <img class="logo" src="img/logo/logo.jpg" alt="logo" />
                <p class="logo">BookShop</p>
            </a>
            <label for="ricerca"></label>
            <form id="ricerca" action="Ricerca" method="get">
                <select class="category" name="category">
                    <option value="" label="" selected> generi </option>
                    <c:forEach items="${generi}" var="genere">
                        <option value ="<c:out value="${genere.nome}"/>"> <c:out value="${genere.nome}"/>. </option>
                    </c:forEach>
                </select>
                <input class="searchTerm" type="text" name="q" autocomplete="off" list="ricerca-datalist" placeholder="Ricerca" onkeyup="ricerca(this.value)" value="<c:out value="${param.q}" />">
                <datalist id="ricerca-datalist"></datalist>
                <button class="searchButton" type="submit">
                    <span class="fa fa-search" aria-hidden="true"></span>
                </button>
            </form>
            <ul class="header-menu">
                <li>
                    <c:choose>
                        <c:when test="${utente == null}">
                            <a id="login" href="RegistrazioneForm">
                                <div>
                                    <span class="fa fa-user" aria-hidden="true"> </span>
                                </div>
                            </a>
                        </c:when>
                        <c:otherwise>
                            <a id="profile" href="Utente">
                                <div>
                                    <span class="fa fa-user" aria-hidden="true"> </span>
                                </div>
                            </a>
                        </c:otherwise>
                    </c:choose>
                </li>
                <li>
                    <a id="cart" href="Carrello">
                        <div>
                            <span class="fa fa-shopping-cart" aria-hidden="true"></span>
                        </div>
                    </a>
                </li>
            </ul>
        </nav>
    </header>