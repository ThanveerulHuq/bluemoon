var url = document.URL,shortUrl=url.substring(0,url.lastIndexOf("/"));
var Childurl='';
var SuperUser=1;
var ActiveHeader='';
$('document').ready(function() {
	headerMenu();
	LoginClick();
});
function headerMenu() {
	// Ajax for getting Header Menu
	$.ajax({url : shortUrl + "/getActiveHeader",
			success : function(data1) {
					$.ajax({
								url : shortUrl
										+ "/getadmin?user_name=Srinivas_Vardhan",
								type : "GET",
								dataType : "text",
								success : function(data) {
									if (data == "Y") {
										var header_html = "<li title='Admin'><a class='navigation-link' > <span class='text-bold'>Admin</span> </a></li>";
										for (var i = 0; i < data1.length; i++) {
											header_html += "<li title='"
													+ data1[i].hm_desc
													+ "'><a class='navigation-link' > <span class='text-bold'>"
													+ data1[i].hm_desc
													+ "</span> </a></li>";
										}
									} else {
										var header_html = ''
										for (var i = 0; i < data1.length; i++) {
											header_html += "<li title='"
													+ data1[i].hm_desc
													+ "'><a class='navigation-link' > <span class='text-bold'>"
													+ data1[i].hm_desc
													+ "</span> </a></li>";
										}

									}

									$('#headerlist').html(header_html);

									$('#headerlist li').click(
											function() {
												var Header = $(this).find(
														'a span').html();
												Headerclick(Header);
											});
									var QUrl = url.substring(url
											.lastIndexOf("="));
									var hm_desc = QUrl.replace("=", "")
									if (window.location.search == "") {
										Headerclick($('#headerlist li').first()
												.find('a span').html());
									} else {
										Headerclick(hm_desc);
									}

								}
							});
				}
			});
}
function Headerclick(Header) {
	if (Header == 'Admin') {
		window.location = shortUrl + '/Admin'
		return false;
	}
	ActiveHeader=Header;
	$('#headerlist li').removeClass('active');
	$("#headerlist li[title='" + Header + "']").addClass('active');
	// Ajax for getting Control Menu
	$.ajax({
		url : shortUrl + "/getHomeControlMenu?Header=" + Header,
		dataType : 'json',
		success : function(data) {
			var control_menu_html = '';
			for (var i = 0; i < data.length; i++) {
				control_menu_html += "<li title='" + data[i].cm_desc + "'> <a>"
						+ data[i].cm_desc + "</a></li>";
			}
			$('#navigation-sidebar ul').html(control_menu_html);
			$('#navigation-sidebar ul li').click(function() {

				var Control = $(this).find('a').html();
				ControlMenuClick(Control);
			});
			ControlMenuClick($('#navigation-sidebar ul li').first().find('a')
					.html());
		}
	});
}
function ControlMenuClick(Control) {
	$('#navigation-sidebar ul li').removeClass('active');
	$("#navigation-sidebar ul li[title='" + Control + "']").addClass('active');
	// ajax call for getting sub-menus
	$.ajax({
		url : shortUrl + "/getControlSubMenu?Control=" + Control,
		dataType : 'json',
		success : function(data) {
			var control_submenu_html = '';
			for (var i = 0; i < data.length; i++) {
				control_submenu_html += "<li title='" + data[i].csm_desc
						+ "'><a > <span class='text-bold' style='cursor: pointer'>" + data[i].csm_desc
						+ "</span> </a></li>";
			}
			$('#right-sidebar ul').html(control_submenu_html);
			$('#right-sidebar ul li').click(function() {
				var csmdesc = $(this).find('a span').html();
				if(ActiveHeader=='Components')
					{
				ControlSubMenuClick1(csmdesc);
					}
				else{
					ControlSubMenuClick(csmdesc);
				}
			});
			if(ActiveHeader=='Components'){
				ControlSubMenuClick1($('#right-sidebar ul li').first().find(
				'a span').html());
			}else{
			ControlSubMenuClick($('#right-sidebar ul li').first().find(
					'a span').html());
			}
		}
	});
}
function ControlSubMenuClick(csmdesc) {
	// Ajax for getting Page Template
	$('#right-sidebar ul li').removeClass('active');
	$("#right-sidebar ul li[title='" + csmdesc + "']").addClass('active');
	$.ajax(shortUrl + "/getTemplate?csmdesc=" + csmdesc, {
		ajax : 'true',
		success : function(data) {
			var a = data.pageMaster.page_template;
			$('#main-content .col-lg-8').html(a);
			$('#controlMenuName').html(data.controlMenu.cm_desc);
			$('#controlSubMenuName').html(data.csm_desc);
			ContentLoad(csmdesc);
			FileUpload();
			FileDownload();
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
	});
}
		

function FileUpload() {
	$('#fileupload').click(function() {
		event.preventDefault();
		$('#inputfileupload').val('');
		$('#FileUploadModal').modal('show');
		return false;
	});
	var file = $('[name="file"]');
	$('#btn_Upload').on('click',
					function() {
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
									//        	Notification('Failed','error','Upload Failed');
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
function ContentLoad(csmdesc) {
	$.ajax(shortUrl + "/getContents?csmdesc=" + csmdesc, {
		ajax : 'true',
		success : function(data) {
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
			$('#txt_html').val(data.html_txt);
			$('#txt_css').val(data.css_txt);
			$('#txt_js').val(data.javascript_txt);
			$("#val_c_id,#txt_c_id").val(data.c_id);
			// $('#filedownload').attr('href',data.download_url);
			 $.unblockUI();
			 CLEditor();
		}
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
		ControlSubMenuClick1($('#controlSubMenuName').html());
	});
}



function ControlSubMenuClick1(csmdesc) {
	$('#right-sidebar ul li').removeClass('active');
	$("#right-sidebar ul li[title='" + csmdesc + "']").addClass('active');
	$.ajax({
		url : shortUrl + '/editdata?Page_Id=' + SuperUser,
		success : function(data) {
			$('#main-content .col-lg-8').html(data.page_template);
			ContentLoad(csmdesc);
			FileUpload();
			FileDownload();
			$.ajax(shortUrl + "/getTemplate?csmdesc=" + csmdesc, {
				ajax : 'true',
				success : function(data) {
					$('#controlMenuName').html(data.controlMenu.cm_desc);
					$('#controlSubMenuName').html(data.csm_desc);
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
			});
		}
	});
}