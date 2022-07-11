/* Destroying the session and redirecting the user to the index page. */
<?php
session_start();
session_destroy();
header('location:./');