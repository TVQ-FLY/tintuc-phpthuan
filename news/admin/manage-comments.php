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
    $query=mysqli_query($con,"delete from  tblcomments  where id='$id'");
    $delmsg="Thành công";
   }
   
   ?>

<?php include('includes/topheader.php');?>
>
<?php include('includes/leftsidebar.php');?>

<div class="content-page">

<div class="content">
<div class="container">
   <div class="row">
      <div class="col-xs-12">
         <div class="page-title-box">
            <h4 class="page-title">Xóa bình luận</h4>
            <ol class="breadcrumb p-0 m-0">
               <li>
                  <a href="#">Admin</a>
               </li>
               <li>
                  <a href="#">Bình luận </a>
               </li>
               <li class="active">
                  Xóa bình luận
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
                  <table class="table m-0 table-bordered"  id="example">
                     <thead>
                        <tr>
                           <th>Stt</th>
                           <th> Tên </th>
                           <th>Email</th>
                           <th>Nội dung bình luận</th>
                           <th>Tin tức</th>
                           <th>Ngày nhận</th>
                           <th>Xóa</th>
                        </tr>
                     </thead>
                     <tbody>
                        <?php 
                           $query=mysqli_query($con,"Select tblcomments.id,  tblcomments.name,tblcomments.email,tblcomments.postingDate,tblcomments.comment,tblposts.id as postid,tblposts.PostTitle from  tblcomments join tblposts on tblposts.id=tblcomments.postId where tblcomments.status=1");
                           $cnt=1;
                           while($row=mysqli_fetch_array($query))
                           {
                           ?>
                        <tr>
                           <th scope="row"><?php echo htmlentities($cnt);?></th>
                           <td><?php echo htmlentities($row['name']);?></td>
                           <td><?php echo htmlentities($row['email']);?></td>
                           <td><?php echo htmlentities($row['comment']);?></td>
                           <td><?php echo htmlentities($row['PostTitle']);?></a> </td>
                           <td><?php echo htmlentities($row['postingDate']);?></td>
                           
                           <td width="100px">
                             <a href="manage-comments.php?rid=<?php echo htmlentities($row['id']);?>&&action=del" class="btn btn-danger btn-sm"> <i class="fa fa-trash-o"></i></a> 
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

<?php include('includes/footer.php');?>
 
<?php } ?>