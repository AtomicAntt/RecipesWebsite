<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>ControlPanel</title>
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

<h2>Add Announcements Here</h2>

<form action="/announce" method="post">
    <label for="announcement">
        Post Announcement
    </label>
    <textarea class="form-control" id="announcement" name="announcement"></textarea>
    <input type="submit" value="Post Announcement">
</form>
<br>

<h2>Create Recipe Tags Here</h2>
<p>Note: This means adding a new tag that recipes can add, not adding a new one to a recipe.</p>

<form action="/addTag" method="post">
    <label for="tagName">
        New Tag Name
    </label>
    <input type="text" id="tagName" name="tagName" class="form-control">
    <input type="submit" value="Add Tag">
</form>
<br>

<h2>Delete Recipe Tags Here</h2>

<ul>
    <#list tags as tag>
        <li>
            <form action="/deleteTag" method="post">
                <label for="tagName">
                    ${tag.tagName}
                </label>
                <input type="hidden" name="tagId" value="${tag.id}">
                <input type="submit" value="Delete Tag">
            </form>

        </li>
    </#list>
</ul>

<h2>Add Recipes Here</h2>

<form action="/addRecipe" method="post" enctype="multipart/form-data">
    <label for="image">Recipe Image:</label>
    <input type="file" id="image" name="image" required>
    <br>

    <label for="recipeTitle">
        Recipe Title
    </label>
    <input type="text" id="recipeTitle" name="recipeTitle" class="form-control">

    <label for="recipeIngredients">
        Recipe Ingredients
    </label>
    <textarea class="form-control" id="recipeIngredients" name="recipeIngredients"></textarea>

    <label for="recipeEntry">
        Recipe Instructions
    </label>
    <textarea class="form-control" id="recipeEntry" name="recipeEntry"></textarea>
    <div id="result"></div>

    Recipe Tags/Categories
    <br>
    <ul>
        <#list tags as tag>
            <li>
                <input class="form-check-input" type="checkbox" name="tagId" id="${tag.id}" value="${tag.id}"> ${tag.tagName} <br>
            </li>

        </#list>
    </ul>

    <input type="submit" value="Post Recipe">
</form>





<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

<script>
    // $("#recipeEntry").on('keyup', function(e) {
    //     let input = $(e.target).val();
    //     input = input.replace(/[\n]{2}/g, '</p><p>');
    //     input = input.replace(/[\n]{1}/g, '<br/>');
    //     input = input.replace(/\*\*(.+?)\*\*/g, '<strong>$1</strong>');
    //     input = input.replace(/\*(.+?)\*/g, '<em>$1</em>');
    //     $('#result').html('<div style="white-space: pre-wrap">' + input + '</div>');
    // });

    $("#recipeEntry, #recipeIngredients, #announcement").on('keydown', function(e) {
        if (e.key === 'Tab') {
            e.preventDefault();
            const start = this.selectionStart;
            const end = this.selectionEnd;

            // Set textarea value to: text before caret + tab + text after caret
            $(this).val($(this).val().substring(0, start) + "\t" + $(this).val().substring(end));

            // Put caret at right position again
            this.selectionStart = this.selectionEnd = start + 1;
        }
    });
</script>
</body>
</html>