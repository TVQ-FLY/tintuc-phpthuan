<?php
   session_start();
   include('includes/config.php');
   error_reporting(0);
   if(strlen($_SESSION['login'])==0)
     { 
   header('location:index.php');
   }
   else{
   if($_GET['action']=='del' && $_GET['scid'])
   {
    $id=intval($_GET['scid']);
    $query=mysqli_query($con,"delete from   tblsubcategory  where SubCategoryId='$id'");
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
                        <h4 class="page-title">Sửa và xóa thể loại phụ</h4>
                        <ol class="breadcrumb p-0 m-0">
                           <li>
                              <a href="#">Admin</a>
                           </li>
                           <li>
                              <a href="#">Thể loại phụ</a>
                           </li>
                           <li class="active">
                              Sửa và xóa thể loại phụ
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
                     </div>
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
                                       <th>Thể loại chính</th>
                                       <th>Thể loại phụ</th>
                                       <th>Mô tả</th>
                                       <th>Ngày đăng</th>
                                       <th>Ngày sửa</th>
                                       <th>Sửa hoặc Xóa</th>
                                    </tr>
                                 </thead>
                                 <tbody>
                                    <?php 
                                       $query=mysqli_query($con,"Select tblcategory.CategoryName as catname,tblsubcategory.Subcategory as subcatname,tblsubcategory.SubCatDescription as SubCatDescription,tblsubcategory.PostingDate as subcatpostingdate,tblsubcategory.UpdationDate as subcatupdationdate,tblsubcategory.SubCategoryId as subcatid from tblsubcategory join tblcategory on tblsubcategory.CategoryId=tblcategory.id where tblsubcategory.Is_Active=1");
                                       $cnt=1;
                                       $rowcount=mysqli_num_rows($query);
                                       if($rowcount==0)
                                       {
                                       ?>
                                    <tr>
                                       <td colspan="7" align="center">
                                          <h3 style="color:red">Trống</h3>
                                       </td>
                                    <tr>
                                       <?php 
                                          } else {
                                          
                                          while($row=mysqli_fetch_array($query))
                                          {
                                          ?>
                                    <tr>
                                       <th scope="row"><?php echo htmlentities($cnt);?></th>
                                       <td><?php echo htmlentities($row['catname']);?></td>
                                       <td><?php echo htmlentities($row['subcatname']);?></td>
                                       <td><?php echo htmlentities($row['SubCatDescription']);?></td>
                                       <td><?php echo htmlentities($row['subcatpostingdate']);?></td>
                                       <td><?php echo htmlentities($row['subcatupdationdate']);?></td>
                                       <td><a href="edit-subcategory.php?scid=<?php echo htmlentities($row['subcatid']);?>"  class="btn btn-primary btn-sm"><i class="fa fa-pencil"></i></a> 
                                          &nbsp;<a href="manage-subcategories.php?scid=<?php echo htmlentities($row['subcatid']);?>&&action=del" class="btn btn-danger btn-sm"> <i class="fa fa-trash-o"></i></a> 
                                       </td>
                                    </tr>
                                    <?php
                                       $cnt++;
                                        }} ?>
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