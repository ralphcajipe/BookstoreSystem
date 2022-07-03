<!DOCTYPE html>
<html lang="en">
<head>
</head>
<body>
    <center>
        <form action = "register_customer_validation.php" method = "POST">
            <h3>Create An Account</h3>
            Username
            <br><input type = "text" name = "username">
            <br>Password
            <br><input type = "password" name = "password">
            <br><input type = "checkbox" name = "terms" value = "true"> Accept <a href = "terms.php">Terms and Agreement</a>
            <br><?php
                    if (isset($error))
                    {
                        echo "<br>".$error;
                    }
                ?>
            <br><br><input type = "submit" name = "submit" value = "Create Account">
        </form>
    </center> 
</body>
</html>
