<?php
session_start();
include 'include/config.php';
if (strlen($_SESSION['slogin']) == 0) {
    header('location:index.php');
} else {
    if (isset($_POST['update'])) {
        $complaintnumber = $_GET['cid'];
        $status = $_POST['status'];
        $remark = $_POST['remark'];
        $query = mysqli_query($con, "insert into complaintremark(complaintNumber,status,remark) values('$complaintnumber','$status','$remark')");
        $sql = mysqli_query($con, "update tblcomplaints set status='$status' where complaintNumber='$complaintnumber'");

        echo "<script>alert('Complaint details updated successfully');</script>";

    }

    ?>
<script language="javascript" type="text/javascript">
function f2()
{
window.close();
}ser
function f3()
{
window.print();
}
</script>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>User Profile</title>
<link href="style.css" rel="stylesheet" type="text/css" />
<link href="anuj.css" rel="stylesheet" type="text/css">
</head>
<body>

<div style="margin-left:50px;">
 <form name="updateticket" id="updatecomplaint" method="post">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td  >&nbsp;</td>
      <td >&nbsp;</td>
    </tr>
    <tr height="50">
      <td><b>Complaint Number</b></td>
      <td><?php echo htmlentities($_GET['cid']); ?></td>
    </tr>
<?php
    $cid = $_GET['cid'];
    $quer = mysqli_query($con, "select status from tblcomplaints where complaintNumber='$cid'");
    while ($row = mysqli_fetch_array($quer)) {
    if ($row['status'] == 4) {?>
    <tr height="50">
      <td><b>Status</b></td>
      <td><select name="status" required="required">
      <option value="">Select Status</option>
      <option value="5">Approve Certificate</option>
      <option value="6">Reject Certificate</option>
      </select></td>
    </tr>
<?php }

    }?>

    <?php
        $cid = $_GET['cid'];
        $quer1 = mysqli_query($con, "select certificate from tblcomplaints where complaintNumber='$cid'");
        while ($row = mysqli_fetch_array($quer1)) {?>
          <tr height="50">
          <td><b>Certificate Number :</b></td>
          <td><span name="certificate"><?php echo $row['certificate']?></span></td>
          </tr>
        <?php } ?>

    <tr height="50">
    <td><b>Remark</b></td>
    <td><textarea name="remark" cols="50" rows="10" required="required"></textarea></td>
  </tr>

</table>
      <br><br><br><br>
      <center><input type="submit" name="update" value="Approve Certificate"></center>
      <br><br><br><br><br><br>
      <center><input name="Submit2" type="submit" class="txtbox4" value="Close this window " onClick="return f2();" style="cursor: pointer;"  /></center>




 </form>
</div>

</body>
</html>

     <?php }?>
