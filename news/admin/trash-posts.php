<?php 
   session_start();
   include('includes/config.php');
   error_reporting(0);
   if(strlen($_SESSION['login'])==0)
     { 
   header('location:index.php');
   }
   else{
   
   if($_GET['action']='restore')
   {
   $postid=intval($_GET['pid']);
   $query=mysqli_query($con,"update tblposts set Is_Active=1 where id='$postid'");
   if($query)
   {
   $msg="Thành công ";
   }
   else{
   $error="Thất bại";    
   } 
   }
   
   

   if($_GET['presid'])
   {
       $id=intval($_GET['presid']);
       $query=mysqli_query($con,"delete from  tblposts  where id='$id'");
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
                        <h4 class="page-title">Khôi phục tin tức </h4>
                        <ol class="breadcrumb p-0 m-0">
                           <li>
                              <a href="#">Admin</a>
                           </li>
                           <li>
                              <a href="#">Tin tức</a>
                           </li>
                           <li class="active">
                              Khôi phục 
                           </li>
                        </ol>
                        <div class="clearfix"></div>
                     </div>
                  </div>
               </div>
     



               <div class="row">
                  <div class="col-sm-6">
                     <?php if($delmsg){ ?>
                     <div class="alert alert-danger" role="alert">
                        <strong>Bài viết đã bị xóa vĩnh viễn</strong>
                     </div>
                     <?php } ?>
                  </div>
                  <div class="row">
                     <div class="col-sm-12">
                        <div class="card-box">
                           <div class="table-responsive">
                              <table class="table table-bordered  m-0" id="example">
                                 <thead>
                                    <tr>
                                       <th>Tin tức</th>
                                       <th>Thể loại</th>
                                       <th>Thể loại phụ</th>
                                       <th>Khôi phục hoặc xóa vĩnh viễn</th>
                                    </tr>
                                 </thead>
                                 <tbody>
                                    <?php
                                       $query=mysqli_query($con,"select tblposts.id as postid,tblposts.PostTitle as title,tblcategory.CategoryName as category,tblsubcategory.Subcategory as subcategory from tblposts left join tblcategory on tblcategory.id=tblposts.CategoryId left join tblsubcategory on tblsubcategory.SubCategoryId=tblposts.SubCategoryId where tblposts.Is_Active=0");
                                       $rowcount=mysqli_num_rows($query);
                                       if($rowcount==0)
                                       {
                                       ?>
                                    <tr>
                                       <td colspan="4" align="center">
                                          <h3 style="color:red">Trống</h3>
                                       </td>
                                    <tr>
                                       <?php 
                                          } else {
                                          while($row=mysqli_fetch_array($query))
                                          {
                                          ?>
                                    <tr>
                                       <td><b><?php echo htmlentities($row['title']);?></b></td>
                                       <td><?php echo htmlentities($row['category'])?></td>
                                       <td><?php echo htmlentities($row['subcategory'])?></td>
                                       <td>
                                          <a href="trash-posts.php?pid=<?php echo htmlentities($row['postid']);?>&&action=restore" onclick="return confirm('Bạn muốn khôi phục?')"> <i class="ion-arrow-return-right" title="Restore this Post"></i></a>
                                          &nbsp;
                                          <a href="trash-posts.php?presid=<?php echo htmlentities($row['postid']);?>&&action=perdel" onclick="return confirm('Bạn muốn xóa vĩnh viễn?')"><i class="fa fa-trash-o" style="color: #f05050" title="Permanently delete this post"></i></a> 
                                       </td>
                                    </tr>
                                    <?php } }?>
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