
var url = document.URL,shortUrl=url.substring(0,url.lastIndexOf("/"));

function JQGrid()
{
            $("#contents").jqGrid({
                url: shortUrl+"/adminjsondata",
                datatype: "json",
                colNames: ['Edit','Page Description','Active','Created By','Creation Date','Modified By','Modified Date'],
                colModel: [
                           { name: 'p_id', index: 'p_id', width: 50, align: 'center',formatter:editLink,sortable:false,search: false},
                           { name: 'p_desc', index: 'p_desc', width: 250, align: 'left', search: true, searchoptions: { sopt: ['bw','cn', 'eq', 'ew']} },
//                           { name: 'page_template', index: 'page_template', width: 250, align: 'left', search: true, searchoptions: { sopt: ['bw','cn', 'eq', 'ew']} },
                           { name: 'active', index: 'active', width: 120, align: 'left', search: true, searchoptions: { sopt: ['bw','cn', 'eq', 'ew']} },
                           { name: 'created_by', index: 'created_by', width: 250, align: 'left', search: true, searchoptions: { sopt: ['bw','cn', 'eq', 'ew']} },
                           { name: 'created_date', index: 'created_date', width: 150, align: 'left', search: true,formatter:FormatDate, searchoptions: { sopt: ['bw','cn', 'eq', 'ew']} },
                           { name: 'modified_by', index: 'modified_by', width: 250, align: 'left', search: true, searchoptions: { sopt: ['bw','cn', 'eq', 'ew']} },
                           { name: 'modified_date', index: 'modified_date', width: 150, align: 'left', search: true,formatter:FormatDate, searchoptions: { sopt: ['bw','cn', 'eq', 'ew']} },
                ],
				sortorder : 'asc',
				loadonce: true,
				viewrecords: true,
                height: $(window).height() - 330,
                rowNum: 7,
                rowList: [7, 15,25,50],
                width: $(window).width() - 500,
                shrinkToFit: false,
                multiselect: false,
                autowidth: false,
              //  scroll: true,
                gridview: true,
                //scrollOffset: 0,
                altRows:true,
                altclass:'altrow',
                pager: "#navbtns",
                loadComplete: function () {
                    $('#gsh_contents_pid').html('');
                 }
            }); 
            function editLink(cellValue, options, rowdata, action)
            {
            	return '<span class="ion-edit" type="button" title="'+cellValue+'" data-toggle="modal" data-target="#AddPageModal" onclick="editdata('+cellValue+')"></span>';
            }
            
            function FormatDate(cellvalue, options, rowObject)
            {
            	var d=new Date(cellvalue);
        		return d.getDate()+'-'+d.getMonth()+'-'+d.getFullYear()+' '+d.getHours()+':'+d.getMinutes();
            }
            /* function defaultval(cellValue, options, rowdata, action)
            {
            	return '<xmp>"'+cellValue+'"</xmp>';
            } */
            $('#contents').navGrid('#navbtns',
                    { 
            	edit: false, add: false, del: false, search: false, refresh: true, view: false,
                 cloneToTop: false}, {},

            	{}, // default settings for add
            	{}, // delete
            	{}).navSeparatorAdd('#Pager');
            
            
            $("#contents").jqGrid('filterToolbar', { stringResult: true, searchOnEnter: true, searchOperators: true,
                beforeSearch: function () {
                	String.prototype.replaceAll = function (find, replace) {
        			    var str = this;
        			    return str.replace(new RegExp(find.replace(/[-\/\\^$*+?.()|[\]{}]/g, '\\$&'), 'g'), replace);
        			};
        			
                    var postData = $("#contents").jqGrid('getGridParam', 'postData');
                    var columns = $("#contents").jqGrid('getGridParam', 'colModel');
                    postData.filters = postData.filters.replaceAll("\\", "");
                    postData.filters = postData.filters.replaceAll("\":[{\"","':[{'").replaceAll("\"},{\"","'},{'").replaceAll("{\"","{'").replaceAll("\":\"","':'").replaceAll("rules\":","rules':").replaceAll("\",\"","','").replaceAll("\"}]}","'}]}");
                    postData.filters = postData.filters.replaceAll("\"", "\\\\\\\"");
                    postData.filters = postData.filters.replaceAll("':[{'","\":[{\"").replaceAll("'},{'","\"},{\"").replaceAll("{'","{\"").replaceAll("':'","\":\"").replaceAll("rules':","rules\":").replaceAll("','","\",\"").replaceAll("'}]}","\"}]}");
                    
                    var filters = $.parseJSON(postData.filters);
                
                }
            });
                    $('#refresh_contents div').append("<span>Reload</span>");
        	$('INPUT[id^="gs_"]').attr( "placeholder", "filter" ).addClass('form-control input-sm');
}

function saveData()
{
$('#btn_submit').click(function(){
				if(($('#addesc').val() == "") || ($("#template").val()=="")||($('#dll_PageTemplateActive').val()==null)){
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
				
				$.ajax({
				url:shortUrl+"/savedata",
				data: {  
					'Page_Id':$("#pageid").val(),
					'PageDescription':$("#addesc").val(),
					/*'Pagetemplate': tinymce.get("template").getContent(),*/
					'Pagetemplate': $("#template").val(),
					 'active':$('#dll_PageTemplateActive option:selected').val()
				    },
				success: function (data) {
					$("#contents").setGridParam({datatype:'json', page:1}).trigger('reloadGrid');
				 $('#pageid').val("0");
				 $("#addesc").val("");
				 /*$('#temptext').html('<textarea id="template"></textarea>');*/
//				 tinymce.get("template").setContent("");
				 $('#template').val('');
				 /*clEditor();*/
				 
				 $('.modal-title').html('Add Page Template');
				},
				    error:function(request, status, error)
				    {
				    	console.log(error);
				    }
				});
				});
}


$('#btn_submit').click(function() {
	   if(($('#pageid').val() == "")||($('#addesc').val() == "")||($('#dll_PageTemplateActive').val()=="") ){
	       $('#show_error').show();
	       return false;
	   }
	  
	   });
function addPage()
{
	$("#addpage").click(function(){
		$('#pageid').val("0");
		 $("#addesc").val("");
		 $('#dll_PageTemplateActive').val(0);
		 /*$('#temptext').html('<textarea id="template"></textarea>');*/
//		 tinymce.get("template").setContent("");
		 $('#template').val('');
			/*clEditor();*/
		 $('.modal-title').html('Add Page Template');
		 $('div .mce-branding-powered-by').removeClass();
		 $('#mceu_35-body').remove();
	});
}	

function editdata(p_id)
{
	$('.modal-title').html('Edit Page Template');
	$.ajax({
		url:shortUrl+"/editdata",
		data:
			{
			'Page_Id':p_id
			},
		success:function(data)
		{
			
			$('#pageid').val(data.p_id);
			
			$('#addesc').val(data.p_desc);
			$('#dll_PageTemplateActive').val(data.active);
			/*$('#temptext').html('<textarea id="template"></textarea>');*/
//			tinymce.get("template").setContent(data.page_template);
			/*var tinyString='<xmp>'+data.page_template+'</xmp>';*/
			$('#template').val(data.page_template);
			/*clEditor();*/
		},
		error:function(request, status, error)
		{	
			console.log(error);
		}
	});
}		

var css= shortUrl+'/resources/styles/bootstrap';
var bootstrapcss=css+"/SanmBootstrap1.css,";
/*var homecss=css+"/HomePageTemplate.css,";*/
//var homecss=shortUrl+"/www.tinymce.com/css/codepen.min.css,"
var jqui="http://code.jquery.com/ui/1.9.1/themes/base/jquery-ui.css,";
var font="https://fonts.googleapis.com/css?family=Montserrat:500" ;
/*function clEditor(){
	tinymce.init({
		  selector: '#template',
		  height: 200,
		  width:858,
		  menubar: true,
		  forced_root_block : false,
		  plugins: [
		    'advlist autolink lists link image charmap print preview anchor',
		    'searchreplace visualblocks code fullscreen'
		  ],
		  toolbar: ' insert | styleselect ',
		
	
		content_css:bootstrapcss+jqui+font,
		nowrap : true,
		    constrain_menus : true,
		});
	
	
}*/

$('document').ready(function(){
	JQGrid();
	saveData();
	addPage();
//	clEditor();
});