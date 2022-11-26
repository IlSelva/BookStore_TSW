<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%><%@taglib prefix="c"
                                         uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="header.jsp">
    <jsp:param name="pageTitle" value="${param.q}"/>
</jsp:include>

<style><%@include file="/WEB-INF/css/homestyle.css"%></style>

<div class="container">
    <section class="griglia">
            <c:forEach items="${prodotti}" var="prodotto">
                <article class="book" col="1/3">
                    <h4>
                        <a class="titolo" href="Prodotto?id=${prodotto.id}"> ${prodotto.titolo}</a>
                    </h4>
                    <a class="pic" href="Prodotto?id=${prodotto.id}"> <img class="pic" src="img/prodotti/${prodotto.id}.jpg" alt="Libro_${prodotto.id}"> </a>
                    <h5>
                        <a href="Autore?id=${prodotto.autore.id}"> ${prodotto.autore.nome} ${prodotto.autore.cognome}</a>
                        <br>
                        <a href="Genere?id=${prodotto.genere}">${prodotto.genere}</a>
                    </h5>
                    <h4> Prezzo: ${prodotto.prezzoEuro} &euro; </h4>
                </article>
            </c:forEach>
    </section>
</div>
<c:if test="${empty prodotti}">
    <h2 class="section-title">Nessun prodotto trovato.</h2>
</c:if>

<%@include file="footer.html"%>
