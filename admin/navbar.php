
<style>
	.collapse a{
		text-indent:10px;
	}
</style>

<nav id="sidebar" class='mx-lt-5 bg-dark' >
		
		<div class="sidebar-list">
				<a href="index.php?page=home" class="nav-item nav-home"><span class='icon-field'><i class="fa fa-home"></i></span> Strona główna</a>
				<a href="index.php?page=categories" class="nav-item nav-categories"><span class='icon-field'><i class="fa fa-list"></i></span> Kategorie</a>
				<a href="index.php?page=products" class="nav-item nav-products"><span class='icon-field'><i class="fa fa-th-list"></i></span> Produkty</a>
				<a href="index.php?page=bids" class="nav-item nav-bids"><span class='icon-field'><i class="fa fa-money-bill-alt"></i></span> Licytacje</a>
				<a href="index.php?page=users" class="nav-item nav-users"><span class='icon-field'><i class="fa fa-users"></i></span> Użytkownicy</a>
				<a href="index.php?page=site_settings" class="nav-item nav-site_settings"><span class='icon-field'><i class="fa fa-cogs"></i></span> Ustawienia systemu</a>

		</div>

</nav>
<script>
	$('.nav_collapse').click(function(){
		console.log($(this).attr('href'))
		$($(this).attr('href')).collapse()
	})
	$('.nav-<?php echo isset($_GET['page']) ? $_GET['page'] : '' ?>').addClass('active')
</script>
