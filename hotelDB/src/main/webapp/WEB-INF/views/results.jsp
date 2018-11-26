<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<meta charset="UTF-8">
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<link rel="stylesheet" href="/hotels.css">
<style>
body,h1,h2,h3,h4,h5,h6 {font-family: "Raleway", Arial, Helvetica, sans-serif}
</style>
<title>index</title>
<body class="w3-light-grey">
</head>
<header class="w3-display-container w3-content" style="max-width:1500px;">
  <img class="w3-image" src="/images/nightSM.jpg" alt="Barcelona at night" style="min-width:1000px" width="1500" height="800">
  <div class="w3-display-left w3-padding w3-col l6 m8">
    <div class="w3-container w3-dark-grey">
      <h2><i class="fa fa-bed w3-margin-right"></i>Hotels<c:if test="${ not empty city }"> in ${ city }</c:if></h2><h6><i>(under $${ max })</i></h6>
    </div>
    <div class="w3-container w3-white w3-padding-16">
      <form action="/">
        <div class="w3-row-padding" style="margin:8px -16px;">
          <div class="w3-full w3-margin-bottom">
            <table class="table table-striped table-dark">
					<c:if test="${ not empty list }">
					<thead class="thead-dark">
						<tr>
							<th scope="col">Name</th>
							<th scope="col">Price</th>
							<th scope="col">Guest Rating</th>
						</tr>
					</thead>
					<c:forEach var="hotel" items="${ list }">
						<tr>
							<td>${ hotel.name }</td>
							<td>$ ${ hotel.price }</td>
							<td><fmt:formatNumber type="number" maxFractionDigits="1" value="${ hotel.rating }"/></td>
						</tr>
					</c:forEach>
					</c:if>
					<c:if test="${ empty list }">
						<h4>Your search parameters didn't turn up any results!</h4>
					</c:if>
				</table>
          </div>
        </div>
        <button class="w3-button w3-dark-grey" type="submit"><i class="fa fa-search w3-margin-right"></i> Back</button>
      </form>
    </div>
  </div>
  <div class="w3-display-right w3-padding w3-col l6 m8">
    <div class="w3-container w3-dark-grey">
      <h2><i class="fa fa-bed w3-margin-right"></i>Leave a review</h2>
    </div>
    <div class="w3-container w3-white w3-padding-16">
      <form action="/" method="post">
        <div class="w3-row-padding" style="margin:8px -16px;">
          <div class="w3-full w3-margin-bottom">
          	 <label><strong>Select Hotel</strong></label>
            <select name="hotel">
            	<option value="--" selected disabled hidden>--</option>
            	<c:forEach var="hotel" items="${ list }">
							<option value="${ hotel.id }">${ hotel.name }</option>
				</c:forEach>
            </select>
          </div>
          	<div class="w3-half w3-margin-top">
           	 <label><strong>Rating</strong></label>
           	 <input required="required" class="w3-input w3-border" type="number" value="0.0" name="rating" step=".1" max="10" min="0">
          </div>
        </div>
        <button class="w3-button w3-dark-grey" type="submit">Submit</button>
      </form>
    </div>
    </div>
</header>
</body>
</html>