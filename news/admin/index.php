<?php
 session_start();

include('includes/config.php');

if(isset($_POST['login']))
  {
 
  
     $uname=$_POST['username'];
    $password=($_POST['password']);
  
$sql =mysqli_query($con,"SELECT AdminUserName,AdminEmailId,AdminPassword,userType FROM tbladmin WHERE (AdminUserName='$uname' && AdminPassword='$password')");
 $num=mysqli_fetch_array($sql);
if($num>0)
{

$_SESSION['login']=$_POST['username'];
$_SESSION['utype']=$num['userType'];
    echo "<script type='text/javascript'> document.location = 'dashboard.php'; </script>";
  }else{
echo "<script>alert('Đăng nhập thất bại');</script>";
  }
 
}
?>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="101 + News Station Portal.">
        <meta name="author" content="xyz">

        <title>Tin Tức</title>

        <link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="assets/css/core.css" rel="stylesheet" type="text/css" />
        <link href="assets/css/components.css" rel="stylesheet" type="text/css" />
        <link href="assets/css/icons.css" rel="stylesheet" type="text/css" />
        <link href="assets/css/pages.css" rel="stylesheet" type="text/css" />
        <link href="assets/css/menu.css" rel="stylesheet" type="text/css" />
        <link href="assets/css/responsive.css" rel="stylesheet" type="text/css" />

        <script src="assets/js/modernizr.min.js"></script>

    </head>

    
    <body class="bg-transparent">

        <section>
            <div class="container m-t-50">
                <div class="row align-items-center m-t-50">
                   <div style="" class="col-md-8 text-center">
                     
                    </div>



                        <div class="wrapper-page">
                        <div>
                    
                        <center><img style="width: 200px; height: 200px; margin-bottom: 20px" src="assets/images/logo1admin.png" width="auto">
                     
            
                          </div>
                                <div class="account-content">
                                    <form class="form-horizontal" method="post">
                                        <div class="form-group ">
                                            <div class="col-xs-12">
                                                <input class="form-control" type="text" required="" name="username" placeholder="Tên hoặc Email" autocomplete="off">
                                            </div>
                                        </div>
                                        

                                        <div class="form-group">
                                            <div class="col-xs-12">
                                                <input class="form-control" type="password" name="password" required="" placeholder="Mật khẩu" autocomplete="off">
                                            </div>
                                        </div>

                                        

                     
                                        <div class="form-group account-btn text-center m-t-10">
                                            <div class="col-xs-12">
                                                <button style="background-color:red" class="btn btn-custom waves-effect waves-light btn-md w-100" type="submit" name="login">Đăng nhập</button>
                                            </div>
                                        </div>

                                    </form>
                                
                            </div>
                      
                         


                    

                        </div>
                        

                    </div>
                </div>
            </div>
          </section>
      

        <script>
            var resizefunc = [];
        </script>

   
        <script src="assets/js/jquery.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
        <script src="assets/js/detect.js"></script>
        <script src="assets/js/fastclick.js"></script>
        <script src="assets/js/jquery.blockUI.js"></script>
        <script src="assets/js/waves.js"></script>
        <script src="assets/js/jquery.slimscroll.js"></script>
        <script src="assets/js/jquery.scrollTo.min.js"></script>

      
        <script src="assets/js/jquery.core.js"></script>
        <script src="assets/js/jquery.app.js"></script>

    </body>
</html>