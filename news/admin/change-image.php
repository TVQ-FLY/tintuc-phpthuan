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
   
   $imgfile=$_FILES["postimage"]["name"];
   
   $extension = substr($imgfile,strlen($imgfile)-4,strlen($imgfile));
   
   $allowed_extensions = array(".jpg","jpeg",".png",".gif");
   
   if(!in_array($extension,$allowed_extensions))
   {
   echo "<script>alert('Invalid format. Only jpg / jpeg/ png /gif format allowed');</script>";
   }
   else
   {
  
   $imgnewfile=($imgfile).$extension;
   
   move_uploaded_file($_FILES["postimage"]["tmp_name"],"postimages/".$imgnewfile);
   
   
   
   $postid=intval($_GET['pid']);
   $query=mysqli_query($con,"update tblposts set PostImage='$imgnewfile' where id='$postid'");
   if($query)
   {
   $msg="Thành công ";
   }
   else{
   $error="Thất bại";    
   } 
   }
   }
   ?>


<?php include('includes/topheader.php');?>
<script>
   function getSubCat(val) {
     $.ajax({
     type: "POST",
     url: "get_subcategory.php",
     data:'catid='+val,
     success: function(data){
       $("#subcategory").html(data);
     }
     });
     }
     
</script>

<?php include('includes/leftsidebar.php');?>

<div class="content-page">

<div class="content">
   <div class="container">
      <div class="row">
         <div class="col-xs-12">
            <div class="page-title-box">
               <h4 class="page-title">Đổi ảnh đại diện </h4>
               <ol class="breadcrumb p-0 m-0">
                  <li>
                     <a href="#">Admin</a>
                  </li>
                  <li>
                     <a href="#"> Tin tức </a>
                  </li>
                  <li>
                     <a href="#"> Sửa và xóa </a>
                  </li>
                  <li class="active">
                     Đổi ảnh đại diện
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
               <strong>Đổi thành công</strong>
            </div>
            <?php } ?>
           
            <?php if($error){ ?>
            <div class="alert alert-danger" role="alert">
               <strong>Thất bại</strong> 
            </div>
            <?php } ?>
         </div>
      </div>
      <form name="addpost" method="post" enctype="multipart/form-data">
         <?php
            $postid=intval($_GET['pid']);
            $query=mysqli_query($con,"select PostImage,PostTitle from tblposts where id='$postid' and Is_Active=1 ");
            while($row=mysqli_fetch_array($query))
            {
            ?>
         <div class="row">
            <div class="col-md-10 col-md-offset-1">
               <div class="p-6">
                  <div class="">
      <form name="addpost" method="post">
      <div class="form-group m-b-20">
      <label for="exampleInputEmail1">Tên tin tức</label>
      <input type="text" class="form-control" id="posttitle" value="<?php echo htmlentities($row['PostTitle']);?>" name="posttitle"  readonly>
      </div>
      <div class="row">
      <div class="col-sm-12">
      <div class="card-box">
      <h4 class="m-b-30 m-t-0 header-title"><b>Ảnh hiện tại</b></h4>
      <img src="postimages/<?php echo htmlentities($row['PostImage']);?>" width="300"/>
      <br />
      </div>
      </div>
      </div>
      <?php } ?>
      <div class="row">
      <div class="col-sm-12">
      <div class="card-box">
      <h4 class="m-b-30 m-t-0 header-title"><b>Ảnh mới</b></h4>
      <input type="file" class="form-control" id="postimage" name="postimage"  required>
      </div>
      </div>
      </div>
      <button type="submit" name="update" class="btn btn-success waves-effect waves-light">Lưu </button>
      </form>
      </div>
      </div> 
      </div> 
      </div>
    
   </div>
 
</div>

<?php include('includes/footer.php');?>
  
<?php } ?>