<?php
   session_start();
   include('includes/config.php');
   error_reporting(0);
   if(strlen($_SESSION['login'])==0)
     { 
   header('location:index.php');
   }
   else{
   if(isset($_POST['submit']))
   {
   $catid=intval($_GET['cid']);
   $category=$_POST['category'];
   $description=$_POST['description'];
   $query=mysqli_query($con,"Update  tblcategory set CategoryName='$category',Description='$description' where id='$catid'");
   if($query)
   {
   $msg="Thành công ";
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
                           <h4 class="page-title">Sửa thể loại</h4>
                           <ol class="breadcrumb p-0 m-0">
                              <li>
                                 <a href="#">Admin</a>
                              </li>
                              <li>
                                 <a href="#">Thể loại </a>
                              </li>
                              <li class="active">
                                 Sửa thể loại
                              </li>
                           </ol>
                           <div class="clearfix"></div>
                        </div>
                     </div>
                  </div>
                
                  <div class="row">
                     <div class="col-sm-12">
                        <div class="card-box">
                           <h4 class="m-t-0 header-title"><b>Sửa thể loại</b></h4>
                           <hr />
                           <div class="row">
                              <div class="col-sm-6">
                          
                                 <?php if($msg){ ?>
                                 <div class="alert alert-success" role="alert">
                                    <strong>Sửa thành công</strong>
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
                              $catid=intval($_GET['cid']);
                              $query=mysqli_query($con,"Select id,CategoryName,Description,PostingDate,UpdationDate from  tblcategory where Is_Active=1 and id='$catid'");
                              $cnt=1;
                              while($row=mysqli_fetch_array($query))
                              {
                              ?>
                                 <form class="row" name="category" method="post">
                                    <div class="form-group col-md-6">
                                       <label class="control-label">Tên thể loại</label>
                                          <input type="text" class="form-control" value="<?php echo htmlentities($row['CategoryName']);?>" name="category" required>
                                    </div>
                                    <div class="form-group col-md-6">
                                       <label class="control-label">Mô tả</label>
                                          <textarea class="form-control" rows="5" name="description" required><?php echo htmlentities($row['Description']);?></textarea>
                                    </div>
                                    <?php } ?>
                                    <div class="form-group col-md-12">
                                          <button type="submit" class="btn btn-custom waves-effect waves-light btn-md" name="submit">
                                          Cập nhật
                                          </button>
                                    </div>
                                 </form>
                        </div>
                     </div>
                  </div>
                 
               </div>
              
            </div>
           
            <?php include('includes/footer.php');?>
         
<?php } ?>