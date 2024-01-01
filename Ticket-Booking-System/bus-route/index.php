<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>bus-route</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="preconnect" href="https://fonts.gstatic.com" />
    <link rel="preconnect" href="https://firebasestorage.googleapis.com" />
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
    <link href="../css/aspect-elements.css" rel="stylesheet" />
    <link href="css/aspect-style.css" rel="stylesheet" />
</head>
<body id="root-container" style="margin: 0;" onload="initAspectJS()">
    <div data-element-behavior="menu" id="nav-id-586-" data-element-type="section">
        <div id="container-id-587-" data-element-type="container">
            <div id="container-id-602-" data-element-type="container">
                <a id="button-id-596-" data-element-type="button"><span id="element-id-597-">NSU-BUS</span></a>
                <a id="button-id-598-" data-element-type="button" href="/project"><span id="element-id-599-">HOME</span></a>
                <a id="button-id-600-" data-element-type="button" href="/project/all-buses"><span id="element-id-601-">Add Bus</span></a>
            </div>
            <div id="container-id-616-" data-element-type="container">
                <a id="button-id-610-" data-element-type="button" href="/project"><span id="element-id-611-">Sign In</span></a>
                <a id="button-id-612-" data-element-type="button" href="/project/sign-up"><span id="element-id-613-">Sign Up</span></a>
                <a id="button-id-614-" data-element-type="button"><span id="element-id-615-">About Us</span></a>
            </div>
        </div>
    </div>
    <div id="content-container">
        <p id="text-id-624-" data-element-type="text">
            <span id="element-id-621-">Welcome</span> to the <span id="element-id-625-">Bus Route Registration</span> Page.&nbsp;<br id="element-id-623-">Please fill out the Following Details to request a new Bus route to our System.
        </p>
        <div id="container-id-666-" data-element-type="container">
            <div data-element-behavior="form" id="form-id-688-" data-element-type="section">
                <form action="include/server.php" id="container-id-682-" data-element-type="container" method="post"  >
                    <input id="input-id-684-" name="rt_number" data-element-type="input" required="true" placeholder="Route Number">
                    <input id="input-id-685-" name="st_point" data-element-type="input" required="true" placeholder="Starting Point">
                    <input id="input-id-683-" name="dest" data-element-type="input" required="true" placeholder="Destination">
                    <input id="input-id-690-" name="distance" data-element-type="input" required="true" placeholder="Distance">
                    <input id="input-id-692-" name="tot_fare" data-element-type="input" required="true" placeholder="Total Fare">
                    <button id="button-id-686-" data-element-type="button" type="submit" name="submit"><span id="element-id-687-">Add Bus Routes</span></button>
                </form>
            </div>
            <a id="image-id-667-" data-element-type="image"><img id="element-id-668-" src="../img/-project-image-7.png"></a>
        </div>
        <div id="section-id-25-" data-element-type="section">
            <div id="container-id-0-" data-element-type="container">
                <div id="container-id-1-" data-element-type="container">
                    <div id="container-id-2-" data-element-type="container">
                        <p id="text-id-3-" data-element-type="text">NSU Bus</p>
                        <div id="container-id-4-" data-element-type="container">
                            <a id="button-id-5-" data-element-type="button" href="/"><span id="element-id-6-">Home</span></a>
                            <a id="button-id-7-" data-element-type="button" href="https://aspect.app"><span id="element-id-8-">About</span></a>
                        </div>
                    </div>
                    <div id="container-id-9-" data-element-type="container">
                        <p id="text-id-10-" data-element-type="text">Product</p>
                        <div id="container-id-11-" data-element-type="container">
                            <a id="button-id-12-" data-element-type="button" href="https://aspect.app/layouts"><span id="element-id-13-">Features</span></a>
                            <a id="button-id-14-" data-element-type="button" href="https://aspect.app/layouts"><span id="element-id-15-">Layouts</span></a>
                        </div>
                    </div>
                    <div id="container-id-16-" data-element-type="container">
                        <p id="text-id-17-" data-element-type="text">Contact</p>
                        <div id="container-id-19-" data-element-type="container">
                            <a id="button-id-20-" data-element-type="button" href="mailto:founders@aspect.app"><span id="element-id-21-">Email</span></a>
                            <a id="button-id-22-" data-element-type="button" href="https://twitter.com/aspectdotapp"><span id="element-id-23-">Twitter</span></a>
                        </div>
                    </div>
                </div>
                <p id="text-id-24-" data-element-type="text">© 2021 Aspect, Inc. All rights reserved.</p>
            </div>
        </div>
    </div>

    <script src="script.js"></script>
</body>
</html>
