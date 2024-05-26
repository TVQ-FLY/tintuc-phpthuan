<?php 
   session_start();
   include('includes/config.php');
   error_reporting(0);
   if(strlen($_SESSION['login'])==0)
     { 
   header('location:index.php');
   }
   else{
   
   if($_GET['action']='del')
   {
   $postid=intval($_GET['pid']);
   $query=mysqli_query($con,"update tblposts set Is_Active=0 where id='$postid'");
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
               <h4 class="page-title">Sửa và xóa tin tức</h4>
               <ol class="breadcrumb p-0 m-0">
                  <li>
                     <a href="#">Admin</a>
                  </li>
                  <li>
                     <a href="#">Tin tức</a>
                  </li>
                  <li class="active">
                     Sửa và xóa tin tức  
                  </li>
               </ol>
               <div class="clearfix"></div>
            </div>
         </div>
      </div>
 



      <div class="row">
         <div class="col-sm-12">
            <div class="card-box">
               <div class="table-responsive">
                  <table class="table table-bordered" id="example">
                     <thead>
                        <tr>
                           <th>Tên tin tức</th>
                           <th>Thể loại</th>
                           <th>Thể loại phụ</th>
                           <th>Sửa hoặc Xóa</th>
                        </tr>
                     </thead>
                     <tbody>
                        <?php
                           $query=mysqli_query($con,"select tblposts.id as postid,tblposts.PostTitle as title,tblcategory.CategoryName as category,tblsubcategory.Subcategory as subcategory from tblposts left join tblcategory on tblcategory.id=tblposts.CategoryId left join tblsubcategory on tblsubcategory.SubCategoryId=tblposts.SubCategoryId where tblposts.Is_Active=1 ");
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
                           <td><?php echo htmlentities($row['title']);?></td>
                           <td><?php echo htmlentities($row['category'])?></td>
                           <td><?php echo htmlentities($row['subcategory'])?></td>
                           <td><a  class="btn btn-primary btn-sm" href="edit-post.php?pid=<?php echo htmlentities($row['postid']);?>"><i class="fa fa-pencil"></i></a> 
                              &nbsp;<a class="btn btn-danger btn-sm" href="manage-posts.php?pid=<?php echo htmlentities($row['postid']);?>&&action=del" onclick="return confirm('Bạn muốn xóa?')"> <i class="fa fa-trash-o"></i></a> 
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