var save_method, table;
//Menerapkan plugin datatables
$(function(){
   table = $('.table').DataTable({
      "processing" : true,
      "ajax" : {
         "url" : "ajax/ajax_user.php?action=table_data",
         "type" : "POST"
      }
   });
   
});

//Tombol tambah diklik
function form_add(){
   save_method = "add";
   $('#modal_user').modal('show');
   $('#modal_user form')[0].reset();
   $('.modal-title').text('Tambah User');
}

//Tombol edit diklik
function form_edit(id){
   save_method = "edit";
   $('#modal_user form')[0].reset();
   $.ajax({
      url : "ajax/ajax_user.php?action=form_data&id="+id,
      type : "GET",
      dataType : "JSON",
      success : function(data){
         $('#modal_user').modal('show');
         $('.modal-title').text('Edit User');
			
         $('#id').val(data.id_user);
         $('#nama').val(data.nama);
         $('#username').val(data.username);
         $('#level').val(data.level);
      },
      error : function(){
         alert("Tidak dapat menampilkan data!");
      }
   });
}

//Tombol simpan diklik
function save_data(){
   if(save_method == "add")
      url = "ajax/ajax_user.php?action=insert";
   else url = "ajax/ajax_user.php?action=update";
	
   $.ajax({
      url : url,
      type : "POST",
      data : $('#modal_user form').serialize(),
      success : function(data){
         $('#modal_user').modal('hide');
         table.ajax.reload();
      },
      error : function(){
         alert("Tidak dapat menyimpan data!");
      }			
   });
   return false;
}

//Tombol hapus diklik
function delete_data(id){
   if(confirm("Apakah yakin data akan dihapus?")){
      $.ajax({
         url : "ajax/ajax_user.php?action=delete&id="+id,
         type : "GET",
         success : function(data){
            table.ajax.reload();
         },
         error : function(){
            alert("Tidak dapat menghapus data!");
         }
      });
   }
}

