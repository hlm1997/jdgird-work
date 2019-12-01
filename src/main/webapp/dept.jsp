<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set value="${pageContext.request.contextPath}" var="app"></c:set>

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>BOOT客户管理系统V2</title>
    <%--引入bootstrap的核心css--%>
    <link rel="stylesheet" href="${app}/statics/boot/css/bootstrap.min.css">
    <%--引入jqgrid的核心css--%>
    <%--<link rel="stylesheet" href="${app}/jqgrid/css/ui.jqgrid.css">--%>
    <%--jqgird的主题css--%>
    <%-- <link rel="stylesheet" href="${app}/jqgrid/css/css/start/jquery-ui-1.8.16.custom.css">--%>
    <link rel="stylesheet" href="${app}/statics/jqgrid/css/trirand/ui.jqgrid-bootstrap.css">
    <%--引入jquery的js--%>
    <script src="${app}/statics/boot/js/jquery-3.3.1.min.js"></script>
    <%--引入bootstrap的js--%>
    <script src="${app}/statics/boot/js/bootstrap.min.js"></script>
    <%--jqgird的国际化js--%>
    <script src="${app}/statics/jqgrid/js/trirand/i18n/grid.locale-cn.js"></script>
    <%--jqgird的js--%>
    <script src="${app}/statics/jqgrid/js/trirand/jquery.jqGrid.min.js"></script>
    <script>
        $(function () {
            $("#tb").jqGrid({
                styleUI: 'Bootstrap',
                url: "${app}/dept/findAll",
                datatype: "json",
                mtype: "post",
                colNames: ["编号", "部门", "操作"],
                autowidth: true,
                pager: "#page",
                rowNum: 3,
                viewrecords: true,
                editurl: "${app}/dept/edit",
                rowList: [3, 6, 9, 12],
                colModel: [
                    {
                        name: "id",//第一列的值
                        editable: true

                    },
                    {
                        name: "name",//第二列的值
                        editable: true
                    },
                    {
                        name: "xxxxx",
                        formatter: function (cellvalue, options, rowObject) {
                            return "<a  href=\"javascript:edit('" + rowObject.id + "')\" class=\"btn btn-default btn-primary\"><span class=\"glyphicon glyphicon-pencil\"></span> 修改</a> <a href=\"javascript:del('" + rowObject.id + "')\" class=\"btn btn-default btn-danger\"><span class=\"glyphicon glyphicon-trash\"></span> 删除</a>"
                        }
                    }

                ],
                multiselect: true,
                caption: "部门管理",//表头
                toolbar: ['true', 'top'],//工具栏
                onSelectAll: function (aRowids, status) {

                },
                gridComplete: function () {

                },
                ondblClickRow: function (rowid, iRow, iCol, e) {

                }
            }).jqGrid("navGrid", "#page", {edit: false, add: false, del: false, search: false, refresh: false})
            $("#add").click(function () {
                $("#tb").jqGrid('editGridRow', "new", {
                    height: 300,
                    reloadAfterSubmit: true
                });
            })
            $("#del").click(function () {
                var gr = $("#tb").jqGrid('getGridParam', 'selrow');
                if (gr != null)
                    $("#tb").jqGrid('delGridRow', gr, {
                        reloadAfterSubmit: true
                    });
                else
                    alert("Please Select Row to delete!");

            })
            $("#update").click(function () {
                var gr = $("#tb").jqGrid('getGridParam', 'selrow');
                if (gr != null)
                    $("#tb").jqGrid('editGridRow', gr, {
                        height: 300,
                        reloadAfterSubmit: true
                    });
                else
                    alert("Please Select Row");
            })
            $("#t_tb").append("<a href=\"javascript:add()\" class=\"btn btn-default btn-info\"><span class=\"glyphicon glyphicon-plus\"></span> 添加</a>\n")
        })

        function add() {
            $("#tb").jqGrid('editGridRow', "new", {
                height: 300,
                reloadAfterSubmit: true
            });
        }

        function del(gr) {

            if (gr != null)
                $("#tb").jqGrid('delGridRow', gr, {
                    reloadAfterSubmit: true
                });
            else
                alert("Please Select Row to delete!");
        }

        function edit(gr) {
            // var gr = $("#tb").jqGrid('getGridParam', 'selrow');
            if (gr != null)
                $("#tb").jqGrid('editGridRow', gr, {
                    height: 300,
                    reloadAfterSubmit: true
                });
            else
                alert("Please Select Row");
        }
    </script>
</head>
<body>
<table id="tb" class="table"></table>

<div id="page"></div>
</body>
</html>




