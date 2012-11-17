<%@ page import="easysuite.Company" %>



<div class="fieldcontain ${hasErrors(bean: companyInstance, field: 'siret', 'error')} ">
	<label for="siret">
		<g:message code="company.siret.label" default="Siret" />
		
	</label>
	<g:textField name="siret" pattern="${companyInstance.constraints.siret.matches}" value="${companyInstance?.siret}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: companyInstance, field: 'phone', 'error')} ">
	<label for="phone">
		<g:message code="company.phone.label" default="Phone" />
		
	</label>
	<g:textField name="phone" pattern="${companyInstance.constraints.phone.matches}" value="${companyInstance?.phone}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: companyInstance, field: 'email', 'error')} ">
	<label for="email">
		<g:message code="company.email.label" default="Email" />
		
	</label>
	<g:field type="email" name="email" value="${companyInstance?.email}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: companyInstance, field: 'address', 'error')} ">
	<label for="address">
		<g:message code="company.address.label" default="Address" />
		
	</label>
	<g:textField name="address" value="${companyInstance?.address}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: companyInstance, field: 'city', 'error')} ">
	<label for="city">
		<g:message code="company.city.label" default="City" />
		
	</label>
	<g:textField name="city" value="${companyInstance?.city}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: companyInstance, field: 'country', 'error')} ">
	<label for="country">
		<g:message code="company.country.label" default="Country" />
		
	</label>
	<g:textField name="country" value="${companyInstance?.country}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: companyInstance, field: 'moduleActivates', 'error')} ">
	<label for="moduleActivates">
		<g:message code="company.moduleActivates.label" default="Module Activates" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${companyInstance?.moduleActivates?}" var="m">
    <li><g:link controller="moduleActivation" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="moduleActivation" action="create" params="['company.id': companyInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'moduleActivation.label', default: 'ModuleActivation')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: companyInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="company.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${companyInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: companyInstance, field: 'postalCode', 'error')} ">
	<label for="postalCode">
		<g:message code="company.postalCode.label" default="Postal Code" />
		
	</label>
	<g:textField name="postalCode" value="${companyInstance?.postalCode}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: companyInstance, field: 'users', 'error')} ">
	<label for="users">
		<g:message code="company.users.label" default="Users" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${companyInstance?.users?}" var="u">
    <li><g:link controller="user" action="show" id="${u.id}">${u?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="user" action="create" params="['company.id': companyInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'user.label', default: 'User')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: companyInstance, field: 'website', 'error')} ">
	<label for="website">
		<g:message code="company.website.label" default="Website" />
		
	</label>
	<g:textField name="website" value="${companyInstance?.website}"/>
</div>

