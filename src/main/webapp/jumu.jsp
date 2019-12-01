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

</head>
<body>
<div class="jumbotron">
    <h1>欢迎访问BOOT客户管理系统V2.0</h1>
    <p>点击左侧按钮，即可录制本局比赛</p>
    <p><a class="btn btn-primary btn-lg" href="${app}/homepage.jsp" role="button">Learn more</a></p>
</div>
</body>
</html>