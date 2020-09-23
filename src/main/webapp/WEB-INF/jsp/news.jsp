<%@ page import="java.net.http.HttpResponse" %>
<html>

<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <style><%@include file="/WEB-INF/css/news.css"%></style>
    <title>News</title>
</head>

<h1>News</h1>

<aside>
    <h2><a id="source0"></a></h2>
    <a id="url0"><img id="image0">
    <h2 id="title0"></h2></a>
    <p id="description0"></p>
</aside>
<aside>
    <h2><a id="source1"></a></h2>
    <a id="url1"><img id="image1">
        <h2 id="title1"></h2></a>
    <p id="description1"></p>
</aside>
<aside>
    <h2><a id="source2"></a></h2>
    <a id="url2"><img id="image2">
        <h2 id="title2"></h2></a>
    <p id="description2"></p>
</aside>
<aside>
    <h2><a id="source3"></a></h2>
    <a id="url3"><img id="image3">
        <h2 id="title3"></h2></a>
    <p id="description3"></p>
</aside>
<aside>
    <h2><a id="source4"></a></h2>
    <a id="url4"><img id="image4">
        <h2 id="title4"></h2></a>
    <p id="description4"></p>
</aside>
<aside>
    <h2><a id="source5"></a></h2>
    <a id="url5"><img id="image5">
        <h2 id="title5"></h2></a>
    <p id="description5"></p>
</aside>
<aside>
    <h2><a id="source6"></a></h2>
    <a id="url6"><img id="image6">
        <h2 id="title6"></h2></a>
    <p id="description6"></p>
</aside>
<aside>
    <h2><a id="source7"></a></h2>
    <a id="url7"><img id="image7">
        <h2 id="title7"></h2></a>
    <p id="description7"></p>
</aside>
<aside>
    <h2><a id="source8"></a></h2>
    <a id="url8"><img id="image8">
        <h2 id="title8"></h2></a>
    <p id="description8"></p>
</aside>
<aside>
    <h2><a id="source9"></a></h2>
    <a id="url9"><img id="image9">
        <h2 id="title9"></h2></a>
    <p id="description9"></p>
</aside>

<script>

    fetch('https://gnews.io/api/v3/search?max=10&image=required&country=de&q=coronavirus|covid-19&token=333e86a5d1adfb9bbd72331f0ee913f0')
        .then(function (response) {
            return response.json();
        })
        .then(function (data) {
            var i;
            for(i=0;i<data.articleCount;i++){
                document.getElementById("source"+i).innerHTML = data.articles[i].source.name;
                document.getElementById("source"+i).href = data.articles[i].source.url;
                document.getElementById("url"+i).href = data.articles[i].url;
                document.getElementById("image"+i).src = data.articles[i].image;
                document.getElementById("title"+i).innerHTML = data.articles[i].title;
                document.getElementById("title"+i).href = data.articles[i].url;
                document.getElementById("description"+i).innerHTML = data.articles[i].description;
            }
            console.log(data);
        })

</script>

</html>