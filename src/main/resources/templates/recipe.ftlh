<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>${recipe.recipeTitle}</title>
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

<h1>${recipe.recipeTitle}</h1>
<img src="data:image/png;base64,${image}" alt="Recipe Image for ${recipe.recipeTitle}">
<br>
<h2> Recipe Ingredients </h2>
<div style="white-space: pre-wrap">${recipe.recipeIngredients}</div>
<br>
<h2> Instructions </h2>
<div style="white-space: pre-wrap">${recipe.recipeEntry}</div>
<br>
<h2> Tags</h2>
<ul>
    <#list recipe.tags as tag>
        <li>${tag.tagName}</li>
    </#list>
</ul>
<h2>Time Written</h2>
<p>${recipe.timeWritten}</p>




<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>