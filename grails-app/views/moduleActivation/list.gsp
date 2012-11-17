
<%@ page import="easysuite.ModuleActivation" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'moduleActivation.label', default: 'ModuleActivation')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-moduleActivation" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-moduleActivation" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="moduleActivation.company.label" default="Company" /></th>
					
						<th><g:message code="moduleActivation.module.label" default="Module" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${moduleActivationInstanceList}" status="i" var="moduleActivationInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${moduleActivationInstance.id}">${fieldValue(bean: moduleActivationInstance, field: "company")}</g:link></td>
					
						<td>${fieldValue(bean: moduleActivationInstance, field: "module")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${moduleActivationInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
