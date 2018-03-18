function loadGrid(element, url, colArr){
        $(element).jqGrid({
            url: url,
            mtype: "GET",
			styleUI : 'Bootstrap',
            datatype: "json",
            colModel: colArr,
			viewrecords: true,
            height: 250,
        });
}