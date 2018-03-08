var url = document.URL, shortUrl = url.substring(0, url.lastIndexOf("/"));
$(document).ready(function() {
	modalPopupCenter();
});
$('document').ready(
function () {

    $("#Grid").jqGrid({
        url: shortUrl+'/getAllContents',
        datatype: 'json',
        colNames: ['Edit', 'Control SubMenu','Description',
					'Demo URL',/*'Download URL',*/'Created By',
					'Created Date', 'Modified By',
					'Modified Date'],
        colModel: [
                  { name: 'c_id', index: 'c_id', width: 50, align: 'center',search:false,formatter:Edit,sortable:false,key:true, sorttype:'int'},
                  { name: 'controlSubMenu.csm_desc', index: 'controlSubMenu.csm_desc', width: 150, align: 'left', search: true, searchoptions: { sopt: ['bw','cn', 'eq', 'ew']} },
                  {name : 'description', index:'description',width: 150, align: 'left', search: true, searchoptions: { sopt: ['bw','cn', 'eq', 'ew']} },
                  { name: 'demo_url', index: 'demo_url', width: 250, align: 'left', search: true, searchoptions: { sopt: ['bw','cn', 'eq', 'ew']} },
                  //{ name: 'download_url', index: 'download_url', width: 250, align: 'left', search: true, searchoptions: { sopt: ['bw','cn', 'eq', 'ew']} },
				  
                  { name: 'created_by', index:'created_by', width: 250, align: 'left', search: true, searchoptions: { sopt: ['bw','cn', 'eq', 'ew']} },
                  { name: 'created_date', index: 'created_date', width: 150, align: 'left', search: true,formatter:FormatDate,searchoptions: { sopt: ['bw','cn', 'eq', 'ew']} },
                  { name: 'modified_by', index: 'modified_by', width: 250, align: 'left', search: true, searchoptions: { sopt: ['bw','cn', 'eq', 'ew']} },
                  { name: 'modified_date', index: 'modified_date', width: 150, align: 'left', search: true,formatter:FormatDate, searchoptions: { sopt: ['bw','cn', 'eq', 'ew']} }
                  

                  ],      
        height: $(window).height() - 350,
        width: $(window).width() - 500,
        rowNum: 7,
        pageable: true,
        rowList: [7,15,25,50],
        pager: '#Pager',
        jsonReader:{cell:""},
        sortname: 'c_id',
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
    $("#Grid").jqGrid('navGrid','#Pager', { view: false, del: false, add: false, edit: false, cloneToTop: false,search:false,refresh: true},
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
		return '<a class="ion-edit"  title="'+cellvalue+'" data-toggle="modal" data-target="#ContentModal" data-backdrop="static" data-keyboard="false" onclick="EditModal('+cellvalue+')"></a>';

		        }
	
	function FormatDate(cellvalue, options, rowObject){
		var d=new Date(cellvalue);
		return d.getDate()+'-'+d.getMonth()+'-'+d.getFullYear()+' '+d.getHours()+':'+d.getMinutes();
	}
});	
function modalPopupCenter(){

var modalDialog = $(".modal-dialog");
     /* Applying the top margin on modal dialog to align it vertically center */
       modalDialog.css("margin-top",Math.max(0, ($(window).height() - modalDialog.height()) / 4));
	}


 $('document').ready(
 function() {
 $.ajax({
url:shortUrl+"/getActiveSubmenu",
 success:function(data) {
 var csm_html = '';
 for (var i = 0; i < data.length; i++) {
	 csm_html += "<option value='"+data[i].csm_desc+"'>"+ data[i].csm_desc + "</option>";
 }
 $('#dll_ControlSubMenu').html(csm_html);
 }
 });
 })
 



function EditModal(c_id)
{
	$("#val_c_id").val(c_id);
	$('#ContentModal div div div .modal-title').html('Edit Content');
	var dataFromTheRow=jQuery('#Grid').jqGrid('getRowData',c_id);
	$("#dll_ControlSubMenu option[value='" + dataFromTheRow['controlSubMenu.csm_desc'] +"']").prop("selected",true);
	//$("#dll_ControlSubMenu option[value=" + dataFromTheRow['controlSubMenu.csm_desc'] + "]").prop("selected",true);
	$('#txt_ContentDescription').val(dataFromTheRow.description);
	$('#txt_DemoUrl').val (dataFromTheRow.demo_url);
	//$('#txt_DownloadUrl').val(dataFromTheRow.download_url);
	
	}
 
 function SubmenuDropDown() {
		$.ajax({
			url:shortUrl+"/getActiveSubmenu",
			dataType: 'json',
			success: function (data) {
						var page_template_html = '';
						for (var i = 0; i < data.length; i++) {
							page_template_html += "<option value='"+data[i].p_desc  +"'>" + data[i].p_desc  + "</option>";
						}
						$('#dll_PageTemplate').html(page_template_html);
									}	
		});
}

 $('#btn_save').click(function() {
	   if($('#txt_ContentDescription').val() == ""){
	       $('#show_error').show();
	       return false;
	   }
	   else if($('#txt_DemoUrl').val()=="")
		   {
		   $('#show_error').show();
	       return false;
		   }
	   else if($('#txt_DownloadUrl').val()=="")
	   {
	   $('#show_error').show();
       return false;
	   }
	   });
$('#val_c_id').val("0");
$('#btn_save').click(function() {
if(/*($('#txt_DownloadUrl').val() == "") ||*/ ($('#txt_DemoUrl').val() == "")||($('#dll_ControlSubMenu').val()==null)||($('#txt_ContentDescription').val() == "")){
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
 if(/*($("#txt_DownloadUrl").get(0).checkValidity() == false)||*/($("#txt_DemoUrl").get(0).checkValidity() == false))
{
	 new PNotify(  
			 {
			 title : "Validation Error",
			 text : "Not a Valid Url Address",
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
	url:shortUrl+"/setContentMenu",
	type:"POST",
	data:{
		'c_id' : $('#val_c_id').val(),
		'csm_desc' : $('#dll_ControlSubMenu option:selected').val(),
		'description':$('#txt_ContentDescription').val(),
		'demo_url':$('#txt_DemoUrl').val(),
		//'download_url':$('#txt_DownloadUrl').val(),
		
	 },
	 success:function(data){
		 $("#Grid").setGridParam({datatype:'json', page:1}).trigger('reloadGrid');
		 ModalReload();
		
	},
	});
});
	
function ModalReload()
{
	$('#val_c_id').val("");
$('#dll_ControlSubMenu').val(0);
$('#txt_ContentDescription').val("");
$('#txt_DemoUrl').val ("");
//$('#txt_DownloadUrl').val("");


}



