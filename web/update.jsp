<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="domain.model.Boek" %>
<%@ page import="java.util.Collection" %>
<%--
  Created by IntelliJ IDEA.
  User: Sébastien
  Date: 24/11/2020
  Time: 11:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="style/style.css">
    <title>Update</title>
</head>
<body>
<header>
    <nav>
    <ul>
        <li><a href="BoekInfo?command=home">Home</a></li>
        <li><a href="voegToe.jsp">Voeg toe</a></li>
        <li><a href="BoekInfo?command=overzicht">Overzicht</a></li>
        <li><a href="zoek.jsp">Zoek</a></li>
    </ul>
    </nav>
    <h1>Update</h1>
</header>
<main>
    <article>
        <!--pagina nog wat anders maken (verfijnder,)-->
        <p>Hier kan u het boek ${param.titel} aanpassen</p>
        <form action="BoekInfo?command=updateBevestig" method="post" novalidate>
            <p><label for="titel">titel *</label>
            <input type="text" id="titel" name="titel" value="${param.titel}"></p>

            <p><label for="auteur">auteur *</label>
                <input type="text" id="auteur" name="auteur" value="${param.auteur}"></p>

            <p><label for="genre">genre *</label>
                <input type="text" id="genre" name="genre" value="${param.genre}"></p>

            <p><label for="rating">Rating *</label>
                <input type="number" id="rating" name="rating" value="${param.rating}"></p>

            <p><label for="aantalPaginas">aantalPaginas *</label>
                <input type="number" id="aantalPaginas" name="aantalPaginas" value="${param.aantalPaginas}"></p>

            <input type="submit" name="submit" value="UPDATE">
        </form>
    </article>
</main>
<footer class="footerOverzicht">
    <p>Sebastien Warlop - Webontwikkeling 2 - 2020-2021</p>
</footer>
</body>
</html>
