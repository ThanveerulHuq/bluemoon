var url = document.URL, shortUrl = url.substring(0, url.lastIndexOf("/"));
$('document').ready(function () {
//	 $('ul li').on('click', function(){
//		 $('ul li').removeClass('active'); // remove any active class
//		 $(this).addClass('active'); // and then add active class for clicked element.
//		 });
	Grid();
	modalPopupCenter();
	HeaderDropDown();
	PageTemplateDropDown();
	DataSave();
	$('#btn_AddSubMenu').click(function(){
		ModalReload();
		
	});
});

function Grid() {
	$("#Grid").jqGrid({
		url: shortUrl+'/getAllControlSubMenu',
		datatype: 'json',
		colNames: ['Edit', 'Header Menu', 'Control Menu', 'Sub Menu', 'Module Name', 'Page Template','Active', 'Created By', 'Created Date', 'Modified By', 'Modified Date'],
        colModel: [{ name: 'csm_id', index: 'csm_id', width: 50 , align: 'center', search: false,sortable:false, formatter:Edit},
                  { name: 'controlMenu.hm_id.hm_desc', index: 'controlMenu.hm_id.hm_desc', width: 150, align: 'left', search: true, searchoptions: { sopt: ['bw','cn', 'eq', 'ew']} },
				   { name: 'controlMenu.cm_desc', index: 'controlMenu.cm_desc', width: 250, align: 'left', search: true, searchoptions: { sopt: ['bw','cn', 'eq', 'ew']} },
					{ name: 'csm_desc', index: 'csm_desc', width: 250, align: 'left', search: true, searchoptions: { sopt: ['bw','cn', 'eq', 'ew']} },
					{ name: 'csm_module_name', index: 'csm_module_name', width: 250, align: 'left', search: true, searchoptions: { sopt: ['bw','cn', 'eq', 'ew']} },
					{ name: 'pageMaster.p_desc', index: 'pageMaster.p_desc', width: 250, align: 'left', search: true, searchoptions: { sopt: ['bw','cn', 'eq', 'ew']} },
					 { name: 'active', index: 'active', width: 120, align: 'left', search: true, searchoptions: { sopt: ['bw','cn', 'eq', 'ew']} },
					{ name: 'created_by', index: 'created_by', width: 250, align: 'left', search: true, searchoptions: { sopt: ['bw','cn', 'eq', 'ew']} },
					{ name: 'created_date', index: 'created_date', width: 150, align: 'left', search: true,formatter:FormatDate, searchoptions: { sopt: ['bw','cn', 'eq', 'ew']} },
					{ name: 'modified_by', index: 'modified_by', width: 250, align: 'left', search: true, searchoptions: { sopt: ['bw','cn', 'eq', 'ew']} },
					{ name: 'modified_date', index: 'modified_date', width: 150, align: 'left', search: true,formatter:FormatDate, searchoptions: { sopt: ['bw','cn', 'eq', 'ew']} }
				   ],
		height: $(window).height() - 330,
		width: $(window).width() - 500,
		rowNum: 7,
		rowList: [7, 15, 25,50],
		pager: '#Pager',
		sortname: 'csm_id',
		shrinkToFit: false,
		multiselect: false,
		viewrecords: true,
		autowidth: false,
		//scroll: true,
		gridview: true,
		sortorder: 'asc',
		
		altRows: true,
		altclass: 'altrow',
	    loadonce:true,
		loadComplete: function () {
			EditLoad();
		}
	});

	$("#Grid").navGrid( '#Pager', {
			view: false,
			del: false,
			add: false,
			edit: false,
			refresh: true,
			cloneToTop: false,
			search: false
		}, {},

		{}, // default settings for add
		{}, // delete
		{}).navSeparatorAdd('#Pager');

	$("#Grid").jqGrid('filterToolbar', {
		stringResult: true,
		searchOnEnter: true,
		searchOperators: true,
		beforeSearch: function () {
			String.prototype.replaceAll = function (find, replace) {
				var str = this;
				return str.replace(new RegExp(find.replace(/[-\/\\^$*+?.()|[\]{}]/g, '\\$&'), 'g'), replace);
			};

			var postData = $("#Grid").jqGrid('getGridParam', 'postData');
			var columns = $("#Grid").jqGrid('getGridParam', 'colModel');
			postData.filters = postData.filters.replaceAll("\\", "");
			postData.filters = postData.filters.replaceAll("\":[{\"", "':[{'").replaceAll("\"},{\"", "'},{'").replaceAll("{\"", "{'").replaceAll("\":\"", "':'").replaceAll("rules\":", "rules':").replaceAll("\",\"", "','").replaceAll("\"}]}", "'}]}");
			postData.filters = postData.filters.replaceAll("\"", "\\\\\\\"");
			postData.filters = postData.filters.replaceAll("':[{'", "\":[{\"").replaceAll("'},{'", "\"},{\"").replaceAll("{'", "{\"").replaceAll("':'", "\":\"").replaceAll("rules':", "rules\":").replaceAll("','", "\",\"").replaceAll("'}]}", "\"}]}");

			var filters = $.parseJSON(postData.filters);
		}
	});
	$('#refresh_Grid div').append("<span>Reload</span>");
	$('INPUT[id^="gs_"]').attr("placeholder", "filter").addClass('form-control input-sm');
	//adding edit cell
	function Edit(cellvalue, options, rowObject) {
		return '<span class="ion-edit" type="button" title="' + cellvalue + '" data-toggle="modal" data-target="#SubMenuModal"></span>';
	}
	
	function FormatDate(cellvalue, options, rowObject)
	{
		var d=new Date(cellvalue);
		return d.getDate()+'-'+d.getMonth()+'-'+d.getFullYear()+' '+d.getHours()+':'+d.getMinutes();
	}
}

function HeaderDropDown(){
	$.ajax({
		url:shortUrl+"/getActiveHeader",
		dataType: 'json',
		success: function (data) {
			var header_html='';
			for(var i=0; i<data.length;i++){
			header_html+="<option value='"+data[i].hm_desc+"'>"+data[i].hm_desc+"</option>";
			}
			$('#dll_HeaderMenu').append(header_html);
			$('#dll_HeaderMenu').change(function(){
			ControlMenuDropDown();
			});
		} 
		});
	
}
function ControlMenuDropDown(Header) {
			var Header = $("#dll_HeaderMenu option:selected").val();
		$.ajax({
			url:shortUrl+"/getHomeControlMenu?Header="+Header,
			dataType: 'json',
			success: function (data) {
						var control_menu_html = '';
						for (var i = 0; i < data.length; i++) {
							control_menu_html += "<option value='"+data[i].cm_desc +"'>" + data[i].cm_desc + "</option>";
						}
						$('#dll_ControlMenu').html(control_menu_html);
									}
		});
}
function PageTemplateDropDown() {
		$.ajax({
			url:shortUrl+"/getPageTemplate",
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

function DataSave(){
	
	$('#btn_Submit').click(function(){
		if(($('#txt_SubMenu').val() == "")||($('txt_Module').val()=="")){
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
			})
			return false;
			}
		else{
	var csm_id=$("#txt_id").val();
		$.ajax({
			url:shortUrl+"/SaveSubMenu",
			data: {  'csm_id':csm_id,
				    'Controlmenu': $("#dll_ControlMenu option:selected").val(),
				     'subMenu':$("#txt_SubMenu").val(),
				     'Module':$("#txt_Module").val(), 
				     'PageTemplate': $("#dll_PageTemplate option:selected").val(),
				     'active':$('#dll_SubMenuActive option:selected').val()
				     },
				     dataType: 'text',
					 success: function (data) {
//							if(data='success'){
//							$('#messagebody').html('UpdatedSuccessfully')
//							$('#messageModal div div').addClass('alert-success');
//							}else{
//								$('#messagebody').html('Failed to Update.Try Again')
//								$('#messageModal div div').addClass('alert-danger');	
//							}
//							$("#messageModal").show();
//						    setTimeout(function(){$("#messageModal").hide();}, 2000);
						    $("#Grid").setGridParam({datatype:'json', page:1}).trigger('reloadGrid');
						},
				     error:function(request, status, error)
				     {
				     console.log(error);
				     }
		});
		}
		});
	}


function ModalReload(){
	$('.modal-title').html('Add SubMenu');	
	$(".modal-body .form-horizontal .form-group div :input").val('')
	var Header = $("#dll_HeaderMenu option:first").val();
	$("#dll_HeaderMenu").val(Header);
	$.ajax({
		url:shortUrl+"/getHomeControlMenu?Header="+Header,
		dataType: 'json',
		success: function (data) {
					var control_menu_html = '';
					for (var i = 0; i < data.length; i++) {
						control_menu_html += "<option value='"+data[i].cm_desc +"'>" + data[i].cm_desc + "</option>";
					}
					$('#dll_ControlMenu').html(control_menu_html);
					$("#dll_ControlMenu").val($("#dll_ControlMenu option:first").val());
								}
	});
    $("#dll_PageTemplate").val($("#dll_PageTemplate option:first").val());
    $('#dll_SubMenuActive').val($("#dll_SubMenuActive option:first").val());
}
function EditLoad(){
$('#Grid tbody tr td span').click(function(){ 
	
$('.modal-title').html('Edit SubMenu');	
var csm_id=$(this).attr('title');
$.ajax({
			url:shortUrl+"/getControlSubMenubyId?csm_id="+csm_id,
			dataType: 'json',
			success: function (data) {
				     $('#txt_id').val(data.csm_id);
                     $("#dll_HeaderMenu").val(data.controlMenu.hm_id.hm_desc);
                     var Header = data.controlMenu.hm_id.hm_desc;
             		$.ajax({
             			url:shortUrl+"/getHomeControlMenu?Header="+Header,
             			dataType: 'json',
             			success: function (cmdata) {
             						var control_menu_html = '';
             						for (var i = 0; i < cmdata.length; i++) {
             							control_menu_html += "<option value='"+cmdata[i].cm_desc +"'>" +cmdata[i].cm_desc + "</option>";
             						}
             						$('#dll_ControlMenu').html(control_menu_html);
             						$("#dll_ControlMenu").val(data.controlMenu.cm_desc);
             									}
             		});
				     $("#txt_SubMenu").val(data.csm_desc);
				     $("#txt_Module").val(data.csm_module_name); 
				    $("#dll_PageTemplate").val(data.pageMaster.p_desc);
				    $('#dll_SubMenuActive').val(data.active);
									}
		});
});

}
function modalPopupCenter() {
	var modalDialog = $(".modal-dialog");
	/* Applying the top margin on modal dialog to align it vertically center */
	modalDialog.css("margin-top", Math.max(0,
	($(window).height() - modalDialog.height()) / 4));
	}







