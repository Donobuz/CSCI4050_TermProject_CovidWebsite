<html>
<head>
    <title>Welcome</title>
    <style><%@include file="/WEB-INF/css/welcome.css"%></style>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</head>

<header id = bal>
    <input type="image" src="images/nav_logo.PNG" name="nav" class="btSubmit" id="nav" />
    <nav>
        <ul id = nav__links>
            <li><a style = 'text-decoration: none' href = > Testing Center </a> </li>
            <li><a style = 'text-decoration: none' href = > Donation Center </a></li>
            <li> <a style = 'text-decoration: none' href = 'https://www.youtube.com/' > Shop </a></li>
            <li><a style = 'text-decoration: none' href = "/edit/${account.email}"> ${account.userName} </a></li>
        </ul>
    </nav>


</header>
<body>

<div class = grid>
    <div id = card1>
        <h3 class = headstuff>Welcome,<br> ${account.firstName}!</h3>
        <p id=" divider1">Practice social distancing by putting space
            between yourself and others. Continue to practice healthy habits,
            like washing your hands for at least twenty seconds and staying home if you are sick,
            to help slow the spread of <a href = https://www.cdc.gov/coronavirus/2019-ncov/index.html style="color:#817ffe;">#COVID19</a>.</p>
        <button id = butt1>Resources</button>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <button id = butt2>Self-check</button>

    </div>



</div>

<div class = grid id = g2>
    <div class = card2>
        <img class = icon src="images/world.png" >
        <h2 style = 'display: inline-block' class=" sechead"> Global News</h2>
        <p class = pnew>
            Since the beginning of the pandemic, accelerating the development of and equitable access to vaccines,
            diagnostics and therapeutics for COVID-19 has been a priority for WHO.
            Already, we have made remarkable progress.
            </p>
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <form action="/news">
            <input type="submit" class=butt3 value="View"/>
        </form>
    </div>

    <div class = card3>
        <img class = icon src="images/flag.png" >
        <h2 style = 'display: inline-block' class=" sechead"> US News</h2>
        <p class = pnew>Since the beginning of the pandemic, accelerating the development of and equitable access to vaccines,
            diagnostics and therapeutics for COVID-19 has been a priority for WHO.
            Already, we have made remarkable progress.
        </p>
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <form action="/news">
            <input type="submit" class=butt3 value="View"/>
        </form>

    </div>

    <div class = card4>
        <img class = icon src="images/cap.png" id = icon>
        <h2 style = 'display: inline-block' class=" sechead" id = cardt> Georgia News</h2>
        <p class = pnew id = pn>Since the beginning of the pandemic, accelerating the development of and equitable access to vaccines,
            diagnostics and therapeutics for COVID-19 has been a priority for WHO.
            Already, we have made remarkable progress.
        </p>
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <form action="/news">
            <input type="submit" class=butt3 value="View"/>
        </form>
</div>

    <div class = card5>
        <img class = icon src="images/bulld.png" id = ic4>
        <h2 style = 'display: inline-block' class=" sechead" > Athens News</h2>
        <p class = pnew>Since the beginning of the pandemic, accelerating the development of and equitable access to vaccines,
            diagnostics and therapeutics for COVID-19 has been a priority for WHO.
            Already, we have made remarkable progress.
        </p>
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <form action="/news">
            <input type="submit" class=butt3 value="View"/>
        </form>

    </div>

</div>
</body>
</html>