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
        $selrow = mysqli_query($con, "select * from tblcomplaints where complaintnumber = '$complaintnumber'");
        $val = mysqli_fetch_array($selrow);
        $category = $val['category'];
        $subcategory = $val['subcategory'];
        if ($status == 2) {
            $fetchreqworkers = mysqli_query($con, "SELECT * from subcategory,category WHERE subcategory.categoryid = category.id and categoryid='$category' and subcategory='$subcategory'");
            $reqworkersarr = mysqli_fetch_array($fetchreqworkers);
            $reqworker = $reqworkersarr['ReqWorkers'];
            $remworkers = $reqworkersarr['RemWorkers'];
            if ($reqworker <= $remworkers) {
                $remworkers = $remworkers - $reqworker;
                $sql = mysqli_query($con, "update tblcomplaints set status=3 where complaintNumber='$complaintnumber'");
                $updcategory = mysqli_query($con, "update category set RemWorkers = '$remworkers' where id = '$category'");
            }
        } else if ($status == 5) {
            $fetchreqworkers = mysqli_query($con, "SELECT * from subcategory,category WHERE subcategory.categoryid = category.id and categoryid='$category' and subcategory='$subcategory'");
            $reqworkersarr = mysqli_fetch_array($fetchreqworkers);
            $reqworker = $reqworkersarr['ReqWorkers'];
            $remworkers = $reqworkersarr['RemWorkers'];
            $remworkers += $reqworker;

            // Now assign workers to approved complaints
            $fetchcomplaints = mysqli_query($con, "select * from tblcomplaints,subcategory where tblcomplaints.subcategory = subcategory.subcategory and status=2 and category = '$category' order by regDate asc");
            while ($complaint = mysqli_fetch_array($fetchcomplaints)) {
                $reqworker = $complaint['ReqWorkers'];
                if ($reqworker <= $remworkers) {
                    $remworkers -= $reqworker;
                    $complaintnumber = $complaint['complaintNumber'];
                    $sql = mysqli_query($con, "update tblcomplaints set status=3 where complaintNumber='$complaintnumber'");
                } else {
                    break;
                }
            }
            $updcategory = mysqli_query($con, "update category set RemWorkers = '$remworkers' where id = '$category'");
        }

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
        if ($row['status'] == 1) {?>
    <tr height="50">
      <td><b>Status</b></td>
      <td><select name="status" required="required">
      <option value="">Select Status</option>
      <option value="2">Accept Complaint</option>
      <option value="6">Close Complaint</option>
      </select></td>
    </tr>
  <?php } elseif ($row['status'] == 4) {?>
    <tr height="50">
      <td><b>Status</b></td>
      <td><select name="status" required="required">
      <option value="">Select Status</option>
      <option value="5">Completed</option>
      </select></td>
    </tr>
<?php }

    }?>

      <tr height="50">
      <td><b>Remark</b></td>
      <td><textarea name="remark" cols="50" rows="10" required="required"></textarea></td>
    </tr>



    <tr height="50">
      <td>&nbsp;</td>
      <td><input type="submit" name="update" value="Submit"></td>
    </tr>



       <tr><td colspan="2">&nbsp;</td></tr>

    <tr>
  <td></td>
      <td >
      <input name="Submit2" type="submit" class="txtbox4" value="Close this window " onClick="return f2();" style="cursor: pointer;"  /></td>
    </tr>



</table>
 </form>
</div>

</body>
</html>

     <?php }?>
