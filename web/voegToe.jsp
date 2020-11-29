<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Sébastien
  Date: 27/09/2020
  Time: 12:25
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
    <title>Boek toevoegen</title>
</head>
<body>
<header>
    <nav>
        <ul>
            <li><a href="BoekInfo?command=home">Home</a></li>
            <li><a id="current" href="voegToe.jsp">Voeg toe</a></li>
            <li><a href="BoekInfo?command=overzicht">Overzicht</a></li>
            <li><a href="zoek.jsp">Zoek</a></li>
        </ul>
    </nav>
    <h1>Voeg een Boek toe</h1>
</header>

<main>
    <c:if test="${not empty errors}">
        <div class="alert alert-danger">
            <ul>
                <c:forEach items="${errors}" var="error">
                    <li>${error}</li>
                </c:forEach>
            </ul>
        </div>
    </c:if>

    <form method="post" action="BoekInfo?command=voegToe" novalidate>
        <label for="titel">Titel: *</label>
        <input type="text" name="titel" id="titel" value="${titelPreviousValue}">

        <label for="auteur">Auteur: *</label>
        <input type="text" name="auteur" id="auteur" value="${auteurPreviousValue}">

        <label for="genre">Genre: *</label>
        <!--<input type="genre" name="genre" value="$//{genrePrevious}">-->
        <select id="genre" name="genre" value="${genrePreviousValue}"> <!--toont previous genre value niet => moet dit?-->
            <option hidden disabled value>Selecteer genre</option>
            <option ${genrePreviousValue = Actie?selected:""} value="Actie">Actie</option>
            <option value="Avontuur">Avontuur</option>
            <option value="Drama">Drama</option>
            <option value="Fantasy">Fantasy</option>
            <option value="Historisch">Historisch</option>
            <option value="Horror">Horror</option>
            <option value="Informatief">Informatief</option>
            <option value="Kind">Kind</option>
            <option value="Komedie">Komedie</option>
            <option value="Misdaad">Misdaad</option>
            <option value="Mysterie">Mysterie</option>
            <option value="Oorlog">Oorlog</option>
            <option value="Sf">Sciencefiction</option>
            <option value="Thriller">Thriller</option>
        </select>

        <label for="rating">Rating: * (tussen 0 en 10)</label>
        <input type="number" id="rating" name="rating" max="10" min="0" value="${ratingPreviousValue}">

        <label for="aantalPaginas">Aantal pagina's: *</label>
        <input type="number" name="aantalPaginas" value="${aantalPaginasPreviousValue}" id="aantalPaginas">

        <input type="submit" id="submit" value="Voeg toe">
    </form>
</main>

<footer class="footerOverzicht">
    <p>Sebastien Warlop - Webontwikkeling 2 - 2020-2021</p>
</footer>
</body>
</html>
