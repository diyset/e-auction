<html>
    <head>
        <?php
        include 'session.php';
        $query = "SELECT * FROM  `iklan` WHERE id_user='$id_user' AND status='1' ORDER BY tgl_iklan DESC";
        $result = mysql_query($query);
        
        include 'css.php';        
        ?>     
    </head>
    
    <body class="hold-transition skin-blue layout-top-nav">
        <div class="wrapper">
            <?php include 'menu.php';
            ?>
            <!-- mulai nulis isinya -->
      <div class="content-wrapper">
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
                        <img class='img-circle' src='../dist/img/user1-128x128.jpg' alt='user image'>
                        <span class='username'><a href="#"><?php echo $row['judul_iklan']; ?></a></span>
                        <span class='description'>Admin : <?php echo $row['tgl_iklan']; ?></span>
                      </div>
                    </div><!-- /.box-header -->
                    <div class='box-body'>                        
                    <?php echo $row['isi_iklan']; ?>
                        <br>
                        <?php echo "Rp.".$row['harga_lelang']; ?>
                        <br>
                        <img class='img-thumbnail' src='../file/<?php echo $row['file_iklan']; ?>' alt='deskripsi barang'>
                        <br>
                        <br>
                        <!-- <a href="file/<?php echo $row['file_iklan']; ?>" class="btn btn-md btn-info pull-left">Download Lampiran</a> -->
                          
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
                        <img class='img-circle' src='../dist/img/user1-128x128.jpg' alt='user image'>
                        <div class='comment-text'>
                          <span class="username">
                            <?php
                            $nama = mysql_fetch_array(mysql_query("SELECT * FROM `user` WHERE id_user='".$ro['id_user']."'"));
                            echo $nama['nama'];
                            ?>
                            <span class='text-muted pull-right'><?php echo $ro['time_bid']." ".$ro['jam']; ?></span>
                          </span>
                            <?php echo "Rp.".number_format($ro['harga']); ?>
                        </div><!-- /.comment-text -->
                      </div>
                    </div>
                    
                    <?php } ?>
                    
                    <div class="box-footer">
                        <form action="ajax.php" method="POST">
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
      </div>            
            
            <!-- batas nulis isinya -->
            <?php include 'footer.php'; ?>
        </div>
        
        <?php include 'js.php'; ?>
    </body>
</html>