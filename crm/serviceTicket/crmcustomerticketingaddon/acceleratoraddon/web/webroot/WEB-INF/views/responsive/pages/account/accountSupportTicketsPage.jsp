<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/desktop/template"%>
<%@ taglib prefix="theme" tagdir="/WEB-INF/tags/shared/theme"%>
<%@ taglib prefix="nav" tagdir="/WEB-INF/tags/desktop/nav"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="cms" uri="http://hybris.com/tld/cmstags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="common" tagdir="/WEB-INF/tags/desktop/common"%>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags"%>
<%@ taglib prefix="breadcrumb"
	tagdir="/WEB-INF/tags/desktop/nav/breadcrumb"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="nav" tagdir="/WEB-INF/tags/responsive/nav"%>
<spring:htmlEscape defaultHtmlEscape="true" />
<div
	class="account-section-header ${empty supportTickets ? '':'no-border'}">
	<spring:theme code="text.account.supporttickets.complaints"
		text="Support Tickets/Complaints" />
	<div class="account-section-header-add pull-right create-ticket-group">
		<div class="create-ticket-button">
			<spring:theme code="text.account.supporttickets.requestSupport"
				text="Request Support" />
		</div>
		<div class="create-ticket-options">
			<c:forEach var="category" items="${categories}">
				<div>
					<a href="crm-add-support-ticket/${category}" class="add-address"><spring:theme
							code="text.account.supporttickets.createTicket.ticketCategory.${category}" /></a>
				</div>
			</c:forEach>
		</div>
	</div>
</div>

<c:set var="searchUrl"
	value="/my-account/crm-support-tickets?sort=${searchPageData.pagination.sort}" />

<c:if test="${empty searchPageData.results}">
	<div
		class="account-section-content col-md-6 col-md-push-3 content-empty">
		<spring:theme code="text.account.supporttickets.noSupporttickets"
			text="You have no support tickets" />
	</div>
</c:if>

<div class="clearfix visible-md-block visible-lg-block"></div>

<div class="customer-ticketing account-overview-table">
	<c:if test="${not empty searchPageData.results}">
		<nav:pagination top="true" msgKey="text.account.supportTickets.page"
			showCurrentPageInfo="true" hideRefineButton="true"
			supportShowPaged="${isShowPageAllowed}"
			supportShowAll="${isShowAllAllowed}"
			searchPageData="${searchPageData}" searchUrl="${searchUrl}"
			numberPagesShown="${numberPagesShown}" />
		<table class="responsive-table">
			<thead>
				<tr class="responsive-table-head hidden-xs">
					<th><spring:theme code="text.account.supporttickets.ticketId"
							text="Ticket ID" /></th>
					<th><spring:theme code="text.account.supporttickets.subject"
							text="Subject" /></th>
					<th><spring:theme
							code="text.account.supporttickets.createTicket.ticketCategory"
							text="Category" /></th>
					<th><spring:theme
							code="text.account.supporttickets.dateCreated"
							text="Date Created" /></th>
					<th><spring:theme
							code="text.account.supporttickets.dateUpdated"
							text="Date Updated" /></th>
					<th class="supportTicketsTableState"><spring:theme
							code="text.account.supporttickets.status" text="Status" /></th>
				</tr>
			</thead>

			<tbody>
				<c:forEach items="${searchPageData.results}" var="supportTicket">
					<c:choose>
						<c:when test="${supportTicket.ticketCategory eq 'COMPLAINT'}">
							<c:url value="/my-account/crm-complaint/${supportTicket.id}"
								var="myAccountsupportTicketDetailsUrl" />
						</c:when>
						<c:otherwise>
							<c:url value="/my-account/crm-support-ticket/${supportTicket.id}"
								var="myAccountsupportTicketDetailsUrl" />
						</c:otherwise>
					</c:choose>

					<tr class="responsive-table-item">
						<td class="hidden-sm hidden-md hidden-lg"><spring:theme
								code="text.account.supporttickets.ticketId" text="Ticket ID" /></td>
						<td><a href="${myAccountsupportTicketDetailsUrl}"
							class="responsive-table-link"><c:out
									value="${supportTicket.id}" /></a></td>

						<td class="hidden-sm hidden-md hidden-lg"><spring:theme
								code="text.account.supporttickets.subject" text="Subject" /></td>
						<td><a href="${myAccountsupportTicketDetailsUrl}"
							class="responsive-table-link"><c:out
									value="${supportTicket.subject}" /></a></td>

						<td class="hidden-sm hidden-md hidden-lg"><spring:theme
								code="text.account.supporttickets.createTicket.ticketCategory"
								text="Category" /></td>
						<td><spring:message
								code="text.account.supporttickets.createTicket.ticketCategory.${supportTicket.ticketCategory}" /></td>

						<td class="hidden-sm hidden-md hidden-lg"><spring:theme
								code="text.account.supporttickets.dateCreated"
								text="Date Created" /></td>
						<td><fmt:formatDate value="${supportTicket.creationDate}"
								pattern="dd-MM-yy hh:mm a" /></td>

						<td class="hidden-sm hidden-md hidden-lg"><spring:theme
								code="text.account.supporttickets.dateUpdated"
								text="Date Updated" /></td>
						<td><fmt:formatDate
								value="${supportTicket.lastModificationDate}"
								pattern="dd-MM-yy hh:mm a" /></td>

						<td class="hidden-sm hidden-md hidden-lg"><spring:theme
								code="text.account.supporttickets.status" text="Status" /></td>
						<td><spring:message
								code="ticketstatus.${fn:toUpperCase(supportTicket.status.id)}" /></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<nav:pagination top="false" msgKey="text.account.supportTickets.page"
			showCurrentPageInfo="true" hideRefineButton="true"
			supportShowPaged="${isShowPageAllowed}"
			supportShowAll="${isShowAllAllowed}"
			searchPageData="${searchPageData}" searchUrl="${searchUrl}"
			numberPagesShown="${numberPagesShown}" />
	</c:if>
</div>