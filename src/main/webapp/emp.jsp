<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set value="${pageContext.request.contextPath}" var="app"></c:set>

<script>
    $(function () {
        $("#tb").jqGrid({
            styleUI: 'Bootstrap',
            url: "${app}/emp/findAllByPage",
            datatype: "json",
            mtype: "post",
            colNames: ["编号", "姓名", "生日", "年龄", "部门", "操作"],
            autowidth: true,
            pager: "#page",
            rowNum: 3,
            viewrecords: true,
            editurl: "${app}/emp/edit",
            rowList: [3, 6, 9, 12],
            colModel: [
                {
                    name: "id"

                },
                {
                    name: "name",
                    editable: true
                },
                {
                    name: "bir",

                    editable: true
                },
                {
                    name: "age",

                    editable: true
                },
                {
                    name: "dept.id",

                    editable: true,
                    edittype: "select",
                    editoptions: {
                        //value:"1:one;2:two"
                        dataUrl: "${app}/dept/findAllDept",
                    },
                    formatter: function (cellvalue, options, rowObject) {
                        return rowObject.dept.name;
                    }
                },
                {
                    name: "xxxxx",
                    formatter: function (cellvalue, options, rowObject) {
                        return "<a  href=\"javascript:edit('" + rowObject.id + "')\" class=\"btn btn-default btn-primary\"><span class=\"glyphicon glyphicon-pencil\"></span> 修改</a> <a href=\"javascript:del('" + rowObject.id + "')\" class=\"btn btn-default btn-danger\"><span class=\"glyphicon glyphicon-trash\"></span> 删除</a>"
                    }
                }

            ],
            multiselect: true,
            toolbar: ['true', 'top'],
            caption: "员工管理",
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

<table id="tb"></table>

<div id="page"></div>




