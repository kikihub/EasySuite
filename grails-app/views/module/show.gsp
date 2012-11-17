
<%@ page import="easysuite.Module" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'module.label', default: 'Module')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-module" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-module" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list module">
			
				<g:if test="${moduleInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="module.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${moduleInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${moduleInstance?.moduleActives}">
				<li class="fieldcontain">
					<span id="moduleActives-label" class="property-label"><g:message code="module.moduleActives.label" default="Module Actives" /></span>
					
						<g:each in="${moduleInstance.moduleActives}" var="m">
						<span class="property-value" aria-labelledby="moduleActives-label"><g:link controller="moduleActivation" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${moduleInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="module.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${moduleInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${moduleInstance?.id}" />
					<g:link class="edit" action="edit" id="${moduleInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
