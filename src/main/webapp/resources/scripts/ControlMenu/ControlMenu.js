var url = document.URL, shortUrl = url.substring(0, url.lastIndexOf("/"));
$(document).ready(function() {
	modalPopupCenter();
});
$('document').ready(
function () {

    $("#Grid").jqGrid({
        url: shortUrl+'/getControlMenu',
        datatype: 'json',
        colNames: ['Edit', 'Header Name','Active',
					'Control Menu Name', 'Created By',
					'Created Date', 'Modified By',
					'Modified Date'],
        colModel: [
                  { name: 'cm_id', index: 'cm_id', width: 50, align: 'center',search:false,formatter:Edit,sortable:false,key:true, sorttype:'int'},
                  { name: 'hm_id.hm_desc', index: 'hm_id.hm_desc', width: 150, align: 'left', search: true, searchoptions: { sopt: ['bw','cn', 'eq', 'ew']} },
                  { name: 'active', index: 'active', width: 120, align: 'left', search: true, searchoptions: { sopt: ['bw','cn', 'eq', 'ew']} },
                  { name: 'cm_desc', index: 'cm_desc', width: 250, align: 'left', search: true, searchoptions: { sopt: ['bw','cn', 'eq', 'ew']} },
                  { name: 'created_by', index:'created_by', width: 250, align: 'left', search: true, searchoptions: { sopt: ['bw','cn', 'eq', 'ew']} },
                  { name: 'created_date', index: 'created_date', width: 150, align: 'left', search: true,formatter:FormatDate, searchoptions: { sopt: ['bw','cn', 'eq', 'ew']} },
                  { name: 'modified_by', index: 'modified_by', width: 250, align: 'left', search: true, searchoptions: { sopt: ['bw','cn', 'eq', 'ew']} },
                  { name: 'modified_date', index: 'modified_date', width: 150, align: 'left', search: true,formatter:FormatDate, searchoptions: { sopt: ['bw','cn', 'eq', 'ew']} }
                  

                  ],      
        height: $(window).height() - 330,
        width: $(window).width() - 500,
        rowNum: 7,
        rowList: [7,15,25,50],
        pager: '#Pager',
        jsonReader:{cell:""},
        sortname: 'cm_id',
        shrinkToFit: false,
        multiselect: false,
        viewrecords: true,
        autowidth: false,
     //   scroll: true,
        gridview: true,
        sortorder: 'asc',
        //scrollOffset: 0,
        altRows:true,
        altclass:'altrow',
        loadonce:true,
        search:true
    });
    $("#Grid").navGrid('#Pager', { view: false, del: false, add: false, edit: false, cloneToTop: false,search:false,refresh:true},
              {}, {}, // default settings for add
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
            
        }
    });
	$('#refresh_Grid div').append("<span>Reload</span>");
	$('INPUT[id^="gs_"]').addClass('form-control input-sm');
//adding edit cell
	function Edit(cellvalue, options, rowObject) {
		return '<a class="ion-edit"  title="'+cellvalue+'" data-toggle="modal" data-target="#myModal" onclick="EditModal('+cellvalue+')"></a>';

		        }	
	function FormatDate(cellvalue, options, rowObject)
	{
		var d=new Date(cellvalue);
		return d.getDate()+'-'+d.getMonth()+'-'+d.getFullYear()+' '+d.getHours()+':'+d.getMinutes();
	}
});	
function modalPopupCenter(){

var modalDialog = $(".modal-dialog");
     /* Applying the top margin on modal dialog to align it vertically center */
       modalDialog.css("margin-top",Math.max(0, ($(window).height() - modalDialog.height()) / 3));
	}


 $('document').ready(
 function() {
 $.ajax({
url:shortUrl+"/getActiveHeader",
 success:function(data) {
 var header_html = '';
 for (var i = 0; i < data.length; i++) {
	 header_html += "<option value='"+data[i].hm_desc+"'>"+ data[i].hm_desc + "</option>";
 }
 $('#dll_AddHeaderMenuList').html(header_html);
 }
 });
 })
 



function EditModal(cm_id)
{
	$("#val_cm_id").val(cm_id);
	$('#myModal div div div .modal-title').html('Edit Control');
	var dataFromTheRow=jQuery('#Grid').jqGrid('getRowData',cm_id);
	$('#txt_cm_desc').val(dataFromTheRow.cm_desc);
	$("#dll_AddHeaderMenuList option[value="+ dataFromTheRow['hm_id.hm_desc'] + "]").prop("selected",true);
	 $("#dll_ControlActive option[value="+ dataFromTheRow['active'] + "]").prop("selected",true);
	
	}
$('#btn_save').click(function() {
	   if(($('#txt_cm_desc').val() == "") || ($('#dll_AddHeaderMenuList').val() == "") || ($('#dll_ControlActive').val() == "")) {
	       $('#show_error').show();
	       return false;
	   }
	  
	});
$('#val_cm_id').val("");
$('#btn_save').click(function() {
if(($('#txt_cm_desc').val() == "") ||($('#dll_AddHeaderMenuList').val() == null) || ($('#dll_ControlActive').val() == null)){
new PNotify(
{
title : "Validation Error",
text : "Please Enter mandatory fields.",
addclass : "stack-custom",
type : "error",
delay : 4000,
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
	url:shortUrl+"/setControlMenu",
	type:"POST",
	data:{
		'cm_id' : $('#val_cm_id').val(),
		'cm_desc' : $('#txt_cm_desc').val(),
		'hm_desc' : $('#dll_AddHeaderMenuList option:selected').val(),
		 'active':$('#dll_ControlActive option:selected').val()
	 },
	 success:function(data){
		 $("#Grid").setGridParam({datatype:'json', page:1}).trigger('reloadGrid');
		 /*ModalReload();*/
		
	},
	});
});
	
function ModalReload()
{
	$('#val_cm_id').val("");
$('#myModal div div div .modal-title').html('Add New Control');
$('#txt_cm_desc').val ("");
$('#dll_AddHeaderMenuList').val(0);
$('#dll_ControlActive').val(0);
}

$("#btn_AddControl").click(function(){

	ModalReload();
	
});