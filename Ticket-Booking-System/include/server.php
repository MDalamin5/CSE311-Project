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
    $userid = $_POST["user_id"];
    $passwd = $_POST["pwds"];
    
    // Sanitize and validate data if needed

    // SQL query to check if user_id and password match in the 'passengers' table
    $sql = "SELECT Name, Password
    FROM passengers
    WHERE Passenger_ID = $userid AND Password = '$passwd'";

    // Execute the query
    $result = $conn->query($sql);

    // Check if any rows were returned
    if ($result->num_rows > 0) {
        // Authentication successful
        echo "Login successful!";
    } else {
        // Authentication failed
        echo "Login failed. Please check your credentials.";
    }
}

// Close the connection
$conn->close();
?>
