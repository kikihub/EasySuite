<%@ page import="easysuite.ModuleActivation" %>



<div class="fieldcontain ${hasErrors(bean: moduleActivationInstance, field: 'company', 'error')} required">
	<label for="company">
		<g:message code="moduleActivation.company.label" default="Company" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="company" name="company.id" from="${easysuite.Company.list()}" optionKey="id" required="" value="${moduleActivationInstance?.company?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: moduleActivationInstance, field: 'module', 'error')} required">
	<label for="module">
		<g:message code="moduleActivation.module.label" default="Module" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="module" name="module.id" from="${easysuite.Module.list()}" optionKey="id" required="" value="${moduleActivationInstance?.module?.id}" class="many-to-one"/>
</div>

