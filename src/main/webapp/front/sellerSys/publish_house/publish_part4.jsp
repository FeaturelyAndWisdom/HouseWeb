<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>

  </head>
  
  <body>
				<div data-v-613d7838="" class="floor4" id="floor4" style="display:none">
			<div data-v-613d7838="" class="title-con">
				<h1 data-v-613d7838="">设施服务</h1>
				<h2 data-v-613d7838="">房客可以按照他们想要的配套设施选择房屋
					。因此，请在页面上尽可能地全面展示您的房屋的配套设施。</h2>
			</div>
			<div data-v-613d7838="" class="reject-tips-wrapper"
				style="display: none;">
				<div data-v-579995ed="" data-v-613d7838="" class="reject-tips">
					<p data-v-579995ed="" class="reject-text"></p>
				</div>
			</div>
			<div data-v-613d7838="" class="service-floor">
				<!---->
				<form data-v-613d7838="" autocomplete="off" class="ivu-form ivu-form-label-right">
					<c:forEach items="${requestScope.stplst}" var="stp">
						<div data-v-613d7838="" class="ivu-form-item" style="margin-top:15px;border-top: 1px solid rgb(238, 238, 238);">
							<div class="ivu-form-item-content">
								<p data-v-613d7838="">${stp.typename}</p>
								<div data-v-613d7838="" class="ivu-checkbox-group" label="homeFamily">
									<c:forEach items="${stp.itemlst}" var="item">
										<label data-v-613d7838="" class="checkboxLi ivu-checkbox-wrapper ivu-checkbox-group-item">
											<span class="ivu-checkbox"> <input type="checkbox" name="serviceitems" value="${item.sid}"></span>${item.itemname}
										</label> 
									</c:forEach>
								</div>
							</div>
						</div>
					</c:forEach>
					
					<div data-v-613d7838="" class="ivu-form-item">
						<!---->
						<div class="ivu-form-item-content">
							<div data-v-613d7838="" class="nextStep">
								<button data-v-613d7838="" type="button" onclick="enterNext(5);" class="nextStep-btn ivu-btn ivu-btn-primary canNotNext">
									<span>下一步</span>
								</button>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
  </body>
</html>
