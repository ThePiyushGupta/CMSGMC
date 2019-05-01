<div class="span3">
	<div class="sidebar">
		<ul class="widget widget-menu unstyled">
			<li>
				<a class="collapsed" data-toggle="collapse" href="#togglePages">
				<i class="menu-icon icon-cog"></i>
				<i class="icon-chevron-down pull-right"></i><i class="icon-chevron-up pull-right"></i>
				Manage Complaint
				</a>
				<ul id="togglePages" class="collapse unstyled">
					<li>
						<a href="notprocess-complaint.php">
						<i class="icon-tasks"></i>
						Approved By Engineer
						<?php
							$rt = mysqli_query($con,"SELECT * FROM tblcomplaints where status='1'");
							$num1 = mysqli_num_rows($rt);
							{?>
						<b class="label orange pull-right"><?php echo htmlentities($num1); ?></b>
						<?php } ?>
						</a>
					</li>
					<li>
						<a href="inprocess-complaint.php">
						<i class="icon-tasks"></i>
						Approve Certificate
						<?php
							$rt = mysqli_query($con,"SELECT * FROM tblcomplaints where status='4'");
							$num1 = mysqli_num_rows($rt);
							{?><b class="label orange pull-right"><?php echo htmlentities($num1); ?></b>
						<?php } ?>
						</a>
					</li>
					<li>
						<a href="resolved-complaint.php">
						<i class="icon-inbox"></i>
						Resolved Complaints
						<?php
							$rt = mysqli_query($con,"SELECT * FROM tblcomplaints where status='5'");
							$num1 = mysqli_num_rows($rt);
							{?><b class="label green pull-right"><?php echo htmlentities($num1); ?></b>
						<?php } ?>
						</a>
					</li>
					<li>
						<a href="closed-complaint.php">
						<i class="icon-inbox"></i>
						Closed Complaints
						<?php
							$rt = mysqli_query($con,"SELECT * FROM tblcomplaints where status='6'");
							$num1 = mysqli_num_rows($rt);
							{?><b class="label green pull-right"><?php echo htmlentities($num1); ?></b>
						<?php } ?>
						</a>
					</li>
				</ul>
			</li>
		</ul>
		<!--/.widget-nav-->
		<ul class="widget widget-menu unstyled">
			<li><a href="change-password.php"><i class="menu-icon icon-tasks"></i>Change Password</a></li>
			<li>
				<a href="logout.php">
				<i class="menu-icon icon-signout"></i>
				Logout
				</a>
			</li>
		</ul>
	</div>
	<!--/.sidebar-->
</div>
<!--/.span3-->
