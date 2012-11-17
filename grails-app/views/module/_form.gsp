<%@ page import="easysuite.Module" %>



<div class="fieldcontain ${hasErrors(bean: moduleInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="module.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${moduleInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: moduleInstance, field: 'moduleActives', 'error')} ">
	<label for="moduleActives">
		<g:message code="module.moduleActives.label" default="Module Actives" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${moduleInstance?.moduleActives?}" var="m">
    <li><g:link controller="moduleActivation" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="moduleActivation" action="create" params="['module.id': moduleInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'moduleActivation.label', default: 'ModuleActivation')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: moduleInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="module.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${moduleInstance?.name}"/>
</div>

