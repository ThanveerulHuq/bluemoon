/**
 * This script is used for common functionality in the Application.
 */

var jq = {

    initCallbacks: [],

    registerInit: function (callback) {
        jq.initCallbacks.push(callback);
    },
    globalInit:{
        alertTypes: {
            alert: 'alert',
            success: 'success',
            error: 'error',
            warning: 'warning',
            information: 'information',
            confirm: 'confirm'
        },
        style: {
            confirm: 'glyphicon glyphicon-ok-sign',
            error: 'glyphicon glyphicon-remove-sign',
            warn: 'glyphicon glyphicon-exclamation-sign',
            info: 'glyphicon glyphicon-info-sign',
            accord: {
                header: "ui-icon-circle-arrow-e",
                activeHeader: "ui-icon-circle-arrow-s"
            }
        }
	},
    init: function () {
        // Iterate to execute all the registered functions
        for (var i = 0; i < jq.initCallbacks.length; i++) {
            var func = jq.initCallbacks[i];
            func();
        }
    }
};
	
jq.common={
	uri:function()
	{
		return $(location)[0].origin;
	},
	ajax:{		
		blockUI: function () {
            $.blockUI({
                message: '<h3>Processing...</h3>',             
                css: {
                    padding: '10px',
                    width:'400px',
                    '-webkit-border-radius': '10px',
                    '-moz-border-radius': '10px',
                    'border-radius': '10px'
                },
                overlayCSS: { backgroundColor: '#5c5c5c' }
            });
        },
		
        unblockUI: function () {
            $.unblockUI();
        },
        
		ajaxSend:function () {
            $(document).ajaxSend(function (e, jqxhr, jqoptions) {
                // will be raised whenever an AJAX request starts
                if (jqoptions.url.indexOf('_search=') == -1) {
                    jq.common.ajax.blockUI();
                }
            });
        },
	        
        ajaxStop:function () {
            $(document).ajaxStop(function (e, jqxhr, jqoptions) {
                // will be raised whenever an AJAX request completes (success or failure)
                jq.common.ajax.unblockUI();
                // set help info
            });
        },
        ajaxError:function () {
//            $(document).ajaxError(function (e, jqxhr, ajaxSettings, exception) {
//                // will be raised whenever an AJAX request fails
//
//                // If the text is changed here, please change in Web.Config as well.
//                if (exception !== null && exception !== '') {
//                    if (jqxhr.responseText.indexOf('Session Expired') == -1) {
//                        var exText = exception + ': ' + jqxhr.responseText.substring(jqxhr.responseText.indexOf('<title>') + 7, jqxhr.responseText.lastIndexOf('</title>'));
//                        jq.ui.dialog.info(jq.globalInit.style.error,exText, true, 'Internal Server Error', true, false, 500);
//                    }
//                }
//                // will be raised whenever an AJAX request starts
//            });
        }
	},
	dialog:{
        show: function (obj, modal, title, autoOpen, closeOnEsc, hideClose, resize, width, height, show,hide, myPos,atPos, fnOnClose, clearHTML) {
            obj.dialog({
                title: title,
                autoOpen: autoOpen,
                dialogClass: (hideClose ? 'noclose' : ''),
                closeOnEscape: closeOnEsc,
                show: { effect: show, direction: 'left' },
                hide: { effect: hide, direction: 'left' },
                resizable: resize,
                height: height,
                width: width,
                modal: modal,
                position:{ my: myPos, at: atPos},
                //create: function (event) { $(event.target).parent().css('position', 'fixed'); },
                open: function (event, ui) { // added to disable the horizontal scrolling
                    obj.css('overflow-x', 'hidden');//moved to Layout.less
                },
                close: function (event, ui) {
                    if (clearHTML) $(this).html('');
                    if (fnOnClose === null) $(this).dialog('destroy');
                    else fnOnClose();
                }
            });
        },

        popUpPage: function (obj, modal, title, autoOpen, closeOnEsc, hideClose, resize, width, height, fnOnClose, clearHTML) {
            //  $('<div></div>').appendTo('body')
            //  .html('<p><span style="float: left; margin: 0 7px 50px 0;"></span>' + obj.html() + '</p>')
            obj.dialog({
                title: title,
                autoOpen: autoOpen,
                dialogClass: (hideClose ? 'noclose' : ''),
                closeOnEscape: closeOnEsc,
                //show: { effect: 'drop', direction: 'up' },
                //hide: { effect: 'drop', direction: 'down' },
                resizable: resize,
                height: height,
                width: width,
                modal: modal,
                //create: function (event) { $(event.target).parent().css('position', 'fixed'); },
               /* buttons: {
                    Close: function () {                        
                        $(obj).dialog('close');
                        //if (clearHTML) $(this).html('');
                        //if (fnOnClose === null) $(this).dialog('close');
                        //else fnOnClose();
                        //$(this).remove();
                    }
                },*/
                open: function (event, ui) { // added to disable the horizontal scrolling
                    obj.css('overflow-x', 'hidden');//moved to Layout.less
                },
                close: function (event, ui) {
                    if (fnOnClose === null) $(this).dialog('destroy');
                    else fnOnClose();
                    if (clearHTML) $(this).html('');
                }
            });
        },

        confirm: function (msg, modal, title, autoOpen, hideClose, closeOnEsc, resize, width, fnYes, fnNo) {
            $('<div></div>').appendTo('body')
                .html('<p><span class="' + jq.globalInit.style.confirm + '" style="float: left; margin: 0 7px 50px 0;"></span>' + msg + '</p>')
                .dialog({
                    modal: modal,
                    title: title,
                    zIndex: 10000,
                    autoOpen: autoOpen,
                    closeOnEscape: closeOnEsc,
                    dialogClass: (hideClose ? 'noclose' : ''),
                    //create: function (event) { $(event.target).parent().css('position', 'fixed'); },
                    //show: { effect: 'drop', direction: 'up' },
                    //hide: { effect: 'drop', direction: 'down' },
                    width: width,
                    resizable: resize,
                    buttons: {
                        Yes: function () {
                            if (fnYes != null && fnYes !== 'undefined') fnYes();
                            $(this).dialog("close");
                        },
                        No: function () {
                            if (fnNo != null && fnNo !== 'undefined') fnNo();
                            $(this).dialog("close");
                        }
                    },
                    close: function (event, ui) {
                        $(this).remove();
                    }
                });
        },

        info: function (style, msg, modal, title, autoOpen, resize, width, hideClose, closeOnEsc, fnOK) {
            $('<div></div>').appendTo('body')
                .html('<p><span class="' + style + '" style="float: left; margin: 0 7px 50px 0;"></span>' + msg + '</p>')
                .dialog({
                    modal: modal,
                    title: title,
                    zIndex: 10000,
                    autoOpen: autoOpen,
                    closeOnEscape: closeOnEsc,
                    dialogClass: (hideClose ? 'noclose' : ''),
                    //create: function (event) { $(event.target).parent().css('position', 'fixed'); },
                    //show: { effect: 'drop', direction: 'up' },
                    //hide: { effect: 'drop', direction: 'down' },
                    width: width,
                    resizable: resize,
                    height: 'auto',
                    buttons: {
                        OK: function () {
                            $(this).dialog("close");
                            if(fnOK !== null && fnOK !== undefined) fnOK();
                        }
                    },
                    close: function (event, ui) {
                        $(this).remove();
                    }
             });
        }
	}
};

$(document).ready(function () {

    $(document).ajaxSend(function (e, jqxhr, jqoptions) {
        // will be raised whenever an AJAX request starts
        if (jqoptions.url.indexOf('_search=') == -1) {
            jq.common.ajax.blockUI();
        }
    });
	
    $(document).ajaxStop(function (e, jqxhr, jqoptions) {
        // will be raised whenever an AJAX request completes (success or failure)
        jq.common.ajax.unblockUI();
        // set help info
    });
    
//    $(document).ajaxError(function (e, jqxhr, ajaxSettings, exception) {
//        // will be raised whenever an AJAX request fails
//        // If the text is changed here, please change in Web.Config as well.
//        if (exception !== null && exception !== '') {
//            if (jqxhr.responseText.indexOf('Session Expired') == -1) {
//                var exText = exception + ': ' + jqxhr.responseText.substring(jqxhr.responseText.indexOf('<title>') + 7, jqxhr.responseText.lastIndexOf('</title>'));
//                jq.common.dialog.info(jq.globalInit.style.error,exText, true, 'Internal Server Error', true, false, 500);
//            }
//        }
//        // will be raised whenever an AJAX request starts
//    });
	
    $("input[type=number]").keypress(function(e) {
    	var charCode = (e.which) ? e.which : e.keyCode;
    	if (charCode != 46 && charCode > 31 && (charCode < 48 || charCode > 57)) {
    		return false;
    	}
    });
        
    $('#version').hide();

    $("#versionLink").click(function () {
        // $("#version").dialog("open"); 
        jq.common.dialog.show($("#version"), false, "Version", true, true, true, true, 600, 300, "slide", "slide", "left+15 bottom-25", "left bottom", null, true);
    });

    $("#accordion").accordion({
        heightStyle: "content",
        autoHeight: true,
        navigation: true,
        icons: {
            header: jq.globalInit.style.accord.header,
            activeHeader: jq.globalInit.style.accord.activeHeader
        }
    });

});

var getColumnIndex = function (grid, columnIndex) {
    var cm = grid.jqGrid('getGridParam', 'colModel'), i, l = cm.length;
    for (i = 0; i < l; i++) {
        if ((cm[i].index || cm[i].name) === columnIndex) {
            return i; // return the colModel index
        }
    }
    return -1;
};

var refreshSerchingToolbar = function ($grid) {
    var postData = $grid.jqGrid('getGridParam', 'postData'), filters, i, l,
            rules, rule, iCol, cm = $grid.jqGrid('getGridParam', 'colModel'),
            cmi, control, tagName;

    for (i = 0, l = cm.length; i < l; i++) {
        control = $("#gs_" + $.jgrid.jqID(cm[i].name));
        if (control.length > 0) {
            tagName = control[0].tagName.toUpperCase();
            if (tagName === "SELECT") { // && cmi.stype === "select"
                control.find("option[value='']")
                        .attr('selected', 'selected');
            } else if (tagName === "INPUT") {
                control.val('');
            }
        }
    }

    if (typeof (postData.filters) === "string") {
        var operands = { eq: "==", ne: "!", lt: "<", le: "<=", gt: ">", ge: ">=", bw: "^", bn: "!^", "in": "=", ni: "!=", ew: "|", en: "!@", cn: "~", nc: "!~", nu: "#", nn: "!#" }
        filters = postData.filters != "" ? $.parseJSON(postData.filters) : null;
        if (filters && filters.groupOp === "AND" && typeof (filters.groups) === "undefined") {
            // only in case of advance searching without grouping we import filters in the
            // searching toolbar
            rules = filters.rules;
            for (i = 0, l = rules.length; i < l; i++) {
                rule = rules[i];
                iCol = getColumnIndex($grid, rule.field);
                if (iCol >= 0) {
                    cmi = cm[iCol];
                    control = $("#gs_" + $.jgrid.jqID(cmi.name));
                    if (control.length > 0 &&
                            (((typeof (cmi.searchoptions) === "undefined" ||
                            typeof (cmi.searchoptions.sopt) === "undefined")) ||
                                (typeof (cmi.searchoptions) === "object" &&
                                    $.isArray(cmi.searchoptions.sopt) &&
                                    cmi.searchoptions.sopt.length > 0))) {
                        tagName = control[0].tagName.toUpperCase();
                        if (tagName === "SELECT") { // && cmi.stype === "select"
                            control.find("option[value='" + $.jgrid.jqID(rule.data) + "']")
                                    .attr('selected', 'selected');
                        } else if (tagName === "INPUT") {
                            control.val(rule.data);
                        }
                    }
                    $('a[colindex=' + iCol + ']').text(operands[rule.op]);
                    $('*[colindex=' + iCol + ']').attr("soper", rule.op);
                }
            }
        }
    }
};

var ops = [
			{ "name": "eq", "description": "equal", "operator": "=" },
			{ "name": "ne", "description": "not equal", "operator": "<>" },
			{ "name": "lt", "description": "less", "operator": "<" },
			{ "name": "le", "description": "less or equal", "operator": "<=" },
			{ "name": "gt", "description": "greater", "operator": ">" },
			{ "name": "ge", "description": "greater or equal", "operator": ">=" },
			{ "name": "bw", "description": "begins with", "operator": "LIKE" },
			{ "name": "bn", "description": "does not begin with", "operator": "NOT LIKE" },
			{ "name": "in", "description": "in", "operator": "IN" },
			{ "name": "ni", "description": "not in", "operator": "NOT IN" },
			{ "name": "ew", "description": "ends with", "operator": "LIKE" },
			{ "name": "en", "description": "does not end with", "operator": "NOT LIKE" },
			{ "name": "cn", "description": "contains", "operator": "LIKE" },
			{ "name": "nc", "description": "does not contain", "operator": "NOT LIKE" },
			{ "name": "nu", "description": "is null", "operator": "IS NULL" },
			{ "name": "nn", "description": "is not null", "operator": "IS NOT NULL"}];

var getStringForGroup = function (columns, group) {

    var s = "(", index;
    if (group.groups !== undefined) {
        for (index = 0; index < group.groups.length; index++) {
            if (s.length > 1) {
                s += " " + group.groupOp + " ";
            }
            try {
                s += getStringForGroup(columns, group.groups[index]);
            } catch (eg) { alert(eg); }
        }
    }

    if (group.rules !== undefined) {
        try {
            for (index = 0; index < group.rules.length; index++) {
                if (s.length > 1) {
                    s += " " + group.groupOp + " ";
                }
                s += getStringForRule(columns, group.rules[index]);
            }
        } catch (e) { alert(e); }
    }

    s += ")";

    if (s === "()") {
        return ""; // ignore groups that don't have rules
    } else {
        return s;
    }
}


var getStringForRule = function (columns, rule) {
    var opUF = "", opC = "", i, cm, ret, val;
    var numtypes = ['int', 'integer', 'float', 'number', 'currency']; // jqGrid
    for (i = 0; i < ops.length; i++) {
        if (ops[i].name === rule.op) {
            opUF = ops[i].operator;
            opC = ops[i].name;
            break;
        }
    }
    for (i = 0; i < columns.length; i++) {
        if (columns[i].name === rule.field) {
            cm = columns[i];
            break;
        }
    }
    val = rule.data;
    if (opC === 'bw' || opC === 'bn') { val = val + "%"; }
    if (opC === 'ew' || opC === 'en') { val = "%" + val; }
    if (opC === 'cn' || opC === 'nc') { val = "%" + val + "%"; }
    if (opC === 'in' || opC === 'ni') { val = " (" + val + ")"; }
    checkData(rule.data, cm);
    if ($.inArray(cm.searchtype, numtypes) !== -1 || opC === 'nn' || opC === 'nu') { ret = rule.field + " " + opUF + " " + val; }
    else { ret = rule.field + " " + opUF + " \"" + val + "\""; }
    return ret;
};

var checkData = function (val, colModelItem) {
    var ret = [true, ""];
    if ($.isFunction(colModelItem.searchrules)) {
        ret = colModelItem.searchrules(val, colModelItem);
    } else if ($.jgrid && $.jgrid.checkValues) {
        try {
            ret = $.jgrid.checkValues(val, -1, null, colModelItem.searchrules, colModelItem.label);
        } catch (e) { }
    }
    if (ret && ret.length && ret[0] === false) {
    }
};