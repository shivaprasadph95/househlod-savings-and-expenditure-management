<?php
session_start();
error_reporting(0);
include('includes/dbconnection.php');
?>


<div id="sidebar-collapse" class="col-sm-3 col-lg-2 sidebar">
        <div class="profile-sidebar">
            
            <div class="profile-usertitle">
                <?php
$uid=$_SESSION['detsuid'];
$ret=mysqli_query($con,"select FullName from tbluser where ID='$uid'");
$row=mysqli_fetch_array($ret);
$name=$row['FullName'];

?>
                <div class="profile-usertitle-name"><?php echo $name; ?></div>
                <div class="profile-usertitle-status"><span class="indicator label-success"></span>Online</div>
            </div>
            <div class="clear"></div>
        </div>
        <div class="divider"></div>
        
        <ul class="nav menu">
            <li class="active"><a href="dashboard.php"><em class="fa fa-dashboard">&nbsp;</em> Dashboard</a></li>
            
             <li class="parent "><a data-toggle="collapse" href="#sub-item-3">
                <em class="fa fa-navicon">&nbsp;</em>Income <span data-toggle="collapse" href="#sub-item-1" class="icon pull-right"><em class="fa fa-plus"></em></span>
                </a>
                <ul class="children collapse" id="sub-item-3">
                    <li><a class="" href="add-income.php">
                        <span class="fa fa-arrow-right">&nbsp;</span> Add Income
                    </a></li>
                    <li><a class="" href="manage-income.php">
                        <span class="fa fa-arrow-right">&nbsp;</span> Manage Income
                    </a></li>
                    
                </ul>

            </li>
           
  <li class="parent "><a data-toggle="collapse" href="#sub-item-4">
                <em class="fa fa-navicon">&nbsp;</em>Income Report <span data-toggle="collapse" href="#sub-item-1" class="icon pull-right"><em class="fa fa-plus"></em></span>
                </a>
                <ul class="children collapse" id="sub-item-4">
                    <li><a class="" href="income-datewise-reports.php">
                        <span class="fa fa-arrow-right">&nbsp;</span> Daywise Income
                    </a></li>
                    <li><a class="" href="income-monthwise-reports.php">
                        <span class="fa fa-arrow-right">&nbsp;</span> Monthwise Income
                    </a></li>
                    <li><a class="" href="income-yearwise-reports.php">
                        <span class="fa fa-arrow-right">&nbsp;</span> Yearwise Income
                    </a></li>
                    
                </ul>
            </li>
           
            <li class="parent "><a data-toggle="collapse" href="#sub-item-1">
                <em class="fa fa-navicon">&nbsp;</em>Expenses <span data-toggle="collapse" href="#sub-item-1" class="icon pull-right"><em class="fa fa-plus"></em></span>
                </a>
                <ul class="children collapse" id="sub-item-1">
                    <li><a class="" href="add-expense.php">
                        <span class="fa fa-arrow-right">&nbsp;</span> Add Expenses
                    </a></li>
                    <li><a class="" href="manage-expense.php">
                        <span class="fa fa-arrow-right">&nbsp;</span> Manage Expenses
                    </a></li>
                    
                </ul>

            </li>
           
  <li class="parent "><a data-toggle="collapse" href="#sub-item-2">
                <em class="fa fa-navicon">&nbsp;</em>Expense Report <span data-toggle="collapse" href="#sub-item-1" class="icon pull-right"><em class="fa fa-plus"></em></span>
                </a>
                <ul class="children collapse" id="sub-item-2">
                    <li><a class="" href="expense-datewise-reports.php">
                        <span class="fa fa-arrow-right">&nbsp;</span> Daywise Expenses
                    </a></li>
                    <li><a class="" href="expense-monthwise-reports.php">
                        <span class="fa fa-arrow-right">&nbsp;</span> Monthwise Expenses
                    </a></li>
                    <li><a class="" href="expense-yearwise-reports.php">
                        <span class="fa fa-arrow-right">&nbsp;</span> Yearwise Expenses
                    </a></li>
                    
                </ul>
            </li>





           
			
			
			
			
			<li class="parent "><a data-toggle="collapse" href="#sub-item-7">
                <em class="fa fa-navicon">&nbsp;</em>Loans <span data-toggle="collapse" href="#sub-item-1" class="icon pull-right"><em class="fa fa-plus"></em></span>
                </a>
                <ul class="children collapse" id="sub-item-7">
                    <li><a class="" href="add-loan.php">
                        <span class="fa fa-arrow-right">&nbsp;</span> Add Loans
                    </a></li>
                    <li><a class="" href="manage-loan.php">
                        <span class="fa fa-arrow-right">&nbsp;</span> Manage Loans
                    </a></li>
                    
                </ul>

            </li>
           
  <li class="parent "><a data-toggle="collapse" href="#sub-item-8">
                <em class="fa fa-navicon">&nbsp;</em>Loan Report <span data-toggle="collapse" href="#sub-item-1" class="icon pull-right"><em class="fa fa-plus"></em></span>
                </a>
                <ul class="children collapse" id="sub-item-8">
                    <li><a class="" href="loan-datewise-reports.php">
                        <span class="fa fa-arrow-right">&nbsp;</span> Daywise Loans
                    </a></li>
                    <li><a class="" href="loan-monthwise-reports.php">
                        <span class="fa fa-arrow-right">&nbsp;</span> Monthwise Loans
                    </a></li>
                    <li><a class="" href="loan-yearwise-reports.php">
                        <span class="fa fa-arrow-right">&nbsp;</span> Yearwise Loans
                    </a></li>
                    
                </ul>
            </li>
			
			<li class="parent "><a data-toggle="collapse" href="#sub-item-5">
                <em class="fa fa-navicon">&nbsp;</em>Budgets <span data-toggle="collapse" href="#sub-item-1" class="icon pull-right"><em class="fa fa-plus"></em></span>
                </a>
                <ul class="children collapse" id="sub-item-5">
                    <li><a class="" href="add-budget.php">
                        <span class="fa fa-arrow-right">&nbsp;</span> Add Budgets
                    </a></li>
                    <li><a class="" href="manage-budget.php">
                        <span class="fa fa-arrow-right">&nbsp;</span> Manage Budgets
                    </a></li>
                    
                </ul>

            </li>
           
  <li class="parent "><a data-toggle="collapse" href="#sub-item-6">
                <em class="fa fa-navicon">&nbsp;</em>Budget Report <span data-toggle="collapse" href="#sub-item-1" class="icon pull-right"><em class="fa fa-plus"></em></span>
                </a>
                <ul class="children collapse" id="sub-item-6">
                    <li><a class="" href="budget-datewise-reports.php">
                        <span class="fa fa-arrow-right">&nbsp;</span> Daywise Budgets
                    </a></li>
                    <li><a class="" href="budget-monthwise-reports.php">
                        <span class="fa fa-arrow-right">&nbsp;</span> Monthwise Budgets
                    </a></li>
                    <li><a class="" href="budget-yearwise-reports.php">
                        <span class="fa fa-arrow-right">&nbsp;</span> Yearwise Budgets
                    </a></li>
                    
                </ul>
            </li>
			
			
			
	 <li><a href="savings.php"><em class="fa fa-navicon">&nbsp;</em> Savings</a></li>		
			

            <li><a href="user-profile.php"><em class="fa fa-user">&nbsp;</em> Profile</a></li>
             <li><a href="change-password.php"><em class="fa fa-clone">&nbsp;</em> Change Password</a></li>
<li><a href="logout.php"><em class="fa fa-power-off">&nbsp;</em> Logout</a></li>

        </ul>
    </div>