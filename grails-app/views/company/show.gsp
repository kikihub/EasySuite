
<%@ page import="easysuite.Company" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'company.label', default: 'Company')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-company" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-company" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list company">
			
				<g:if test="${companyInstance?.siret}">
				<li class="fieldcontain">
					<span id="siret-label" class="property-label"><g:message code="company.siret.label" default="Siret" /></span>
					
						<span class="property-value" aria-labelledby="siret-label"><g:fieldValue bean="${companyInstance}" field="siret"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${companyInstance?.phone}">
				<li class="fieldcontain">
					<span id="phone-label" class="property-label"><g:message code="company.phone.label" default="Phone" /></span>
					
						<span class="property-value" aria-labelledby="phone-label"><g:fieldValue bean="${companyInstance}" field="phone"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${companyInstance?.email}">
				<li class="fieldcontain">
					<span id="email-label" class="property-label"><g:message code="company.email.label" default="Email" /></span>
					
						<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${companyInstance}" field="email"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${companyInstance?.address}">
				<li class="fieldcontain">
					<span id="address-label" class="property-label"><g:message code="company.address.label" default="Address" /></span>
					
						<span class="property-value" aria-labelledby="address-label"><g:fieldValue bean="${companyInstance}" field="address"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${companyInstance?.city}">
				<li class="fieldcontain">
					<span id="city-label" class="property-label"><g:message code="company.city.label" default="City" /></span>
					
						<span class="property-value" aria-labelledby="city-label"><g:fieldValue bean="${companyInstance}" field="city"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${companyInstance?.country}">
				<li class="fieldcontain">
					<span id="country-label" class="property-label"><g:message code="company.country.label" default="Country" /></span>
					
						<span class="property-value" aria-labelledby="country-label"><g:fieldValue bean="${companyInstance}" field="country"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${companyInstance?.moduleActivates}">
				<li class="fieldcontain">
					<span id="moduleActivates-label" class="property-label"><g:message code="company.moduleActivates.label" default="Module Activates" /></span>
					
						<g:each in="${companyInstance.moduleActivates}" var="m">
						<span class="property-value" aria-labelledby="moduleActivates-label"><g:link controller="moduleActivation" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${companyInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="company.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${companyInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${companyInstance?.postalCode}">
				<li class="fieldcontain">
					<span id="postalCode-label" class="property-label"><g:message code="company.postalCode.label" default="Postal Code" /></span>
					
						<span class="property-value" aria-labelledby="postalCode-label"><g:fieldValue bean="${companyInstance}" field="postalCode"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${companyInstance?.users}">
				<li class="fieldcontain">
					<span id="users-label" class="property-label"><g:message code="company.users.label" default="Users" /></span>
					
						<g:each in="${companyInstance.users}" var="u">
						<span class="property-value" aria-labelledby="users-label"><g:link controller="user" action="show" id="${u.id}">${u?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${companyInstance?.website}">
				<li class="fieldcontain">
					<span id="website-label" class="property-label"><g:message code="company.website.label" default="Website" /></span>
					
						<span class="property-value" aria-labelledby="website-label"><g:fieldValue bean="${companyInstance}" field="website"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${companyInstance?.id}" />
					<g:link class="edit" action="edit" id="${companyInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
