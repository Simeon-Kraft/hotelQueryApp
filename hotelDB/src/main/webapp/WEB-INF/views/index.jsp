<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="/hotels.css">
<style>
body,h1,h2,h3,h4,h5,h6 {font-family: "Raleway", Arial, Helvetica, sans-serif}
</style>
<title>index</title>
<body class="w3-light-grey">
</head>
	<div class="w3-container w3-light-grey">
		<h1>Hotel Search</h1>
	</div>
<header class="w3-display-container w3-content" style="max-width:1500px;">
  <img class="w3-image" src="/images/detroit.jpg" alt="Detroit" style="min-width:1000px" width="1500" height="800">
  <div class="w3-display-left w3-padding w3-col l6 m8">
    <div class="w3-container w3-red">
      <h2><i class="fa fa-bed w3-margin-right"></i>Find Hotel</h2>
    </div>
    <div class="w3-container w3-white w3-padding-16">
      <form action="/results">
        <div class="w3-row-padding" style="margin:8px -16px;">
          <div class="w3-half w3-margin-right">
            <label><strong>Select City</strong></label>
            <select name="city">
            	<option value="--" selected disabled hidden>--</option>
            	<option value="Detroit">Detroit</option>
            	<option value="Indianapolis">Indianapolis</option>
            	<option value="Chicago">Chicago</option>
            	<option value="Kansas City">Kansas City</option>
            </select>
          </div>
          <div class="w3-half w3-margin-top">
            <label><strong>Maximum Price</strong></label>
            <input class="w3-input w3-border" type="number" value="175" name="max" min="1">
          </div>
        </div>
        <button class="w3-button w3-dark-grey" type="submit"><i class="fa fa-search w3-margin-right"></i> Search</button>
      </form>
    </div>
  </div>
</header>
</body>
</html>