<%@ page import="easysuite.User" %>



<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'company', 'error')} ">
	<label for="company">
		<g:message code="user.company.label" default="Company" />
		
	</label>
	<g:select id="company" name="company.id" from="${easysuite.Company.list()}" optionKey="id" value="${userInstance?.company?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'phone', 'error')} ">
	<label for="phone">
		<g:message code="user.phone.label" default="Phone" />
		
	</label>
	<g:textField name="phone" pattern="${userInstance.constraints.phone.matches}" value="${userInstance?.phone}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'email', 'error')} ">
	<label for="email">
		<g:message code="user.email.label" default="Email" />
		
	</label>
	<g:field type="email" name="email" value="${userInstance?.email}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'address', 'error')} ">
	<label for="address">
		<g:message code="user.address.label" default="Address" />
		
	</label>
	<g:textField name="address" value="${userInstance?.address}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'city', 'error')} ">
	<label for="city">
		<g:message code="user.city.label" default="City" />
		
	</label>
	<g:textField name="city" value="${userInstance?.city}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'country', 'error')} ">
	<label for="country">
		<g:message code="user.country.label" default="Country" />
		
	</label>
	<g:textField name="country" value="${userInstance?.country}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'firstname', 'error')} ">
	<label for="firstname">
		<g:message code="user.firstname.label" default="Firstname" />
		
	</label>
	<g:textField name="firstname" value="${userInstance?.firstname}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'lastname', 'error')} ">
	<label for="lastname">
		<g:message code="user.lastname.label" default="Lastname" />
		
	</label>
	<g:textField name="lastname" value="${userInstance?.lastname}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'postalCode', 'error')} ">
	<label for="postalCode">
		<g:message code="user.postalCode.label" default="Postal Code" />
		
	</label>
	<g:textField name="postalCode" value="${userInstance?.postalCode}"/>
</div>

