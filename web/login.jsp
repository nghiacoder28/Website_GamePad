<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>WELCOME LOGIN</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="style/login.css">
        <link href="https://fonts.googleapis.com/css?family=Nunito:400,600,700,800&display=swap" rel="stylesheet">
    </head>

    <body>
        <div class="cont">

            <div class="form sign-in">

                <form action="login" method="post">
                    <h2>Sign In</h2>
                    <p class="text-danger" style="color: red">${mess}</p>
                    <label>
                        User Name:
                        <input name="name" type="text" value="" required=""><br>
                    </label>
                    <label>
                        Password:
                        <input name="pass" type="password" value="" required=""><br>
                    
                    <button class="submit" name="submit">Sign In</button>
                </form>
            </div>


            <div class="sub-cont">
                <div class="img">
                    <div class="img-text m-up">
                        <h2>New here?</h2>
                        <p>Sign up and discover great amount of new opportunities!</p>
                    </div>
                    <div class="img-text m-in">
                        <h2>One of us?</h2>
                        <p>If you already has an account, just sign in. We've missed you!</p>
                    </div>
                    <div class="img-btn">
                        <span class="m-up">Sign Up</span>
                        <span class="m-in">Sign In</span>
                    </div>
                </div>
                <div class="form sign-up" >
                    <form action="Register" method="post">
                        <p class="text-danger" style="color: red">${message}</p>
                        <label>
                            User Name:
                            <input name="name" type="text" value="" required=""><br>
                        </label>
                        <label style="margin-top: -10px">
                            Email:
                            <input name="email" type="email" value="" required=""><br>
                        </label>
                        <label style="margin-top: -5px">
                            <span>Password</span>
                            <input type="password" name="pass" required="">
                        </label>
                        <label >
                            <span>Confirm Password</span>
                            <input type="password" name="repass" required="">
                        </label>
                        <label >
                            <span>Full name</span>
                            <input type="text" name="fullname" required="">
                        </label>
                        <label>
                            <span>BirthDay</span>
                            <input type="date" name="birthday" required="">
                        </label>
                        <label>
                            <span>Phone</span>
                            <input type="text" name="phone" required="">
                        </label>
                        <label>
                            <span>Address</span>
                            <input type="text" name="address" required="">
                        </label>
                        <button name="submit" class="submit">Sign Up Now</button>
                    </form>

                </div>
            </div>
        </div>
        <script type="text/javascript" src="js/login.js"></script>
    </body>
</html>
