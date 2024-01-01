
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
    $bus_num = $_POST["b_number"];
    $seating_cap = $_POST["seat_cap"];
    $model = $_POST["model"];
    
    // echo $route_num;
    // echo $starting_point;
    // echo $destination;
    // echo $distance;
    // echo $total_fare;
    

    // Sanitize and validate data if needed

    // SQL query to insert data into the 'users' table
    $sql = "INSERT INTO Buses (Bus_Number, Seating_Capacity, Model)
            VALUES ('$bus_num', '$seating_cap', '$model')";

    if ($conn->query($sql) === TRUE) {
        echo "Data inserted successfully!";
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }
}

// Close the connection
$conn->close();
?>