<?php
   session_start();
   include('includes/config.php');
   error_reporting(0);
   if(strlen($_SESSION['login'])==0)
     { 
   header('location:index.php');
   }
   else{
   if(isset($_POST['submitsubcat']))
   {
   $categoryid=$_POST['category'];
   $subcatname=$_POST['subcategory'];
   $subcatdescription=$_POST['sucatdescription'];
   $status=1;
   $query=mysqli_query($con,"insert into tblsubcategory(CategoryId,Subcategory,SubCatDescription,Is_Active) values('$categoryid','$subcatname','$subcatdescription','$status')");
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
                           <h4 class="page-title">Thêm thể loại phụ</h4>
                           <ol class="breadcrumb p-0 m-0">
                              <li>
                                 <a href="#">Admin</a>
                              </li>
                              <li>
                                 <a href="#">Thể loại phụ </a>
                              </li>
                              <li class="active">
                                 Thêm thể loại phụ
                              </li>
                           </ol>
                           <div class="clearfix"></div>
                        </div>
                     </div>
                  </div>
              


                  <div class="row">
                     <div class="col-sm-12">
                        <div class="card-box">
                           <h4 class="m-t-0 header-title"><b>Thêm thể loại phụ </b></h4>
                           <hr>
                           <div class="row">
                              <div class="col-sm-6">
                              
                                 <?php if($msg){ ?>
                                 <div class="alert alert-success" role="alert">
                                    <strong>Thêm thành công</strong> 
                                 </div>
                                 <?php } ?>
                                
                                 <?php if($error){ ?>
                                 <div class="alert alert-danger" role="alert">
                                    <strong>Thất bại</strong> 
                                 </div>
                                 <?php } ?>
                              </div>
                           </div>
                                 <form class="row" name="category" method="post">
                                    <div class="form-group col-md-6">
                                       <label class="control-label">Thể loại chính</label>
                                          <select class="form-control" name="category" required>
                                             <option value="">Chọn thể loại chính </option>
                                             <?php
                                           
                                                $ret=mysqli_query($con,"select id,CategoryName from  tblcategory where Is_Active=1");
                                                while($result=mysqli_fetch_array($ret))
                                                {    
                                                ?>
                                             <option value="<?php echo htmlentities($result['id']);?>"><?php echo htmlentities($result['CategoryName']);?></option>
                                             <?php } ?>
                                          </select>
                                    </div>
                                    <div class="form-group col-md-6">
                                       <label class="control-label">Tên thể loại phụ</label>
                                          <input type="text" class="form-control" value="" name="subcategory" required>
                                    </div>
                                    <div class="form-group col-md-6">
                                       <label class="control-label">Mô tả</label>
                                          <textarea class="form-control" rows="5" name="sucatdescription" required></textarea>
                                    </div>
                                    <div class="form-group col-md-12">
                                          <button type="submit" class="btn btn-custom waves-effect waves-light btn-md" name="submitsubcat">
                                          Thêm
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