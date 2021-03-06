<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>立项信息</title>
<jsp:include page="../Model.jsp"></jsp:include>

</head>
<body>
	<jsp:include page="masterPage.jsp"></jsp:include>
	<!-- Main Page -->
	<div class="main ">
		<!-- Page Header -->
		<div class="page-header">
			<div class="pull-left">
				<ol class="breadcrumb visible-sm visible-md visible-lg">
					<li class="active"><a href="#"><i class="fa fa-folder"></i>立项管理</a></li>
					<li class="active"><a href="applyProjectInfo.jsp"><i
							class="fa fa-file-text"></i>立项信息</a></li>
				</ol>
			</div>
			<div class="pull-right">
				<h2>立项信息</h2>
			</div>
		</div>
		<!-- End Page Header -->
		<div class="row">
			<div class="col-lg-6">
				<div class="panel">
					<div class="panel-heading bk-bg-primary">
						<h6>
							<i class="fa fa-paperclip"></i>立项基本信息
						</h6>
						<div class="panel-actions">
							<a class="btn-minimize"><i class="fa fa-chevron-up"></i></a>
						</div>
					</div>

					<div class="panel-body">


						<div class="table-responsive ">
							<table
								class="table table-striped table-bordered bootstrap-datatable datatable text-center ">
								<tbody>
									<tr>
										<td>立项编号</td>
										<td>${p.projectNum }</td>

									</tr>
									<tr>
										<td>项目类型</td>
										<td>${p.projectType.projecttypeName }</td>
									</tr>
									<tr>
										<td>基金类型</td>
										<td>${p.fundType.fundName }</td>
									</tr>
									<tr>
										<td>立项名</td>
										<td>${p.projectName }</td>
									</tr>
									<tr>
										<td>立项时间</td>
										<td>
											<fmt:formatDate value='${p.setupTime }' pattern="yyyy-MM-dd"/>
										</td>
									</tr>
									<tr>
										<td>立项申请表审核状态</td>
										<td>
										<span class="label label-success">
											<c:choose>
												<c:when test="${p.isPassed eq 0 }">未提交</c:when>
												<c:when test="${p.isPassed eq 1 }">等待审核</c:when>
												<c:when test="${p.isPassed eq 2 }">审核通过</c:when>
												<c:when test="${p.isPassed eq 3 }">审核无效</c:when>
												<c:otherwise>其他</c:otherwise>
											</c:choose>
											
										</span>
										</td>
									</tr>
									<tr>
										<td>立项申请表</td>
										<td><a href="<c:url value='/benificiary/checkProjectForm.aciton?projectId=${p.projectId }'/>"><button
													class="btn btn-info fa fa-eye">查看</button></a></td>
									</tr>
									<tr>
										<td>捐赠协议</td>
										<td>
											<a class="btn btn-primary fa fa-download" href="<c:url value='/download/downloadProtocol.action'/>">下载</a>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>

			<div class="col-lg-6">
				<div class="panel">
					<div class="panel-heading bk-bg-primary">
						<h6>
							<i class="fa fa-paperclip"></i>立项评审信息
						</h6>
						<div class="panel-actions">
							<a class="btn-minimize"><i class="fa fa-chevron-up"></i></a>
						</div>
					</div>
					<div class="panel-body">
						<div class="table-responsive ">
							<table
								class="table table-striped table-bordered bootstrap-datatable datatable text-center ">
								<tbody>
									<c:if test="${p.fundtypeId == 1 || p.fundtypeId == 2 ||  p.fundtypeId == 7 }">
									<tr>
										<td>评审状态</td>
										<td>
											<c:choose>
												<c:when test="${p.bonusNotice == null}">
													<span class="label label-warning">报名未开始</span>
												</c:when>
												<c:when test="${p.bonusNotice.judgeState eq 2 }">
													<span class="label label-danger">报名结束</span>
												</c:when>
												<c:when test="${p.bonusNotice.judgeState eq 1 }">
													<span class="label label-success">正在报名</span>
												</c:when>
											</c:choose>
										</td>

									</tr>
									<tr>
										<td>报名操作</td>
										<td>
											<c:choose>
												<c:when test="${p.bonusNotice == null}">
													<button type="button" class="btn btn-success fa startEnrollmentBtn" onclick="startOrEndEnrollment(1)">开始报名</button>
													<button type="button" class="btn btn-danger fa endEnrollmentBtn" onclick="startOrEndEnrollment(2)" disabled="disabled">结束报名</button>
												</c:when>
												<c:when test="${p.bonusNotice.judgeState eq 0 }">
													<button type="button" class="btn btn-success fa startEnrollmentBtn" onclick="startOrEndEnrollment(1)">开始报名</button>
													<button type="button" class="btn btn-danger fa endEnrollmentBtn"  onclick="startOrEndEnrollment(2)" disabled="disabled">结束报名</button>
												</c:when>
												<c:when test="${p.bonusNotice.judgeState eq 1 }">
													<button type="button" class="btn btn-success fa startEnrollmentBtn"  onclick="startOrEndEnrollment(1)" disabled="disabled">开始报名</button>
													<button type="button" class="btn btn-danger fa endEnrollmentBtn"    onclick="startOrEndEnrollment(2)">结束报名</button>
												</c:when>
												<c:when test="${p.bonusNotice.judgeState eq 2 }">
													<button type="button" class="btn btn-success fa startEnrollmentBtn"  onclick="startOrEndEnrollment(1)">开始报名</button>
													<button type="button" class="btn btn-danger fa endEnrollmentBtn"   onclick="startOrEndEnrollment(2)" disabled="disabled">结束报名</button>
												</c:when>
												<c:otherwise>
													<button type="button" class="btn btn-success fa startEnrollmentBtn"  disabled="disabled">开始报名</button>
													<button type="button" class="btn btn-danger fa endEnrollmentBtn" disabled="disabled">结束报名</button>
												</c:otherwise>
											</c:choose>
										</td>
									</tr>
									
									<tr>
										<td>报名表</td>
										<td>
											<a class="btn btn-info fa fa-eye" href="<c:url value='/benificiary/allBonusApps.action'/>">查看</a>
										</td>
									</tr>
									
									</c:if>
									
									<tr>
										<td>感谢信</td>
										<td>
											<a class="btn btn-primary fa fa-download">下载</a>
										</td>
									</tr>
									<tr>
										<td>相关新闻链接</td>
										<td>
											<a class="btn btn-info fa fa-eye" href="<c:url value='/benificiary/newsLink.action'/>">查看</a>
										</td>
									</tr>
									<tr>
										<td>其他相关文件</td>
										<td>
											<a class="btn btn-primary fa fa-download">下载</a>
										</td>
									</tr>

								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>


		<div class="row">
			<div class="col-lg-6">
				<div class="panel">
					<div class="panel-heading bk-bg-primary">
						<h6>
							<i class="fa fa-paperclip"></i>立项资金信息
						</h6>
						<div class="panel-actions">
							<a class="btn-minimize"><i class="fa fa-chevron-up"></i></a>
						</div>
					</div>
					<div class="panel-body">
						<div class="table-responsive ">
							<table
								class="table table-striped table-bordered bootstrap-datatable datatable text-center ">
								<tbody>
									<tr>
										<td class="col-md-6">总金额</td>
										<td>
											<c:choose>
												<c:when test="${p.donationMode.isOnetime eq 1 }">
													<fmt:formatNumber groupingUsed="false" maxFractionDigits="2" value="${p.donationMode.amount }"/>
												</c:when>
												<c:otherwise>
													<fmt:formatNumber groupingUsed="false" maxFractionDigits="2" value="${p.donationMode.amount * p.donationMode.span }"/>
												</c:otherwise>
											</c:choose>
										</td>

									</tr>
									<tr>
										<td>分期数</td>
										<td>${p.donationMode.span }</td>
									</tr>
									<tr>
										<td>每期发放金额</td>
										<td>
											<fmt:formatNumber groupingUsed="false" maxFractionDigits="2" value="${p.donationMode.amount}"/>	
										</td>
									</tr>
									<tr>
										<td>已到款金额</td>
										<td>
											<fmt:formatNumber groupingUsed="false" maxFractionDigits="2" value="${p.moneyCheck.moneyInCount }"/>
										</td>
									</tr>
									<tr>
										<td>剩余未到款金额</td>
										<td>
											<c:choose>
												<c:when test="${p.donationMode.isOnetime eq 1 }">
													<fmt:formatNumber groupingUsed="false" maxFractionDigits="2" value="${p.donationMode.amount - p.moneyCheck.moneyInCount}"/>									
												</c:when>
												<c:otherwise>
													<fmt:formatNumber groupingUsed="false" maxFractionDigits="2" value="${p.donationMode.amount * p.donationMode.span - p.moneyCheck.moneyInCount}"/>
												</c:otherwise>
											</c:choose>
										</td>
									</tr>
									<tr>
										<td>已发放金额</td>
										<td>
											<fmt:formatNumber groupingUsed="false" maxFractionDigits="2" value="${p.moneyCheck.moneyOutCount }"/>
										</td>
									</tr>
									<tr>
										<td>未发放金额</td>
										<td>
											<fmt:formatNumber groupingUsed="false" maxFractionDigits="2" value="${p.moneyCheck.moneyInCount-p.moneyCheck.moneyOutCount }"/>
										</td>
									</tr>
									<tr>
										<td>资金到款详情</td>
										<td><a class="btn btn-info fa fa-eye" href="#"> 查看</a></td>
									</tr>
									<tr>
										<td>资金发放详情</td>
										<td><a class="btn btn-info fa fa-eye" href="#"> 查看</a></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>

		</div>


	</div>


<script type="text/javascript">
	function startOrEndEnrollment(judgeState){
		var flag = false;
		if(judgeState==1){
			flag = confirm("您确定要执行开始报名吗？");
		}else{
			flag = confirm("您确定要执行结束报名吗？");
		}
		if(flag){
			$.ajax({
	             type: "POST",
	             url: "${pageContext.request.contextPath}/benificiary/adminEnrollment.action",
	             data: 'judgeState=' + judgeState,
	             dataType: "json",
	             success: function(data){
	            	 if(data.resultCode == 1){
	            		 $('.endEnrollmentBtn').removeAttr('disabled');
	            		 $('.startEnrollmentBtn').attr('disabled','disabled');
	            	 }else if(data.resultCode == 2){
	            		 $('.startEnrollmentBtn').removeAttr('disabled');
	            		 $('.endEnrollmentBtn').attr('disabled','disabled');
	            	 }else if(data.resultCode == 0){
	            		 alert(data.resultMessage);
	            	 }
	             }
	         });
		}
	}
</script>
</body>
</html>