# BookstoreSystem

## Click on Projects 
This is where tasks are assigned and their Todo, In Progress, and Done status are noted.


## Click on Issues
This is where we track issues of development.

## Set Git Bash as your default terminal for VS Code
Watch https://youtu.be/PzJCwfYfIzY

## Clone the project on your C:\xampp\htdocs
```
>>> cd C:\xampp\htdocs\

>>> git clone https://github.com/ralphcajipe/BookstoreSystem.git

>>> git pull origin main
```

## Creating Pull Requests (tell others about your code edits or changes)
Example: Create a new branch for the homepage php script. This preserves state of the main branch. We don't want to push directly into the main branch.
Use simple and readable branch names!
```
>>> git checkout -b home-php
```

Add the file to the branch
```
>>> git add home.php
```

Commit what you've done through a message.
The commit message should be in present tense.
```
>>> git commit -m "add home.php"
```

Push the branch name
```
>>> git push origin home-php
```

If going back to the main branch
```
>>> git checkout main
```

Always stay up-to-date with the main branch
```
>>> git pull origin main
```
