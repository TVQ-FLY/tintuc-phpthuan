<?php 
session_start();
include('includes/config.php');
error_reporting(0);
if(strlen($_SESSION['login'])==0)
  { 
header('location:index.php');
}
else{
if(isset($_POST['update']))
{
$pagetype='aboutus';
$pagetitle=$_POST['pagetitle'];
$pagedetails=$_POST['pagedescription'];

$query=mysqli_query($con,"update tblpages set PageTitle='$pagetitle',Description='$pagedetails' where PageName='$pagetype' ");
if($query)
{
$msg="Thành công";
}
else{
$error="Thất bại";    
} 

}
?>

           <?php include('includes/topheader.php');?>
          
             <?php include('includes/leftsidebar.php');?>
           



            
            <div class="content-page">
               
                <div class="content">
                    <div class="container">


                        <div class="row">
                            <div class="col-xs-12">
                                <div class="page-title-box">
                                    <h4 class="page-title">Cập nhật thông tin giới thiệu</h4>
                                    <ol class="breadcrumb p-0 m-0">
                                        <li>
                                            <a href="#">Cập nhật</a>
                                        </li>
                                     
                                        <li class="active">
                                         Thông tin giới thiệu
                                        </li>
                                    </ol>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                        </div>
                       

<div class="row">
<div class="col-sm-6">  

<?php if($msg){ ?>
<div class="alert alert-success" role="alert">
<strong>Cập nhật thành công</strong> 
</div>
<?php } ?>


<?php if($error){ ?>
<div class="alert alert-danger" role="alert">
<strong>Thất bại</strong> 
</div>
<?php } ?>


</div>
</div>
<?php 
$pagetype='aboutus';
$query=mysqli_query($con,"select PageTitle,Description from tblpages where PageName='$pagetype'");
while($row=mysqli_fetch_array($query))
{

?>

                        <div class="row">
                            <div class="col-md-10 col-md-offset-1">
                                <div class="p-6">
                                    <div class="">
                                        <form name="aboutus" method="post">
 <div class="form-group m-b-20">
<label for="exampleInputEmail1">Tiêu đề</label>
<input type="text" class="form-control" id="pagetitle" name="pagetitle" value="<?php echo htmlentities($row['PageTitle'])?>"  required>
</div>





         

     <div class="row">
<div class="col-sm-12">
 <div class="card-box">
<h4 class="m-b-30 m-t-0 header-title"><b>Chi tiết</b></h4>
<textarea class="summernote" name="pagedescription"  required><?php echo htmlentities($row['Description'])?></textarea>
</div>
</div>
</div>
<?php } ?>

<button type="submit" name="update" class="btn btn-custom waves-effect waves-light btn-md">Cập nhật</button>

                                        </form>
                                    </div>
                                </div> 
                            </div> 
                        </div>
                      



                    </div>

                </div> 

           <?php include('includes/footer.php');?>

<?php } ?>