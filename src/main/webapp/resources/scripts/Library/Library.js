var url = document.URL,shortUrl=url.substring(0,url.lastIndexOf("/"));
var Childurl='';
var SuperUser=1;
var ActiveHeader='';
$('document').ready(function() {
	InitialLoad();
	LoginClick();
});
function InitialLoad(){
	$.ajax({
		url : shortUrl + "/getPageContents",
		type : "GET",
		success : function(data) {
//			setting Header
			var header_html = "<li title='Admin'><a class='navigation-link' > <span class='text-bold'>Admin</span> </a></li>";
			for (var i = 0; i < data.headers.length; i++) {
				header_html += "<li title='"+ data.headers[i]+"'><a class='navigation-link' > <span class='text-bold'>"
						+ data.headers[i]+ "</span> </a></li>";
			}
			$('#headerlist').html(header_html);
			$('headerlist li').html('Components').addClass('active');
			$('#headerlist li').click(function(){
				var Header = $(this).find('a span').html();
						HeaderClick(Header);
					});
			var QUrl = url.substring(url
					.lastIndexOf("="));
			var hm_desc = QUrl.replace("=", "")
			if (window.location.search == "") {
				NormalLoad();
			} else {
				HeaderClick(hm_desc);
			}
			function NormalLoad(){
				ActiveHeader='Components'
		   $('#headerlist li').removeClass('active');
		   $("#headerlist li[title='Components']").addClass('active');
//			Setting Control Menu
			var control_menu_html = '';
			for (var i = 0; i < data.controlMenu.length; i++) {
				control_menu_html += "<li title='" + data.controlMenu[i] + "'> <a>"
						+ data.controlMenu[i] + "</a></li>";
			}
			$('#navigation-sidebar ul').html(control_menu_html);
			$('#navigation-sidebar ul li').first().addClass('active');
			$('#navigation-sidebar ul li').click(function() {
				var Control = $(this).find('a').html();
				ControlMenuClick(Control);
			});
//			Setting Sub Menu
			var control_submenu_html = '';
			for (var i = 0; i < data.subMenus.length; i++) {
				control_submenu_html += "<li title='" + data.subMenus[i]+ "'><a > <span class='text-bold'>" + data.subMenus[i]
						+ "</span> </a></li>";
			}
			$('#right-sidebar ul').html(control_submenu_html);
			$('#right-sidebar ul li').first().addClass('active');
			$('#right-sidebar ul li').click(function() {
				var csmdesc = $(this).find('a span').html();
				ControlSubMenuClick(csmdesc);
			});
//			Setting Page Template
			$('#main-content .col-lg-8').html(data.pageTemplate);
			$('#controlMenuName').html(data.controlMenu[0]);
			$('#controlSubMenuName').html(data.subMenus[0]);
//			Loading Content
			$("#view").click(function(){
				window.open(data.demo_url);
				});
			$('#home').load(data.demo_url);
			Childurl = data.demo_url.substring(0, data.demo_url
					.lastIndexOf("/"));
			$('#htmldiv').html(
					'<textarea id="txt_html" class="editorclass"></textarea>');
			$('#cssdiv').html(
					'<textarea id="txt_css" class="editorclass"></textarea>');
			$('#jsdiv').html(
					'<textarea id="txt_js" class="editorclass"></textarea>');
			$('#txt_html').val(data.html_text);
			$('#txt_css').val(data.css_text);
			$('#txt_js').val(data.javascript_text);
			$("#val_c_id,#txt_c_id").val(data.c_id);
			// $('#filedownload').attr('href',data.download_url);
			 if(ActiveHeader=='Components'){
			FileUpload();
			FileDownload();
			$.getScript( "http://cdn.tinymce.com/4/tinymce.min.js", function( data, textStatus, jqxhr ) {
				CLEditor();
				});
			 Update();
			 }
			 $.unblockUI();
				}
		}
			});
}
function HeaderClick(Header){
	if (Header == 'Admin') {
		window.location = shortUrl + '/Admin'
		return false;
	}
	ActiveHeader=Header;
	$('#headerlist li').removeClass('active');
	$("#headerlist li[title='" + Header + "']").addClass('active');
	$.ajax({
		url : shortUrl + "/getContentsbyHeader?hm_desc="+Header,
		type : "GET",
		success : function(data) {
//			Setting Control Menu
			var control_menu_html = '';
			for (var i = 0; i < data.controlMenu.length; i++) {
				control_menu_html += "<li title='" + data.controlMenu[i] + "'> <a>"
						+ data.controlMenu[i] + "</a></li>";
			}
			$('#navigation-sidebar ul').html(control_menu_html);
			$('#navigation-sidebar ul li').first().addClass('active');
			$('#navigation-sidebar ul li').click(function() {
				var Control = $(this).find('a').html();
				ControlMenuClick(Control);
			});
//			Setting Sub Menu
			var control_submenu_html = '';
			for (var i = 0; i < data.subMenus.length; i++) {
				control_submenu_html += "<li title='" + data.subMenus[i]+ "'><a > <span class='text-bold'>" + data.subMenus[i]
						+ "</span> </a></li>";
			}
			$('#right-sidebar ul').html(control_submenu_html);
			$('#right-sidebar ul li').first().addClass('active');
			$('#right-sidebar ul li').click(function() {
				var csmdesc = $(this).find('a span').html();
				ControlSubMenuClick(csmdesc);
			});
//			Setting Page Template
			$('#main-content .col-lg-8').html(data.pageTemplate);
			$('#controlMenuName').html(data.controlMenu[0]);
			$('#controlSubMenuName').html(data.subMenus[0]);
//			Loading Content
			$("#view").click(function(){
				window.open(data.demo_url);
				});
			$('#home').load(data.demo_url);
			Childurl = data.demo_url.substring(0, data.demo_url
					.lastIndexOf("/"));
			$('#htmldiv').html(
					'<textarea id="txt_html" class="editorclass"></textarea>');
			$('#cssdiv').html(
					'<textarea id="txt_css" class="editorclass"></textarea>');
			$('#jsdiv').html(
					'<textarea id="txt_js" class="editorclass"></textarea>');
			$('#txt_html').val(data.html_text);
			$('#txt_css').val(data.css_text);
			$('#txt_js').val(data.javascript_text);
			$("#val_c_id,#txt_c_id").val(data.c_id);
			FileDownload();
			if(ActiveHeader=='Components'){
				FileUpload();
				$.getScript( "http://cdn.tinymce.com/4/tinymce.min.js", function( data, textStatus, jqxhr ) {
					CLEditor();
					});
				 Update();
				 }
			$.unblockUI();
		}
			});
}
function ControlMenuClick(Control){
	$('#navigation-sidebar ul li').removeClass('active');
	$("#navigation-sidebar ul li[title='" + Control + "']").addClass('active');
	$.ajax({
		url : shortUrl + "/getContentsbyControl?cm_desc="+Control,
		type : "GET",
		success : function(data) {
//	Setting Sub Menu
	var control_submenu_html = '';
	for (var i = 0; i < data.subMenus.length; i++) {
		control_submenu_html += "<li title='" + data.subMenus[i]+ "'><a > <span class='text-bold'>" + data.subMenus[i]
				+ "</span> </a></li>";
	}
	$('#right-sidebar ul').html(control_submenu_html);
	$('#right-sidebar ul li').first().addClass('active');
	$('#right-sidebar ul li').click(function() {
		var csmdesc = $(this).find('a span').html();
		ControlSubMenuClick(csmdesc);
	});
	
//	Setting Page Template
	$('#main-content .col-lg-8').html(data.pageTemplate);
	$('#controlMenuName').html(data.controlMenu[0]);
	$('#controlSubMenuName').html(data.subMenus[0]);
//	Loading Content
	$("#view").click(function(){
		window.open(data.demo_url);
		});
	$('#home').load(data.demo_url);
	Childurl = data.demo_url.substring(0, data.demo_url
			.lastIndexOf("/"));
	$('#htmldiv').html(
			'<textarea id="txt_html" class="editorclass"></textarea>');
	$('#cssdiv').html(
			'<textarea id="txt_css" class="editorclass"></textarea>');
	$('#jsdiv').html(
			'<textarea id="txt_js" class="editorclass"></textarea>');
	$('#txt_html').val(data.html_text);
	$('#txt_css').val(data.css_text);
	$('#txt_js').val(data.javascript_text);
	$("#val_c_id,#txt_c_id").val(data.c_id);
	// $('#filedownload').attr('href',data.download_url);
	FileDownload();
	if(ActiveHeader=='Components'){
		FileUpload();
		$.getScript( "http://cdn.tinymce.com/4/tinymce.min.js", function( data, textStatus, jqxhr ) {
			CLEditor();
			});
		 Update();
		 }
	$.unblockUI();
		}
	});
}
function ControlSubMenuClick(csm_desc){
	$('#right-sidebar ul li').removeClass('active');
	$("#right-sidebar ul li[title='" + csm_desc + "']").addClass('active');
	if(ActiveHeader=='Components'){
		TemporarySubMenuClick(csm_desc);
		return false;
	}
	else{
	$.ajax({
		url : shortUrl +"/getContentsbySubMenu?csm_desc="+csm_desc,
		type : "GET",
		success : function(data) {
//			Setting Page Template
			$('#main-content .col-lg-8').html(data.pageTemplate);
			$('#controlMenuName').html(data.controlMenu[0]);
			$('#controlSubMenuName').html(data.subMenus[0]);
//			Loading Content
			$("#view").click(function(){
				window.open(data.demo_url);
				});
			$('#home').load(data.demo_url);
			Childurl = data.demo_url.substring(0, data.demo_url
					.lastIndexOf("/"));
			$('#htmldiv').html(
					'<textarea id="txt_html" class="editorclass"></textarea>');
			$('#cssdiv').html(
					'<textarea id="txt_css" class="editorclass"></textarea>');
			$('#jsdiv').html(
					'<textarea id="txt_js" class="editorclass"></textarea>');
			$('#txt_html').val(data.html_text);
			$('#txt_css').val(data.css_text);
			$('#txt_js').val(data.javascript_text);
			$("#val_c_id,#txt_c_id").val(data.c_id);
			// $('#filedownload').attr('href',data.download_url);
			FileDownload();
			if(ActiveHeader=='Components'){
				FileUpload();
				$.getScript( "http://cdn.tinymce.com/4/tinymce.min.js", function( data, textStatus, jqxhr ) {
					CLEditor();
					});
				 Update();
				 }
			$.unblockUI();
		}
		});
	}
		}
function FileUpload() {
	$('#fileupload').click(function() {
		event.preventDefault();
		$('#inputfileupload').val('');
		$('#FileUploadModal').modal('show');
		return false;
	});
	var file = $('[name="file"]');
	$('#btn_Upload').click(function() {
						   if ($('#inputfileupload').get(0).files[0] == null
								|| $('#inputfileupload').get(0).files[0].size > 10240000) {
							// Notification("Validation Error","error","Please
							// Upload a ZIP file of size less than 10MB.");
							new PNotify(
									{
										title : "Validation Error",
										text : "Please Upload a ZIP file of size less than 10MB.",
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
									})
							return false;
						} else {
							$.ajax({
								url : shortUrl + '/uploadfile',
								type : "POST",
								data : new FormData(document
										.getElementById("fileForm")),
								enctype : 'multipart/form-data',
								processData : false,
								contentType : false,
								dataType : "text",
								success : function(data) {
									UploadSuccess();
									// Notification('success','success','File
									// Uploaded Successfully');
									console.log('file uploaded successfully');
								},
								error : function(request, status, error) {
									// Notification('Failed','error','Upload
									// Failed');
									console.log(error);
								}
							})
						}
					});
}
function UploadSuccess() {
	new PNotify({
		title : "Success",
		text : "File Uploaded Successfully",
		addclass : "stack-custom",
		type : "success",
		delay : 3000,
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
function UpdateSuccess() {
	new PNotify({
		title : "Success",
		text : "Updated Successfully",
		addclass : "stack-custom",
		type : "success",
		delay : 3000,
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
function FileDownload() {
	$('#filedownload,#tempdownload').click(function() {
		event.preventDefault();
		var c_id = $("#val_c_id").val();
		window.open(shortUrl + '/FileDownload?c_id=' + c_id, "_self");
	});
}
function Update(){
	$('#update').click(function() {
		$.ajax({
			url : shortUrl + "/setContents",
			type : "POST",
			data : {
				'c_id' : $("#val_c_id").val(),
				'html_txt' : tinymce.get("txt_html").getContent(),
				'css_txt' : tinymce.get("txt_css").getContent(),
				'javascript_txt' : tinymce.get("txt_js").getContent()
			},
			success : function(data) {
				UpdateSuccess();
			}
		});
	});
}
function LoginClick() {
	$('#login').click(function() {
		$(this).toggleClass('active');
		if (SuperUser == 2) {
			SuperUser = 1;
		} else {
			SuperUser = 2;
		}
		if(ActiveHeader=='Components'){
			TemporarySubMenuClick($('#controlSubMenuName').html());
		}
	});
}
function TemporarySubMenuClick(csm_desc){
	$('#right-sidebar ul li').removeClass('active');
	$("#right-sidebar ul li[title='" + csm_desc + "']").addClass('active');
	$.ajax({
		url : shortUrl + "/TempSubMenu?csm_desc="+csm_desc+"&&p_id="+SuperUser,
		type : "GET",
		success : function(data) {
//			Setting Page Template
			$('#main-content .col-lg-8').html(data.pageTemplate);
			$('#controlMenuName').html(data.controlMenu[0]);
			$('#controlSubMenuName').html(data.subMenus[0]);
			FileUpload();
			FileDownload();
//			Loading Content
			$("#view").click(function(){
				window.open(data.demo_url);
				});
			$('#home').load(data.demo_url);
			Childurl = data.demo_url.substring(0, data.demo_url
					.lastIndexOf("/"));
			$('#htmldiv').html(
					'<textarea id="txt_html" class="editorclass"></textarea>');
			$('#cssdiv').html(
					'<textarea id="txt_css" class="editorclass"></textarea>');
			$('#jsdiv').html(
					'<textarea id="txt_js" class="editorclass"></textarea>');
			$('#txt_html').val(data.html_text);
			$('#txt_css').val(data.css_text);
			$('#txt_js').val(data.javascript_text);
			$("#val_c_id,#txt_c_id").val(data.c_id);
			FileDownload();
			if(ActiveHeader=='Components'){
				FileUpload();
				$.getScript( "http://cdn.tinymce.com/4/tinymce.min.js", function( data, textStatus, jqxhr ) {
					CLEditor();
					});
				 Update();
				 }
			$.unblockUI();
		}
		});
}
