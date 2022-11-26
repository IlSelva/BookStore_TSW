<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%><%@taglib prefix="c"
                                         uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="header.jsp">
    <jsp:param name="pageTitle" value="${autore.nome.charAt(0)}.${autore.cognome}"/>
</jsp:include>
<style><%@include file="/WEB-INF/css/autoreStyle.css"%></style>

<section class="container">

    <div class="autore" col="1/4">
        <img src="img/autori/${autore.id}.jpg" alt="Autore_${prodotto.id}"/>
        <h3 style="font-weight: bold">${autore.nome} ${autore.cognome}</h3>
    </div>

    <section class="griglia">
            <c:forEach items = "${prodotti}" var = "prodotto">
                <div class= "book" col = "1/3">
                    <h4>
                        <a class="titolo" href="Prodotto?id=${prodotto.id}"> ${prodotto.titolo}</a>
                    </h4>
                    <a class="pic" href="Prodotto?id=${prodotto.id}"> <img class="pic" src="img/prodotti/${prodotto.id}.jpg" alt="Libro_${prodotto.id}"> </a>
                    <h5>
                        <a href="Genere?id=${prodotto.genere}"> ${prodotto.genere} </a>
                    </h5>
                    <h4> Prezzo: ${prodotto.prezzoEuro} &euro; </h4>
                </div>
            </c:forEach>
        </div>
    </section>

        <div class="footpages" col="2/3" txt="c" style="background-color:#E8E8E8">
            <a <c:if test="${pag > 1}">href="?id=${param.id}&pag=${pag - 1}&perpag=${perpag}&ord=${ord}"</c:if>>&larr;</a>
            &emsp;
            <c:forEach begin="1" end="${npag}" varStatus="loop">
                <c:choose>
                    <c:when test="${loop.index == pag}">
                        <b>${loop.index}</b>
                    </c:when>
                    <c:otherwise>
                        <a href="?id=${param.id}&pag=${loop.index}&perpag=${perpag}&ord=${ord}">${loop.index}</a>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
            &emsp;
            <a <c:if test="${pag < npag}">href="?id=${param.id}&pag=${pag + 1}&perpag=${perpag}&ord=${ord}"</c:if>>&rarr;</a>
        </div>
</section>
<%@include file="footer.html"%>
