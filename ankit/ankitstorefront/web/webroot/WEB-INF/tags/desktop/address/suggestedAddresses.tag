<%@ tag body-content="empty" trimDirectiveWhitespaces="true" %>
<%@ attribute name="selectedAddressUrl" required="true" type="java.lang.String"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="theme" tagdir="/WEB-INF/tags/shared/theme" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:url value="${selectedAddressUrl}" var="selectSuggestedAddressUrl"/>

<div style="display:none" id="popup_suggested_delivery_addresses_form" class="">
	<div class="test" id="popup_suggested_delivery_addresses">
		<div class="span-14 suggested_address_container">
			<h4 class="suggested_address_title"><spring:theme code="checkout.multi.deliveryAddress.selectSuggestedAddress"/></h4>
			<c:forEach var="suggestedAddress" items="${suggestedAddresses}">
				<div class="span-9 suggested_address">
					<ul>
						<li>${suggestedAddress.line1}</li>
						<li>${suggestedAddress.line2}</li>
						<c:if test="${not empty suggestedAddress.region.name}">
							<li>
								${suggestedAddress.town}, ${suggestedAddress.postalCode}
							</li>
							<li>
								${suggestedAddress.country.name}, ${suggestedAddress.region.name}
							</li>
						</c:if>
						<c:if test="${empty suggestedAddress.region.name}">
							<li>
								${suggestedAddress.town}, ${suggestedAddress.postalCode}
							</li>
							<li>
								${suggestedAddress.country.name}
							</li>
						</c:if>
					</ul>
				</div>
				<div class="span-5 suggested_address_submit last">
					<form:form method="post" commandName="addressForm" action="${selectSuggestedAddressUrl}">
						<form:hidden path="addressId" class="add_edit_delivery_address_id"/>
						<form:hidden path="defaultAddress" value="${inputAddress.defaultAddress}"/>
						<input id="titleCode" name="titleCode" type="hidden" value="${suggestedAddress.titleCode}"/>
						<input id="firstName" name="firstName" type="hidden" value="${suggestedAddress.firstName}"/>
						<input id="lastName" name="lastName" type="hidden" value="${suggestedAddress.lastName}"/>
						<input id="line1" name="line1" type="hidden" value="${suggestedAddress.line1}"/>
						<input id="line2" name="line2" type="hidden" value="${suggestedAddress.line2}"/>
						<input id="townCity" name="townCity" type="hidden" value="${suggestedAddress.town}"/>
						<input id="regionIso" name="regionIso" type="hidden" value="${suggestedAddress.region.isocode}"/>
						<input id="postcode" name="postcode" type="hidden" value="${suggestedAddress.postalCode}"/>
						<input id="countryIso" name="countryIso" type="hidden" value="${suggestedAddress.country.isocode}"/>
						<input id="saveInAddressBook" name="saveInAddressBook" type="hidden" value="${saveInAddressBook}"/>
						<button class="positive use_address" id="use_suggested_address_button">
							<spring:theme code="checkout.summary.deliveryAddress.useThisAddress"/>
						</button>
						<c:choose>
							<c:when test="${edit}">
								<input id="editAddress" name="editAddress" type="hidden" value="${true}"/>
							</c:when>
							<c:otherwise>
								<input id="editAddress" name="editAddress" type="hidden" value="${false}"/>
							</c:otherwise>
						</c:choose>
					</form:form>
				</div>
			</c:forEach>
		</div>
		
		<div class="span-14 suggested_address_container users_address_container">
			<h4 class="suggested_address_title"><spring:theme code="checkout.multi.deliveryAddress.addressSuggestions.addressNotFound"/></h4>
			<div class="span-9 suggested_address">
				<ul>
					<li>${inputAddress.line1}</li>
					<li>${inputAddress.line2}</li>
					<c:if test="${not empty inputAddress.region.name}">
						<li>
							${inputAddress.town}, ${inputAddress.postalCode}
						</li>
						<li>
							${inputAddress.country.name}, ${inputAddress.region.name}
						</li>
					</c:if>
					<c:if test="${empty inputAddress.region.name}">
						<li>
							${inputAddress.town}, ${inputAddress.postalCode}
						</li>
						<li>
							${inputAddress.country.name}
						</li>
					</c:if>
				</ul>
			</div>
			<div class="span-5 suggested_address_submit last">
				<c:if test="${customerBypass}">
					<form:form method="post" commandName="addressForm" action="${selectSuggestedAddressUrl}">
						<form:hidden path="addressId" class="add_edit_delivery_address_id"/>
						<form:hidden path="defaultAddress" value="${inputAddress.defaultAddress}"/>
						<input id="titleCode" name="titleCode" type="hidden" value="${inputAddress.titleCode}"/>
						<input id="firstName" name="firstName" type="hidden" value="${inputAddress.firstName}"/>
						<input id="lastName" name="lastName" type="hidden" value="${inputAddress.lastName}"/>
						<input id="line1" name="line1" type="hidden" value="${inputAddress.line1}"/>
						<input id="line2" name="line2" type="hidden" value="${inputAddress.line2}"/>
						<input id="townCity" name="townCity" type="hidden" value="${inputAddress.town}"/>
						<input id="regionIso" name="regionIso" type="hidden" value="${inputAddress.region.isocode}"/>
						<input id="postcode" name="postcode" type="hidden" value="${inputAddress.postalCode}"/>
						<input id="countryIso" name="countryIso" type="hidden" value="${inputAddress.country.isocode}"/>
						<input id="saveInAddressBook" name="saveInAddressBook" type="hidden" value="${saveInAddressBook}"/>
						<button class="form use_address" id="use_suggested_address_button">
							<spring:theme code="checkout.multi.deliveryAddress.selectSuggestedAddress.sumbitAsIs"/>
						</button>
						<c:choose>
							<c:when test="${edit}">
								<input id="editAddress" name="editAddress" type="hidden" value="${true}"/>
							</c:when>
						    <c:otherwise>
								<input id="editAddress" name="editAddress" type="hidden" value="${false}"/>
						    </c:otherwise>
						</c:choose>
					</form:form>
				</c:if>
			</div>
		</div>
		
	</div>
</div>
