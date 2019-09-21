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
$id = $_GET['id'];
$webAdress = $_GET['webAdress'];
$zipCode = $_GET['zipCode'];
$name = $_GET['name'];
$type = $_GET['type'];
$adress = $_GET['adress'];

$sql = "SELECT * FROM location";
$result = $conn->query($sql);

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
            <th>Location</th>
            <td><select name="location">
              <?php if($result->num_rows > 0) {
                         while($row = $result->fetch_assoc()) {
                            echo  "<option value=".$row['LocationId'].">".$row['City']."</option>";
                 } } ?>
            </select>
          </td>
        </tr>
           <tr>
               <th>image</th>
               <td><input value="<?php echo $image ?>"  type="varchar" name="image"  placeholder="image" /></td>
           </tr>    
           <tr>
               <th>name</th>
               <td><input value="<?php echo $name ?>" type="varchar"  name="name" placeholder ="add name" /></td>
           </tr>
           <tr>
               <th>type</th>
               <td><input value="<?php echo $type ?>" type="text"  name="type" placeholder ="type" /></td>
           </tr>
           <tr>
               <th>adress</th>
               <td><input value="<?php echo $adress ?>" type="text"  name="adress" placeholder ="adress" /></td>
           </tr>
           <tr>
               <th>zipCode</th>
               <td><input value="<?php echo $zipCode ?>" type="text"  name="zipCode" placeholder ="zipCode" /></td>
           </tr>
           <tr>
               <th>webAdress</th>
               <td><input value="<?php echo $webAdress ?>" type="text"  name="webAdress" placeholder ="webAdress" /></td>
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