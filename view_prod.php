<?php include 'admin/db_connect.php' ?>
<?php
session_start();
if(isset($_GET['id'])){
$qry = $conn->query("SELECT * FROM products where id= ".$_GET['id']);
foreach($qry->fetch_array() as $k => $val){
	$$k=$val;
}
$cat_qry = $conn->query("SELECT * FROM categories where id = $category_id");
$category = $cat_qry->num_rows > 0 ? $cat_qry->fetch_array()['name'] : '' ;
}
?>
<style type="text/css">
	#bid-frm{
		display: none
	}
</style>
<div class="container-fluid">
	<img src="admin/assets/uploads/<?php echo $img_fname ?>" class="d-flex w-100" alt="">
	<p>Nazwa produktu: <large><b><?php echo $name ?></b></large></p>
	<p>Kategoria: <b><?php echo $category ?></b></p>
	<p>Cena rynkowa: <b><?php echo number_format($start_bid,2) ?></b></p>
	<p>Do końca: <b><?php echo date("d.m.Y h:i",strtotime($bid_end_datetime)) ?></b></p>
	<p>Najwyższa kwota: <b id="hbid"><?php echo number_format($start_bid,2) ?></b></p>
	<p>Opis:</p>
	<p class=""><small><i><?php echo $description ?></i></small></p>
	<div class="col-md-12">
		<button class="btn btn-primary btn-block btn-sm" type="button" id="bid">Zalicytuj</button>
	</div>
	<div id="bid-frm">
		<div class="col-md-12">
			<form id="manage-bid">
				<input type="hidden" name="product_id" value="<?php echo $id ?>">
				<div class="form-group">
					<label for="" class="control-label">Podbij do:</label>
					<input type="number" class="form-control text-right" name="bid_amount" >
				</div>
				<div class="row justify-content-between">
					<button class="btn col-sm-5 btn-primary btn-block btn-sm mr-2">Zatwierdź</button>
					<button class="btn col-sm-5 btn-secondary mt-0 btn-block btn-sm" type="button" id="cancel_bid">Anuluj</button>
				</div>
			</form>
		</div>
	</div>
</div>
<script>
	$('#imagesCarousel img,#banner img').click(function(){
		viewer_modal($(this).attr('src'))
	})
	$('#participate').click(function(){
        _conf("Czy jesteś pewny że chcesz wziąć udział w licytacji?","Weź udział",[<?php echo $id ?>],'mid-large')
    })
    var _updateBid = setInterval(function(){
    	$.ajax({
    		url:'admin/ajax.php?action=get_latest_bid',
    		method:'POST',
    		data:{product_id:'<?php echo $id ?>'},
    		success:function(resp){
    			if(resp && resp > 0){
    				$('#hbid').text(parseFloat(resp).toLocaleString('en-US',{style:'decimal',maximumFractionDigits:2,minimumFractionDigits:2}))
    			}
    		}
    	})
    },1000)

    $('#manage-bid').submit(function(e){
    	e.preventDefault()
            start_load()
            var latest = $('#hbid').text()
            latest = latest.replace(/,/g,'')
            if(parseFloat(latest)  > $('[name="bid_amount"]').val()){
            	alert_toast("Podana kwota musi być wyższa od obecnej.",'danger')
            	end_load()
            	return false;
            }
            $.ajax({
                url:'admin/ajax.php?action=save_bid',
                method:'POST',
                data:$(this).serialize(),
                success:function(resp){
                    if(resp==1){
                        alert_toast("Wzięto udział w licytacji",'success')
            			end_load()
                    }else if(resp==2){
                    	alert_toast("Podana przez ciebie kwota jest obecnie najwyższa.",'danger')
            			end_load()
                    }
                }
            })
        })
    $('#bid').click(function(){
    	if('<?php echo isset($_SESSION['login_id']) ? 1 : '' ?>' != 1){
    		$('.modal').modal('hide')
    		 uni_modal("LOGIN",'login.php')
    		 return false;
    	}
    	$(this).hide()
    	$('#bid-frm').show()
    })
    $('#cancel_bid').click(function(){
    	$('#bid').show()
    	$('#bid-frm').hide()
    })
</script>
