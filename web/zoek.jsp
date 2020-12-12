<%--
  Created by IntelliJ IDEA.
  User: Sébastien
  Date: 24/10/2020
  Time: 15:00
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
    <title>Zoek een boek</title>
</head>
<body>
<header>
    <nav>
        <ul>
            <li><a href="BoekInfo?command=home">Home</a></li>
            <li><a href="voegToe.jsp">Voeg toe</a></li>
            <li><a href="BoekInfo?command=overzicht">Overzicht</a></li>
            <li><a id="current" href="BoekInfo?command=zoek">Zoek</a></li>
        </ul>
    </nav>
    <h1>Zoek film</h1>
</header>
                                    <!--nog foutmelding als je niets "" intypt en zoekt-->
<main>
    <form method="get" action="BoekInfo" novalidate>
        <p>Welk boek zoek je?</p>
        <label for="titel">Titel:</label>
        <input type="text" id="titel" name="titel" value=""> <!--required-->

        <input type="hidden" name="command" value="zoek">

        <label for="zoek"></label>
        <input type="submit" id="zoek" value="Zoek Boek">
    </form>
</main>

<p>
    Druk hier om het logboek van de zoekresultaten te zien: <a href="BoekInfo?command=logboek"></a>
</p>

<footer class="footerOverzicht">
    <p>Sebastien Warlop - Webontwikkeling 2 - 2020-2021</p>
</footer>

</body>
</html>
