<?php 
  ob_start();
  session_start();
  include "snippet.php";
  require_once 'dbconnect.php';

    if ($_SESSION['role']!= 1) {
 header("Location: index.php");
 exit;
}

$image = $_GET['image'];
$Country = $_GET['Country'];
$City = $_GET['City'];
$id = $_GET['id'];


 ?>

 <!DOCTYPE html>
 <html>
 <head>
 	<title>update</title>
 </head>
 <body>
 	<div class='page-content p-5' id='content'> 

 	 <form method= "post" action="editlocation.php">
        <table class="table table-dark">
           <tr>
               <th>image</th>
               <td><input value="<?php echo $image ?>"  type="varchar" name="image"  placeholder="image" /></td>
           </tr>    
           <tr>
               <th>Country</th>
               <td><input value="<?php echo $Country ?>" type="varchar"  name="Country" placeholder ="add Country" /></td>
           </tr>
           <tr>
               <th>City</th>
               <td><input value="<?php echo $City ?>" type="text"  name="City" placeholder ="City" /></td>
           </tr>
           <tr>
            <td><button type ="submit" class="btn btn-info m-2">Update</button></td>
        </tr>
         <tr>
               <td><input value="<?php echo $id ?>"  type="hidden" name="id"  placeholder="id" /></td>
        </tr> 
       </table>
   </form>
</div>
 
 </body>
 </html>