<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>HomePage</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

</head>
<body>
<div class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="/">Home</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav">
            <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Recipes
                    </a>
                <div class="dropdown-menu" aria-labeledby="navbarDropdownMenuLink">
                    <a class="dropdown-item" href="#">Breakfast</a>
                    <a class="dropdown-item" href="#">Lunch</a>
                    <a class="dropdown-item" href="#">Dinner</a>
                </div>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Favorite Brands</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="about">About Us</a>
            </li>
            <#if isAdmin?? && isAdmin>
                <li class="nav-item">
                    <a class="nav-link text-info" href="controlpanel">Control Panel</a>
                </li>
            </#if>
        </ul>
            <form class="form-inline my-2 my-lg-0 ml-auto" method="post">
                <input class="form-control mr-sm-2" type="search" placeholder="Search Recipes" aria-label="Search">
                <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
            </form>
    </div>
</div>

<#if isAdmin?? && isAdmin>
    <p>Currently signed in as the admin! Sign out by clicking this button:</p>
    <form action="/signout" method="post">
        <input type="submit" value="Sign out">
    </form>
</#if>

<h1>Featured Recipe</h1>
<p><a href="#">[item]</a></p>

<h1>New Recipe ChangeLog</h1>
<p><a href="#">[item1]</a> added: 6/6/2024</p>
<p><a href="#">[item2]</a> added: 6/6/2024</p>

<h1>Announcements</h1>
<ul class="list-group">
    <#list announcements as announcement>
        <li class="list-group-item"><div style="white-space: pre-wrap">${announcement.announcement}</div> Time Written: ${announcement.timeWritten.toString()}
            <#if isAdmin?? && isAdmin>
                <form action="/deleteAnnouncement" method="post">
                    <input type="hidden" name="id" id="id" value="${announcement.id}">
                    <input type="submit" class="btn btn-danger" value="Delete">
                </form>
            </#if>
        </li>
    </#list>
</ul>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>