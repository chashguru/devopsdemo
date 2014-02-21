<%@ tag body-content="empty" trimDirectiveWhitespaces="true" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring"  uri="http://www.springframework.org/tags"%>

<c:if test="${not empty restorationErrorMsg}">
	<div class="information_message negative">
			<span class="single"></span>
			<p><spring:theme code="${restorationErrorMsg}"/></p>
	</div>
</c:if>
<c:if test="${not empty restorationData and not empty restorationData.modifications}">
	<div class="information_message neutral">
		<span class="single"></span>
		<p>
			<spring:theme code="basket.restoration"/>
			<c:forEach items="${restorationData.modifications}" var="modification">
				<br/>
				<c:url value="${modification.entry.product.url}" var="entryUrl"/>
				<c:if test="${modification.deliveryModeChanged}">
					<spring:theme code="basket.restoration.delivery.changed" 
						arguments="${modification.entry.product.name},${entryUrl},${modification.quantity},${modification.quantityAdded}"/>
				</c:if>
				<c:if test="${not modification.deliveryModeChanged}">
					<spring:theme code="basket.restoration.${modification.statusCode}" 
						arguments="${modification.entry.product.name},${entryUrl},${modification.quantity},${modification.quantityAdded}"/>
				</c:if>
			</c:forEach>
		</p>
	</div>
</c:if>
