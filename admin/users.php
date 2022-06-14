<?php 

?>

<div class="container-fluid">
	
	<div class="row">
	<div class="col-lg-12">
			<button class="btn btn-primary float-right btn-sm" id="new_user"><i class="fa fa-plus"></i> Nowy użytkownik</button>
	</div>
	</div>
	<br>
	<div class="row">
		<div class="card col-lg-12">
			<div class="card-body">
				<table class="table-striped table-bordered col-md-12">
			<thead>
				<tr>
					<th class="text-center">LP</th>
					<th class="text-center">Imie</th>
					<th class="text-center">Nazwa użytkownika</th>
					<th class="text-center">Typ</th>
					<th class="text-center">Zadanie</th>
				</tr>
			</thead>
			<tbody>
				<?php
 					include 'db_connect.php';
 					$type = array("","Admin","Staff","Alumnus/Alumna");
 					$users = $conn->query("SELECT * FROM users order by name asc");
 					$i = 1;
 					while($row= $users->fetch_assoc()):
				 ?>
				 <tr>
				 	<td class="text-center">
				 		<?php echo $i++ ?>
				 	</td>
				 	<td>
				 		<?php echo ucwords($row['name']) ?>
				 	</td>
				 	
				 	<td>
				 		<?php echo $row['username'] ?>
				 	</td>
				 	<td>
				 		<?php echo $type[$row['type']] ?>
				 	</td>
				 	<td>
				 		<center>
								
								    <button class="btn btn-sm btn-primary edit_user" href="javascript:void(0)" data-id = '<?php echo $row['id'] ?>'>Edytuj</button>								   
								    <button class="btn btn-sm btn-danger delete_user" href="javascript:void(0)" data-id = '<?php echo $row['id'] ?>'>Usuń</button>
								  
								</center>
				 	</td>
				 </tr>
				<?php endwhile; ?>
			</tbody>
		</table>
			</div>
		</div>
	</div>

</div>
<script>
	$('table').dataTable();
$('#new_user').click(function(){
	uni_modal('Nowy użytkownik','manage_user.php')
})
$('.edit_user').click(function(){
	uni_modal('Modyfikacja użytkownika','manage_user.php?id='+$(this).attr('data-id'))
})
$('.delete_user').click(function(){
		_conf("czy na pewno chcesz usunąć użytkownika?","delete_user",[$(this).attr('data-id')])
	})
	function delete_user($id){
		start_load()
		$.ajax({
			url:'ajax.php?action=delete_user',
			method:'POST',
			data:{id:$id},
			success:function(resp){
				if(resp==1){
					alert_toast("Dane usunięte pomyślnie",'success')
					setTimeout(function(){
						location.reload()
					},1500)

				}
			}
		})
	}
</script>