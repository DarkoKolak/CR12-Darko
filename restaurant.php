<?php 
ob_start();
session_start();
require_once 'dbconnect.php';
include "snippet.php";

echo "<div class='page-content p-5' id='content'> <div class='location'> Restaurants </div>";

							//Restaurants
     echo"     <table class='table table-dark'>

                                  <thead>
                                    <tr>
                                      <th scope='col'>Image</th>
                                      <th scope='col'>Country</th>
                                      <th scope='col'>City</th>
                                      <th scope='col'>ZIP Code</th>
                                      <th scope='col'>Adress</th>
                                      <th scope='col'>Description</th>
                                      <th scope='col'>Name</th>
                                      <th scope='col'>Type</th>
                                      <th scope='col'>Web Adress</th>
                                    </tr>
                                  </thead>";



           $res2 = "SELECT location.City,location.Country,restaurant.* from location
					INNER JOIN restaurant on location.LocationId = restaurant.fk_location";
           $result = $conn->query($res2);

            if($result->num_rows > 0) {
                while($row = $result->fetch_assoc()) {
                   echo  "
                    <tbody>
                         <tr>
                         	 <td> <img src=" .$row['image']." alt = foto  height = 200px></td>
                             <td>" .$row['Country']."</td> <td>".$row['City' ]."</td>
                             <td> " .$row['zipCode']."</td>
                             <td> " .$row['adress']."</td>
                             <td> " .$row['description']."</td>
                             <td> " .$row['Name']."</td>
                             <td> " .$row['type']."</td>
                             <td> " .$row['webAdress']."</td>
                        </tr>
                    </tbody> 
                   " ;
               }
           } else  {
               echo  "<tr><td colspan='5'><center>No Data Avaliable</center></td></tr>";
           };
           echo "</table>";
           echo "</div>";


 ?>
 <!DOCTYPE html>
 <html>
 <head>
 	<title>locations</title>
 	<style type="text/css">
  .location{
    text-align: center;
    font-size: 2vw;
    font-style: italic;
    font-weight: bold;
  }
 </head>
 <body>
 
 </body>
 </html>