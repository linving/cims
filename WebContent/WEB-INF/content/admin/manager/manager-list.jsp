<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta name="viewport" content="target-densitydpi=device-dpi, width=device-width, initial-scale=1.0, maximum-scale=1">

    <link href="${pageContext.request.contextPath}/resources/css/modern.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/modern-responsive.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/site.css" rel="stylesheet" type="text/css">
  

    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/assets/jquery-1.9.0.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/assets/jquery.mousewheel.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/assets/moment.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/assets/moment_langs.js"></script>
    
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/modern/dropdown.js"></script>
   <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/modern/accordion.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/modern/buttonset.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/modern/carousel.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/modern/input-control.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/modern/pagecontrol.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/modern/rating.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/modern/slider.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/modern/tile-slider.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/modern/tile-drag.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/modern/calendar.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/modern/dialog.js"></script>
	
	<title>管理员列表</title>
	
</head>
<body class="metrouicss" onload="prettyPrint()">
<jsp:include page="/WEB-INF/content/admin/nav.jsp"/>
<div class="page secondary with-sidebar">
	<div class="page-header">
		<p />
		&nbsp;
		<p />
	</div>
	<jsp:include page="/WEB-INF/content/admin/sidebar.jsp"></jsp:include>
	<div class="page-region ">
		<div class="page-region-content">
			<span style="text-align: center;">
				<h3><small>管理员列表</small></h3>
			</span>
			<div>
				<a href="${pageContext.request.contextPath }/admin/manager-to-add.html" class="button mini bg-color-blue fg-color-white"><i class="icon-plus-2 "></i>添加</a>
				<table class="bordered striped" >
					<thead>
						<tr>
							<th>序号</th>
							<th class="right">管理员编号</th>
							<th class="right">登录名</th>
							<th class="right">邮箱</th>
							<th class="right">角色</th>
							<th class="right">状态</th>
							<th class="right">操作</th>
						</tr>
					</thead>

					<tbody>
						<c:forEach items="${managerList }" varStatus="status" var="manager">
							<tr>
								<td>${status.count+(page.index-1) * page.pageSize}</td>
								<td class="right">${manager.managerNumber }</td>
								<td class="right">${manager.userName }</td>
								<td class="right">${manager.email }</td>
								<td class="right">${manager.role.value }</td>
								<c:choose>
									<c:when test="${manager.status==0}">
										<td class="right">启用</td>
									</c:when>
									<c:otherwise>
										<td class="right">禁用</td>
									</c:otherwise>
								</c:choose>
								<td class="center" style="width: 102px;">
									<a href="${pageContext.request.contextPath }/admin/manager-show.html?id=${manager.id}"><i class="icon-eye fg-color-blue"></i></a> 
								 	<a href="${pageContext.request.contextPath }/admin/manager-to-update.html?id=${manager.id}" class=""><i class="icon-pencil fg-color-blue"></i></a> 
								 	<a id="delete" href="${pageContext.request.contextPath }/admin/manager-delete.html?id=${manager.id}" onclick="if(!confirm('确定删除该信息吗？'))return false;else return true;"> <i class="icon-remove fg-color-red"></i></a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
					<tfoot>&nbsp;
					</tfoot>
				</table>
				<div class="pagination">${page.pageHTML }</div>
			</div>
		</div>
	</div>
</div>

<jsp:include page="/WEB-INF/content/admin/footer.jsp"></jsp:include>
