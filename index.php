<?php
include 'include/koneksi.php';
con_db();
$query = "SELECT * FROM  `iklan`  WHERE status='1' ORDER BY tgl_iklan DESC";
$result = mysql_query($query);  
?>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Home</title>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
    <link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">
    <style>
        .background{
            background: url('include/img/background.jpg')no-repeat #ECF0F5;
            -webkit-background-size: 100%;
            -moz-background-size: 100%;
            background-size: 100%;
        }
    </style>    
  </head>
  <body class="hold-transition skin-blue layout-top-nav">
    <div class="wrapper">
      <header class="main-header">
        <nav class="navbar navbar-static-top">
          <div class="container">
            <div class="navbar-header">
              <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse">
                <i class="fa fa-bars"></i>
              </button>
                    <a class="navbar-brand" rel="home" href="index.php" >
                        <img style="max-width:50px; margin-top: -15px;" src="include/img/logo.jpg">
                    </a>                
            </div>
            <div class="collapse navbar-collapse pull-left" id="navbar-collapse">
              <ul class="nav navbar-nav">
                  <li class="dropdown">
                      <a href="#" class="glyphicon glyphicon-user dropdown-toggle" data-toggle="dropdown">  TUTORIAL <span class="caret"></span></a>
                      <ul class="dropdown-menu" role="menu">
                          <li><a href="tutorial/photoshop.php" class="fa   fa-file">  Photoshop</a></li>
                          <li><a href="tutorial/corel_draw.php" class="fa  fa-lock">  Corel Draw</a></li>
                      </ul>
                  </li>
              </ul>
            </div>  
            <div class="collapse navbar-collapse pull-left" id="navbar-collapse">
              <ul class="nav navbar-nav">
                  <li><a href="profil.php" class="glyphicon glyphicon-phone-alt">  PROFIL</a></li>
              </ul>
            </div>               
            <div class="navbar-custom-menu">
              <ul class="nav navbar-nav">
                  <li>
                      <a href="user/registrasi.php" class="glyphicon glyphicon-plus-sign">  Daftar</a>
                  </li>                  
                  <li>
                      <a href="login.php" class="glyphicon glyphicon-log-in">  Masuk</a>
                  </li>                  
              </ul>
            </div>
          </div>
        </nav>
      </header>
      <div class="content-wrapper background">
        <div class="container">
          <section class="content-header">
            <h1></h1>
          </section>
          <section class="content">
              <div class="row">
                  <?php
                  while ($row = mysql_fetch_array($result)) {
                  ?>
                <div class="col-md-6">
                  <div class="box box-widget">
                    <div class='box-header with-border'>
                      <div class='user-block'>
                        <img class='img-circle' src='dist/img/user1-128x128.jpg' alt='user image'>
                        <span class='username'><a href="#"><?php echo $row['judul_iklan']; ?></a></span>
                        <span class='description'>Admin : <?php echo $row['tgl_iklan']; ?></span>
                      </div>
                    </div><!-- /.box-header -->
                    <div class='box-body'>                        
                    <p style="text-align:justify"><?php echo $row['isi_iklan']; ?> </p>
                        <br>
                        <?php echo "Rp.".$row['harga_lelang']; ?>
                        <br>
                        <img class='img-thumbnail' src='file/<?php echo $row['file_iklan']; ?>' alt='deskripsi barang'>
                        <br>
                        <br>                
                    </div>
                    
                    <?php
                     $que = "SELECT * FROM  `komentar` WHERE id_iklan ='".$row['id_iklan']."' ORDER BY id_komentar ASC ";
                     $res =  mysql_query($que);
                     $queryBid = "SELECT id_lelang, id_user, id_iklan, MAX(harga) as harga, time_bid, MAX(jam) as jam FROM `lelang` WHERE id_iklan = '".$row['id_iklan']."' GROUP BY id_user ORDER BY harga DESC";
                     $queryFirstBid = "SELECT MAX(harga) as harga FROM `lelang` WHERE id_iklan = '".$row['id_iklan']."' LIMIT 1";
                     $resBid = mysql_query($queryBid);
                     $firstBid = mysql_query($queryFirstBid);
                     $firstElement = mysql_fetch_array($firstBid);
                    while ($ro = mysql_fetch_array($resBid)) {
                    ?>

                    <div class='box-footer box-comments'>
                      <div class='box-comment'>
                        <img class='img-circle' src='dist/img/user1-128x128.jpg' alt='user image'>
                        <div class='comment-text'>
                          <span class="username">
                            <?php
                            $nama = mysql_fetch_array(mysql_query("SELECT * FROM `user` WHERE id_user='".$ro['id_user']."'"));
                            echo $nama['nama'];
                            ?>
                            <span class='text-muted pull-right'><?php echo $ro['time_bid']." ".$ro['jam']; ?></span>
                          </span>
                            <?php echo "Rp.".number_format($ro['harga'],0); ?>
                        </div><!-- /.comment-text -->
                      </div>
                    </div>                    
                    <?php } ?>      
                    <div class="box-footer">
                        <form action="user/ajax.php" method="POST">
                            <div class="input-group input-group-sm">
                                <input type="hidden" name='id_user' value="<?php echo $id_user; ?>">
                                <input type="hidden" name='id_iklan' value="<?php echo $row['id_iklan']; ?>">
                            </div>
                        </form>
                    </div><!-- /.box-footer -->
                  </div><!-- /.box -->
                </div><!-- /.col -->  
                
                <?php } ?>
              </div>
          </section>          
            
        </div><!-- /.container -->
      </div><!-- /.content-wrapper -->
      <footer class="main-footer">
        <div class="container">
          <div class="pull-right hidden-xs">
          </div>
          <strong>Copyright &copy; <a href="#"> Helen Indah</a></strong>
        </div><!-- /.container -->
      </footer>
    </div>
    <script src="plugins/jQuery/jQuery-2.1.4.min.js"></script>
    <script src="bootstrap/js/jquery-ui.min.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <script src="dist/js/app.min.js"></script>
  </body>
</html>
