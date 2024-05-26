<?php
   session_start();
   include('includes/config.php');
   error_reporting(0);
   if(strlen($_SESSION['login'])==0)
     { 
   header('location:index.php');
   }
   else{
   if($_GET['action']=='del' && $_GET['rid'])
   {
    $id=intval($_GET['rid']);
    $query=mysqli_query($con,"delete from  tblcategory  where id='$id'");
    $delmsg="Thành công";
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
                        <h4 class="page-title">Sửa và xóa thể loại</h4>
                        <ol class="breadcrumb p-0 m-0">
                           <li>
                              <a href="#">Admin</a>
                           </li>
                           <li>
                              <a href="#">Thể loại </a>
                           </li>
                           <li class="active">
                              Sửa và xóa thể loại
                           </li>
                        </ol>
                        <div class="clearfix"></div>
                     </div>
                  </div>
               </div>
      



               <div class="row">
                  <div class="col-sm-6">
                     <?php if($msg){ ?>
                     <div class="alert alert-danger" role="alert">
                        <strong>Thất bại</strong> 
                     <?php } ?>
                     <?php if($delmsg){ ?>
                        <div class="alert alert-success" role="alert">
                        <strong>Xóa thành công</strong>
                     </div>
                     <?php } ?>
                  </div>
                  <div class="row">
                     <div class="col-md-12">
                        <div class="demo-box m-t-20">
                           <div class="table-responsive">
                              <table class="table m-0 table-bordered" id="example">
                                 <thead>
                                    <tr>
                                       <th>Stt</th>
                                       <th>Thể loại</th>
                                       <th>Mô tả</th>
                                       <th>Ngày đăng</th>
                                       <th>Ngày sửa</th>
                                       <th>Sửa hoặc Xóa</th>
                                    </tr>
                                 </thead>
                                 <tbody>
                                    <?php 
                                       $query=mysqli_query($con,"Select id,CategoryName,Description,PostingDate,UpdationDate from  tblcategory where Is_Active=1");
                                       $cnt=1;
                                       while($row=mysqli_fetch_array($query))
                                       {
                                       ?>
                                    <tr>
                                       <th scope="row"><?php echo htmlentities($cnt);?></th>
                                       <td><?php echo htmlentities($row['CategoryName']);?></td>
                                       <td><?php echo htmlentities($row['Description']);?></td>
                                       <td><?php echo htmlentities($row['PostingDate']);?></td>
                                       <td><?php echo htmlentities($row['UpdationDate']);?></td>
                                       <td><a class="btn btn-primary btn-sm" href="edit-category.php?cid=<?php echo htmlentities($row['id']);?>"><i class="fa fa-pencil"></i></a> 
                                          &nbsp;<a class="btn btn-danger btn-sm" href="manage-categories.php?rid=<?php echo htmlentities($row['id']);?>&&action=del"> <i class="fa fa-trash-o"></i></a> 
                                       </td>
                                    </tr>
                                    <?php
                                       $cnt++;
                                        } ?>
                                 </tbody>
                              </table>
                           </div>
                        </div>
                     </div>
                  </div>
                  
                  
               </div>
        
            </div>
         
            <?php include('includes/footer.php');?>
 
         
  
<?php } ?>