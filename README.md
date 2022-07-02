# BookstoreSystem

## 🅿 Click on Projects 
This is where tasks are assigned and their Todo, In Progress, and Done status are noted.

## ⚠ Click on Issues
This is where we track issues of development.

## 💻 Set Git Bash as your default terminal for VS Code
Watch https://youtu.be/PzJCwfYfIzY

## 📺 Tutorial: How to work with multiple developers on the same project 
Watch https://youtu.be/MnUd31TvBoU

## 😄😄Clone this project on your ```C:\xampp\htdocs```
```
>>> cd C:\xampp\htdocs\

>>> git clone https://github.com/ralphcajipe/BookstoreSystem.git

>>> git pull origin main
```

## 📢 Creating Pull Requests (tell others about your code edits or changes)
Example: Create a new branch for the homepage php script. This preserves the state of the ```main``` branch. We don't want to push directly into the ```main``` branch.
Use simple and readable branch names!
```
>>> git checkout -b home-php
```

To add a single file to the new branch
```
>>> git add home.php
```

Or to add all changed files
```
>>> git add -A
```

✉ Always commit what you've done through a message.
The commit message should be logical and in present tense.
```
>>> git commit -m "add home.php"
or
>>> git commit -m "delete name_of_feature in home.php"
or
>>> git commit -m "change name_of_feature in home.php"
```

Push the commit to the branch name
```
>>> git push origin home-php
```

Go to the GitHub repository link 
```
click Compare & Pull Request to open a pull request. Leave comments for good practice.
```

If going back to the ```main``` branch
```
>>> git checkout main
```

Always stay up-to-date with the ```main``` branch
```
>>> git pull origin main
```

🔁 And this series of git commands repeats in development.
