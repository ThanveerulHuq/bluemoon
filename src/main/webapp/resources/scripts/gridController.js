$.jgrid.defaults.width = 1000;
$.jgrid.defaults.responsive = true;
$.jgrid.defaults.styleUI = 'Bootstrap';

function loadGrid(element, pager, url, colArr){
        $(element).jqGrid({
            url: url,
            mtype: "POST",
            datatype: "json",
            colModel: colArr,
            rownumbers: true,
            rownumWidth: 35,
            viewrecords: true,
            shrinkToFit: false,
        });
}