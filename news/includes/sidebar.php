<div class="col-md-3 mt-5">
  
   <div class="card mb-4 border-0">
      <h5 class="card-header border-0 bg-white">Tìm kiếm</h5>
      <div class="card-body">
         <form name="search" action="search.php" method="post">
            <div class="input-group">
               <input type="text" name="searchtitle" class="form-control rounded-0" placeholder="Từ khóa..." required>
               <span class="input-group-btn">
               <button class="btn btn-secondary rounded-0" type="submit"><i class="fa fa-search"></i></button>
               </span>
         </form>
         </div>
      </div>
   </div>



   

   <div class="card my-4 border-0">
      <h5 class="card-header border-0 bg-white">Gần đây</h5>
      <div class="card-body">
         <ul class="mb-0 list-unstyled">
            <?php
               $query=mysqli_query($con,"select tblposts.id as pid,tblposts.PostImage,tblposts.PostTitle as posttitle from tblposts left join tblcategory on tblcategory.id=tblposts.CategoryId left join  tblsubcategory on  tblsubcategory.SubCategoryId=tblposts.SubCategoryId limit 8");
               while ($row=mysqli_fetch_array($query)) {
               
               ?>
            <li class="d-flex mb-2 align-items-center">
               <img class="mr-2 rounded-circle" src="admin/postimages/<?php echo htmlentities($row['PostImage']);?>" alt="<?php echo htmlentities($row['posttitle']);?>" width="50px" height="50px">
               <a href="news-details.php?nid=<?php echo htmlentities($row['pid'])?>" class="text-dark font-weight-bold"><?php echo htmlentities($row['posttitle']);?></a>
            </li>
            <?php } ?>
         </ul>
      </div>
   </div>
 




   <div class="card my-4 border-0">
      <h5 class="card-header border-0 bg-white">Xem nhiều</h5>
      <div class="card-body">
         <ul class="list-unstyled">
            <?php
               $query1=mysqli_query($con,"select tblposts.id as pid,tblposts.PostTitle as posttitle from tblposts left join tblcategory on tblcategory.id=tblposts.CategoryId left join  tblsubcategory on  tblsubcategory.SubCategoryId=tblposts.SubCategoryId  order by viewCounter desc limit 5");
               while ($result=mysqli_fetch_array($query1)) {
               
               ?>
            <li class="mb-2">
               <a href="news-details.php?nid=<?php echo htmlentities($result['pid'])?>" class="text-dark font-weight-bold"><?php echo htmlentities($result['posttitle']);?></a>
            </li>
            <?php } ?>
         </ul>
      </div>
   </div>
  



   <div class="card my-4 border-0">
      <h5 class="card-header border-0 bg-white">Xu hướng</h5>
      <div class="card-body">
         <ul class="mb-0 list-unstyled">
            <?php
               $query=mysqli_query($con,"select tblposts.id as pid,tblposts.PostImage,tblposts.PostTitle as posttitle from tblposts left join tblcategory on tblcategory.id=tblposts.CategoryId left join  tblsubcategory on  tblsubcategory.SubCategoryId=tblposts.SubCategoryId limit 8");
               while ($row=mysqli_fetch_array($query)) {
               
               ?>
            <li class="d-flex mb-2 align-items-center">
               <img class="mr-2 rounded" src="admin/postimages/<?php echo htmlentities($row['PostImage']);?>" alt="<?php echo htmlentities($row['posttitle']);?>" width="50px" height="50px">
               <a href="news-details.php?nid=<?php echo htmlentities($row['pid'])?>" class="text-dark font-weight-bold"><?php echo htmlentities($row['posttitle']);?></a>
            </li>
            <?php } ?>
         </ul>
      </div>
   </div>



   
   <h5 class="card-header border-0 bg-transparent">Quảng cáo</h5>
   <div class="card my-4 border-0">
      <div class="card-body p-2">
        <img  width="100%" height="180px" src="images/quangcao1.png" alt="">
      </div>
   </div>
   <div class="card my-4 border-0">
      <div class="card-body p-2">
      <img  width="100%" height="180px" src="images/quangcao2.jpg" alt="">
      </div>
   </div>
   <div class="card my-4 border-0">
      <div class="card-body p-2">
      <img  width="100%" height="180px" src="images/quangcao4.jpg" alt="">
      </div>
   </div>
   <div class="card my-4 border-0">
      <div class="card-body p-2">
      <img  width="100%" height="180px" src="images/quangcao3.jpg" alt="">
      </div>
   </div>
   <div class="card my-4 border-0">
      <div class="card-body p-2">
      <img  width="100%" height="180px" src="images/quangcao5.jpg" alt="">
      </div>
   </div>
</div>