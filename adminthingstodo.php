<?php 
ob_start();
session_start();
require_once 'dbconnect.php';
include "snippet2.php";


  if ($_SESSION['role']!= 1) {
 header("Location: index.php");
 exit;
}

echo "<div class='page-content p-5' id='content'> <div class='location'> Things to do </div>";
              //Things to do
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



           $res2 = "SELECT location.City,location.Country,thingstodo.* from location
          INNER JOIN thingstodo on location.LocationId = thingstodo.fk_location";
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
                             <td> " .$row['name']."</td>
                             <td> " .$row['type']."</td>
                             <td> " .$row['webAdress']."</td>
                                                          <td>
                                       <a href='updatethingstodo.php?image=" .$row['image']."&Country=".$row['Country']."&zipCode=".$row['zipCode']."&adress=".$row['adress']."&description=".$row['description']."&name=".$row['name']."&type=".$row['type']."&webAdress=".$row['webAdress']."'><button type='button'>Edit</button></a>
                                        <a href='deletethingstodo.php?image=" .$row['image']."&Country=".$row['Country']."&zipCode=".$row['zipCode']."&adress=".$row['adress']."&description=".$row['description']."&name=".$row['name']."&type=".$row['type']."&webAdress=".$row['webAdress']."'><button type='button'>Delete</button></a>
                                    </td>
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