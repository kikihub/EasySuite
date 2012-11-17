
<%@ page import="easysuite.Company" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'company.label', default: 'Company')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-company" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-company" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="siret" title="${message(code: 'company.siret.label', default: 'Siret')}" />
					
						<g:sortableColumn property="phone" title="${message(code: 'company.phone.label', default: 'Phone')}" />
					
						<g:sortableColumn property="email" title="${message(code: 'company.email.label', default: 'Email')}" />
					
						<g:sortableColumn property="address" title="${message(code: 'company.address.label', default: 'Address')}" />
					
						<g:sortableColumn property="city" title="${message(code: 'company.city.label', default: 'City')}" />
					
						<g:sortableColumn property="country" title="${message(code: 'company.country.label', default: 'Country')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${companyInstanceList}" status="i" var="companyInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${companyInstance.id}">${fieldValue(bean: companyInstance, field: "siret")}</g:link></td>
					
						<td>${fieldValue(bean: companyInstance, field: "phone")}</td>
					
						<td>${fieldValue(bean: companyInstance, field: "email")}</td>
					
						<td>${fieldValue(bean: companyInstance, field: "address")}</td>
					
						<td>${fieldValue(bean: companyInstance, field: "city")}</td>
					
						<td>${fieldValue(bean: companyInstance, field: "country")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${companyInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
