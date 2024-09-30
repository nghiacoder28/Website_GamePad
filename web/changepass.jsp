
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
        <div class="cont" style="text-align: center;" >

            <div class="form sign-in">
                <form action="changepass" method="post">
                    <h2>Change your pass here</h2>
                    <p class="text-danger" style="color: red">${mess}</p>
                    <p class="text-danger" style="color: greenyellow">${mess1}</p>
                    <label>
                        User Name:
                        <input name="name" type="text" value="${acc.username}" readonly=""><br>
                    </label>
                    <label>
                        Password:
                        <input name="pass" type="password" value="${acc.pass}"readonly=""><br>
                    </label>
                    <label>
                        New Password:
                        <input name="npass" type="password" value=""><br>
                    </label>
                    <button class="submit" name="submit">Save</button>
                    <a href="Home" style="font-size: 25px;">Back</a>
                </form>
            </div>
        </div>
        <script type="text/javascript" src="js/login.js"></script>
    </body>
</html>
