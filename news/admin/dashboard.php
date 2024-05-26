<?php
   session_start();
   include('includes/config.php');
   error_reporting(0);
   if(strlen($_SESSION['login'])==0)
     { 
   header('location:index.php');
   }
   else{
       ?>
<?php include('includes/topheader.php');?>
<script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>

<?php include('includes/leftsidebar.php');?>

<div class="content-page">
  
   <div class="content">
      <div class="container">
         <div class="row">
            <div class="col-xs-12">
               <div class="page-title-box">
                  <h4 class="page-title">Bảng điều khiển</h4>
                  <ol class="breadcrumb p-0 m-0">
                    
                     <li>
                        <a href="#">Admin</a>
                     </li>
                     <li class="active">
                        Bảng điều khiển
                     </li>
                  </ol>
                  <div class="clearfix"></div>
               </div>
            </div>
         </div>
       
         <div class="row">
            <div class="col-md-4">
               <div class="card-box h-100" style ="height:320px">
                  <div class="card-header">
                     <h2 class="card-title mb-2">Xin chào</h2>
                    
                  </div>
                  <br><br>

                  <div class="card-body">
                     <div class="row ">
                       
                        <div class="col-md-6">
                           <img src="assets/images/prize-light.png" width="140" height="150" class="rounded-start">
                        </div>
                     </div>
                  </div>
               </div>
            </div>
            <div class="col-md-4">
               <div class="card-box h-100" style ="height:320px">
                  <div class="card-body">
                     <div class="row ">
                        <div class="card-header">
                           <h4 class="card-title m-0">Màu sắc</h4>
                        </div>
                        <div id="chart">
                           <apexchart type="radialBar" height="265" :options="chartOptions" :series="series"></apexchart>
                        </div>
                     </div>
                  </div>
               </div>
            </div>


            <a href="manage-categories.php">
               <div class="col-lg-2 col-md-2 col-sm-6">
                  <div class="card-box widget-box-one text-center" style ="height:140px">
                     <i class="mdi mdi-chart-areaspline widget-one-icon"></i>
                     <div class="wigdet-one-content">
                        <p class="m-0 text-secondary" title="Statistics">Thể loại</p>
                        
                     </div>
                  </div>
               </div>
            </a>
            

            <a href="manage-subcategories.php">
               <div class="col-lg-2 col-md-2 col-sm-6">
                  <div class="card-box widget-box-one text-center" style ="height:140px">
                     <i class="mdi mdi-layers widget-one-icon"></i>
                     <div class="wigdet-one-content">
                        <p class="m-0 text-secondary" title="User This Month">Thể loại phụ</p>
                        
                     </div>
                  </div>
               </div>
            </a>


            <a href="manage-posts.php">
               <div class="col-lg-4 col-md-4 col-sm-6">
                  <div class="card-box widget-box-one text-center" style ="height:160px">
                     <i class="mdi mdi-layers widget-one-icon"></i>
                     <div class="wigdet-one-content">
                        <p class="m-0 text-secondary" title="User This Month">Tin tức</p>
                        
                     </div>
                  </div>
               </div>
            </a>
         </div>
         




        
            </div>
         </div>
      </div>
      
   </div>
   
   <?php include('includes/footer.php');?>

</div>
</div>





<script>
   var options = {
     series: [44, 55, 67],
     chart: {
     height: 265,
     type: 'radialBar',
   },
   plotOptions: {
     radialBar: {
       dataLabels: {
         name: {
           fontSize: '40px',
         },
         value: {
           fontSize: '16px',
         },
         total: {
           show: true,
           label: 'Màu sắc',
           formatter: function (w) {
             
             return 249
           }
         }
       }
     }
   },
   labels: ['Xanh', 'Lục', 'Vàng'],
   };
   
   var chart = new ApexCharts(document.querySelector("#chart"), options);
   chart.render();

</script>
<?php } ?>