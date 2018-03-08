var url = document.URL, shortUrl = url.substring(0, url.lastIndexOf("/"));
$(document).ready(function() {
	/*modalPopupCenter();*/
	
});
$('document').ready(
function () {
		$("#Grid").jqGrid({
        url: shortUrl+'/userJson',
        datatype: 'json',
        colNames: ['Edit','User Name','Email','Created By','Creation Date','Modified By','Modified Date','Role', 'Active'],
        colModel: [
                  { name: 'u_id', index: 'u_id', width: 50, align: 'center',search:false,formatter:Edit,sortable:false,key:true},
                  { name: 'screen_name', index: 'screen_name', width: 250, align: 'left', search: true, searchoptions: { sopt: ['bw','cn','eq', 'ew']} },
                  { name: 'u_email', index: 'u_email', width: 300, align: 'left', search: true, searchoptions: { sopt: ['bw','cn','eq', 'ew']} },
                  {name:'created_by',index:'created_by',width:300,align:'left',search: true, searchoptions: { sopt: ['bw','cn','eq', 'ew']}},
                  {name:'created_date',index:'created_date',width:300,align:'left',search: true,formatter:FormatDate, searchoptions: { sopt: ['bw','cn','eq', 'ew']}},
                  {name:'modified_by',index:'modified_by',width:300,align:'left',search: true, searchoptions: { sopt: ['bw','cn','eq', 'ew']}},
                  {name:'modified_date',index:'modified_date',width:300,align:'left',search: true,formatter:FormatDate, searchoptions: { sopt: ['bw','cn','eq', 'ew']}},
                  { name: 'r_id.r_desc', index:'r_id.r_desc', width: 150, align: 'left', search: true, searchoptions: { sopt: ['bw','cn', 'eq', 'ew']} },
                  { name: 'active', index: 'active', width: 120, align: 'left', search: true, searchoptions: { sopt: ['bw','cn', 'eq', 'ew']} }
                  ],    
                  search:true,
                  pager: '#Pager',
                  pageable: true,
                  jsonReader:{cell:""},
                  rowNum: 7,
                  rowList: [7,15,25,50],
                  sortname: 'uId',
                  sortorder: 'asc',
                  viewrecords: true,
                  height:$(window).height() - 330,
                  width: $(window).width() - 500,
                  loadonce:true,
                  shrinkToFit: false,
                  multiselect: false,
                  autowidth: false,
      //  scroll: true,
                  gridview: true, 	
         //scrollOffset: 0,
                  altRows:true,
                  altclass:'altrow',
        
        
    });
        
       
   
    
    $("#Grid").jqGrid('navGrid','#Pager', {
    	 view: false, del: false, add: false, edit: false, cloneToTop: false,search:false,refresh:true},
    	
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
		return '<a class="ion-edit"  title="'+cellvalue+'" data-toggle="modal" data-target="#UserModal" onclick="EditModal('+cellvalue+')"></a>';

		        }	
		        function FormatDate(cellvalue, options, rowObject){
		var d=new Date(cellvalue);
		return d.getDate()+'-'+d.getMonth()+'-'+d.getFullYear()+' '+d.getHours()+':'+d.getMinutes();
	}
});	
//function modalPopupCenter(){
//
//var modalDialog = $(".modal-dialog");
//     /* Applying the top margin on modal dialog to align it vertically center */
//       modalDialog.css("margin-top",Math.max(0, ($(window).height() - modalDialog.height()) / 3));
//	}


 $('document').ready(
 function() {
 $.ajax({
	 url:shortUrl+'/role',
 success:function(data) {
 var htmlRole = '';
 for (var i = 0; i < data.length; i++) {
 htmlRole += "<option value='"+data[i].r_desc+"'>"+ data[i].r_desc + "</option>";
 }
 $('#dll_Role').html(htmlRole);
 }
 });
 })
 
//$('ul li').on('click', function(){
//$('ul li').removeClass('active'); // remove any active class
//$(this).addClass('active'); // and then add active class for clicked element.
//}); 


function EditModal(u_id)
{
	$("#txt_hidden").val(u_id);
	$('#UserModal div div div .modal-title').html('Edit User');
	var dataFromTheRow=jQuery('#Grid').jqGrid('getRowData',u_id);
	$('#txt_emailId').val(dataFromTheRow.u_email);
	$('#txt_screenName').val(dataFromTheRow.screen_name);
	$("#dll_Role option[value=" + dataFromTheRow['r_id.r_desc'] + "]").prop("selected",true);
	$("#dll_Active option[value=" + dataFromTheRow['active'] + "]").prop("selected",true);
	
	var u_id=$("#txt_hidden").val();
	$("#sel_attributes").text(0);
	ControlSubmenuDropDown();
	$.ajax({
		url : shortUrl + "/getselectedControl?u_id=" + u_id,
		dataType : 'json',
		success : function(data) {
			var selected_html = '';
			for (var i = 0; i < data.length; i++) {
				selected_html += "<option value='"
						+ data[i].controlSubMenu.csm_id + "'>"
						+ data[i].controlSubMenu.csm_desc + "</option>";
			}
			var selected = $('#sel_attributes').html(selected_html);
			var selected = [];
			$('#sel_attributes option').each(function() {
				selected.push(parseInt($(this).val()));
			});
			$("#dll_Submenus").text(0);
			$.ajax({
				url : shortUrl + "/getsubmenuslist",
				dataType : 'json',
				success : function(data1) {
					var a = true;
					var submenuslist_html = '';
					for (var i = 0; i < data1.length; i++) {
						a = true;
						for (var j = 0; j < selected.length; j++) {
							if (data1[i].csm_id == selected[j]) {
								a = false
							}
						}
						if (a == true) {
							submenuslist_html += "<option value='"
									+ data1[i].csm_id + "'>"
									+ data1[i].csm_desc + "</option>";
						}
					}
					$('#dll_Submenus').html(submenuslist_html);

				}
			});
		}
	});
	
		}
			    
	
	
	
$('#btn_save').click(function() {
	   if(($('#txt_emailId').val() == "")||($('#txt_screenName').val() == "")||($('#dll_Role').val()=="") || ($('#dll_Active').val()=="") ){
	       $('#show_error').show();
	       return false;
	   }
	  
	   });
$('#txt_hidden').val("");
$('#btn_save').click(function() {
if(($('#txt_emailId').val() == "") || ($('#txt_screenName').val() == "")||($('#dll_Role').val()==null) || ($('#dll_Active').val()==null) ||
		(($('#dll_Role').val()=="SuperUser")&&($("#sel_attributes option").val()==null)))
{
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

var email=document.getElementById('txt_emailId').value;
var atPosition = email.indexOf("@sanmina.com");
var dotPosition =email.lastIndexOf(".");
if((atPosition<1) || (dotPosition<atPosition+2) || (dotPosition+2>=email.length)) 
{
	 new PNotify( 
			 {
			 title : "Validation Error",
			 text : "Not a Valid Email Address",
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
var UserAttributes=[];

$('#sel_attributes option').each(function()
		{
    UserAttributes.push(parseInt($(this).val()));
		 });
console.log(UserAttributes);


$.ajax({
	url:shortUrl+"/setInsertUser",
	type:"POST",
	data:{
		'u_id':$('#txt_hidden').val(),
		 'u_email': $('#txt_emailId').val() ,
        'screen_name': $('#txt_screenName').val(),
			 'r_desc':$('#dll_Role option:selected').val(),
		 'active':$('#dll_Active option:selected').val(),
		 'user_attributes':UserAttributes.toString()
		
	 },
	 success:function(data){
	 $("#Grid").setGridParam({datatype:'json', page:1}).trigger('reloadGrid');
		
	},
	});
});
	
function ModalReload()
{
$('#txt_hidden').val("");
$('#UserModal div div div .modal-title').html('Add New User');
$('#txt_emailId').val ("");
$('#txt_screenName').val("");
$('#dll_Role').val(0);
$('#dll_Active').val(0);
}

$("#btn_AddUser").click(function(){
	ModalReload();
	ControlSubmenuDropDown();
	$("#sel_attributes").text(0);

});

//
//$("#btn_cancel,button.close").click(function() {
//	$('#txt_hidden').val("0");
//	$('#UserModal div div div .modal-title').html('Add New User');
//	$('#txt_emailId').val ("");
//	$('#txt_screenName').val("");
//	$('#dll_Role').val(0);
//	$('#dll_Active').val(0);
//});

 
 
 $("#btn_forward").click(function(){
	var str='';
	 $('#dll_Submenus :selected').each(function(i, selected)
		{
		 str+= '<option  value='+$(selected).val()+'>'+$(selected).text();'+</option>' ;
		 });
	 $("#sel_attributes").append(str);
	 $('#dll_Submenus :selected').remove();
 });
 $("#btn_reverse").click(function(){
		var rev='';
		 $('#sel_attributes :selected').each(function(i, selected)
			{
			 rev+=  '<option value='+$(selected).val()+'>'+$(selected).text();'+</option>' ;
			 });
		 $("#dll_Submenus").append(rev);
		 $('#sel_attributes :selected').remove();
	 });

 

function ControlSubmenuDropDown() {
	$.ajax({
		url:shortUrl+"/getsubmenuslist",
		dataType: 'json',
		success: function (data) {
					var submenuslist_html = '';
					for (var i = 0; i < data.length; i++) {
						submenuslist_html += "<option value='"+data[i].csm_id +"'>" + data[i].csm_desc  + "</option>";
					}
					$('#dll_Submenus').html(submenuslist_html);
								}	
	});
}



