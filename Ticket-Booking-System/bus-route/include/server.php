
<?php
$host = 'localhost';
$username = 'root';
$password = '';  
$database = 'ticket_booking_system';

// Create a new MySQLi object
$conn = new mysqli($host, $username, $password, $database);

// Check the connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Retrieve data from the HTML form
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $route_num = $_POST["rt_number"];
    $starting_point = $_POST["st_point"];
    $destination = $_POST["dest"];
    $distance = $_POST["distance"];
    $total_fare = $_POST["tot_fare"];
    
    // echo $route_num;
    // echo $starting_point;
    // echo $destination;
    // echo $distance;
    // echo $total_fare;
    

    // Sanitize and validate data if needed

    // SQL query to insert data into the 'users' table
    $sql = "INSERT INTO Bus_Routes (Route_Number, Starting_Point, Destination, Distance, Total_Fare)
            VALUES ('$route_num', '$starting_point', '$destination', '$distance', '$total_fare')";

    if ($conn->query($sql) === TRUE) {
        echo "Data inserted successfully!";
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }
}

// Close the connection
$conn->close();
?>