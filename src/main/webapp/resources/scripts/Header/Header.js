var url = document.URL, shortUrl = url.substring(0, url.lastIndexOf("/"));
$(document).ready(function() {
	modalPopupCenter();
});
$('document').ready(
function () {

    $("#Grid").jqGrid({
        url: shortUrl+'/getHeader',
        datatype: 'json',
        colNames: [ 'Edit','Header Name','Active', 'Created By', 'Created Date', 'Modified By', 'Modified Date'],
        colModel: [
                  { name: 'hm_id', index: 'hm_id', width: 50, align: 'center',search: false,sortable:false,formatter:Edit,sorttype:'number' },
                  { name: 'hm_desc', index: 'hm_desc', width: 150, align: 'left', search: true, searchoptions: { sopt: ['bw','cn','eq', 'ew']} },
                  { name: 'active', index: 'active', width: 120, align: 'left', search: true, searchoptions: { sopt: ['bw','cn', 'eq', 'ew']} },
                  { name: 'created_by', index: 'created_by', width: 250, align: 'left', search: true, searchoptions: { sopt: ['bw','cn','eq', 'ew']} },
                  { name: 'created_date', index: 'created_date', width: 150, align: 'left', search: true,formatter:FormatDate, searchoptions: { sopt: ['bw','cn','eq', 'ew']} },
                  { name: 'modified_by', index: 'modified_by', width: 250, align: 'left', search: true, searchoptions: { sopt: ['bw','cn','eq', 'ew']} },
                  { name: 'modified_date', index: 'modified_date', width: 150, align: 'left', search: true,formatter:FormatDate, searchoptions: { sopt: ['bw','cn','eq', 'ew']} }
                  ],
       height: $(window).height() - 330,
        width: $(window).width() - 500,
        rowNum: 7,
        rowList: [7, 15,25,50],
        pager: '#Pager',
        sortname: 'hm_id',
        shrinkToFit: false,
        multiselect: false,
        viewrecords: true,
        autowidth: false,
      //  scroll: true,
        gridview: true,
        sortorder: 'asc',
       // scrollOffset: 0,
        altRows:true,
        loadonce:true,
        search:true,
        altclass:'altrow',
    });
 
    $("#Grid").jqGrid('navGrid','#Pager',{view: false, del: false, add: false, edit: false, cloneToTop: false,search:false,refresh: true},
              {},
                {}, // default settings for add
                {}, // delete
                {
            }).navSeparatorAdd('#Pager');

       $("#Grid").jqGrid('filterToolbar', { stringResult: true, searchOnEnter: true, searchOperators: true,
        beforeSearch: function () {
        	String.prototype.replaceAll = function (find, replace) {
			    var str = this;
			    return str.replace(new RegExp(find.replace(/[-\/\\^$*+?.()|[\]{}]/g, '\\$&'), 'g'), replace);
			};
			
            var postData = $("#Grid").jqGrid('getGridParam', 'postData');
            var columns = $("#Grid").jqGrid('getGridParam', 'colModel');
            postData.filters = postData.filters.replaceAll("\\", "");
            postData.filters = postData.filters.replaceAll("\":[{\"","':[{'").replaceAll("\"},{\"","'},{'").replaceAll("{\"","{'").replaceAll("\":\"","':'").replaceAll("rules\":","rules':").replaceAll("\",\"","','").replaceAll("\"}]}","'}]}");
            postData.filters = postData.filters.replaceAll("\"", "\\\\\\\"");
            postData.filters = postData.filters.replaceAll("':[{'","\":[{\"").replaceAll("'},{'","\"},{\"").replaceAll("{'","{\"").replaceAll("':'","\":\"").replaceAll("rules':","rules\":").replaceAll("','","\",\"").replaceAll("'}]}","\"}]}");
            
            var filters = $.parseJSON(postData.filters);
            //var sqlString = getStringForGroup(columns, filters);
            //$("#jqGrid").jqGrid('setGridParam', { postData: { 'SQLString': sqlString} })
        }
    });
	$('#refresh_Grid div').append("<span>Reload</span>");
	$('INPUT[id^="gs_"]').addClass('form-control input-sm');
//adding edit cell
	

	function Edit(cellvalue, options, rowObject) {
		return '<a class="ion-edit"  title="'+cellvalue+'" data-toggle="modal" data-target="#myModal" onclick= "EditLoad('+cellvalue+')"></a>';
		}
	
	function FormatDate(cellvalue, options, rowObject)
	{
		var d=new Date(cellvalue);
		return d.getDate()+'-'+d.getMonth()+'-'+d.getFullYear()+' '+d.getHours()+':'+d.getMinutes();
	}
		   
	

	
});	
function modalPopupCenter(){
	
	var modalDialog = $(".modal-dialog");
        //Applying the top margin on modal dialog to align it vertically center 
       modalDialog.css("margin-top", Math.max(0, ($(window).height() - modalDialog.height()) / 3));
	}
	
//$('ul li').on('click', function(){
//$('ul li').removeClass('active'); // remove any active class
//$(this).addClass('active'); // and then add active class for clicked element.
//}); 
   

function EditLoad(hm_id){
	$('#myModal div div div .modal-title').html('Edit Header Name');	
    //alert(hm_id);
	$.ajax({
        url:shortUrl+ "/getHeaderByid",
        
        data:     {
     	   'hm_id': hm_id},
	success:function(data){
		$('#val_hm_id').val(hm_id);
		$('#txt_hm_desc').val(data.hm_desc);
		$('#dll_HeaderActive').val(data.active);
		
	}
	});
	
//	var dataFromTheRow = jQuery('#jqGrid').jqGrid ('getRowData', hm_id);
//	//alert(dataFromTheRow);
//		$('#val_hm_id').val(hm_id);
//	$('#txt_hm_desc').val(dataFromTheRow.hm_desc);
	
}


$('#btn_save').click(function() {
   if(($('#txt_hm_desc').val() == "")||($('#dll_HeaderActive').val()=="")){
       $('#show_error').show();
       return false;
   }
});
$('#btn_cancel,button.close').click(function() {
	$('#myModal div div div .modal-title').html('Add Header Name');	
	$('#val_hm_id').val(" ");
	$('#txt_hm_desc').val("");
	$('#dll_HeaderActive').val("");
	
	
});




$('#val_hm_id').val(" ");
$('#btn_save').click(function() {
	if(($('#txt_hm_desc').val() == "")|| ($('#dll_HeaderActive').val()==null)){
		new PNotify(
{
title : "Validation Error",
text : "Please Enter mandatory fields.",
addclass : "stack-custom",
type : "error",
delay : 3000,
stack : {
"dir1" : "down",
"dir2" : "left",
"push" : "top"
},
buttons : {
sticker : false
}
});
		return false;
}
	
	 $.ajax({
         
         url:shortUrl+ "/setHeaderMenu",
         
         data:     {
      	   'hm_id': $('#val_hm_id').val (),
      	   'hm_desc': $('#txt_hm_desc').val() ,
      	 'active':$('#dll_HeaderActive option:selected').val()},
        type:"POST",
         
         success: function (data) {
        	// $('#headerlist').load(document.URL +  ' #headerlist');

        	 //$('#menu').load(document.URL +  ' #menu');
        	
        	 $('#Grid').setGridParam({datatype:'json', page:1}).trigger('reloadGrid');
        	 //location.reload(false);
            ModalReload();
            HeaderReload();
         },
    });
});
function ModalReload(){
$('#val_hm_id').val(" ");
$('#myModal div div div .modal-title').html('Add New Header');
$('#txt_hm_desc').val ("");
$('#dll_HeaderActive').val(0);
}     

$("#btn_AddHeader").click(function(){

	ModalReload();
	
});
/*function HeaderReload(){
	$.getJSON(shortUrl+"/getActiveHeader",  {
	ajax: 'true'
	}, function (data) {
	var header_html='';
	for(var i=0; i<data.length;i++){
	header_html+="<li><a class='navigation-link' > <span class='text-bold'>"+data[i].hm_desc+"</span> </a></li>";
	}
	$('#headerlist').html(header_html);
	//$('#headerlist li').click(function(){
//		$('#headerlist li').removeClass('active'); // remove any active class
//		$(this).addClass('active'); 
	//})
	});
	}*/

function HeaderReload(){
$.ajax({
    url:shortUrl+ "/getActiveHeader",
    success: function (data) {
    var header_html="<li title='Admin' class='active'><a class='navigation-link' > <span class='text-bold'>Admin</span> </a></li>";
for(var i=0; i<data.length;i++){
header_html+="<li><a class='navigation-link' > <span class='text-bold'>"+data[i].hm_desc+"</span> </a></li>";
}
$('#headerlist').html(header_html);
//$('#headerlist li').click(function(){
//	$('#headerlist li').removeClass('active'); // remove any active class
//	$(this).addClass('active'); 
//})
    }
    });
}