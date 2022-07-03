<?php
if (empty($_POST["username"]))
{
    $error = "Please insert a username.";
}
elseif (empty($_POST["password"]))
{
    $error = "Please insert a password.";
}
elseif ($_POST["terms"] != "true")
{
    $error = "Please accept the terms and agreement.";
}
else
{
    //Database Connection
    $conn = mysqli_connect("localhost", "root", "", "db_bookstore") or die("Unable to connect.");
    $id = random_int(1000,1999);
    mysqli_query($conn, "INSERT INTO tb_customer(id, username, password)VALUES('$id', '$_POST[username]', '$_POST[password]')");
    header("location:home.php"); //home page
}
include("register_customer.php");
?>