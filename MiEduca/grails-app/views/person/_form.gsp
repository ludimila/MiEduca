<%@ page import="mieduca.Person" %>



<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'email', 'error')} required">
	<label for="email">
		<g:message code="person.email.label" default="Email" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="email" name="email" required="" value="${personInstance?.email}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'user', 'error')} required">
	<label for="user">
		<g:message code="person.user.label" default="User" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="user" name="user.id" from="${mieduca.User.list()}" optionKey="id" required="" value="${personInstance?.user?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'webPage', 'error')} ">
	<label for="webPage">
		<g:message code="person.webPage.label" default="Web Page" />
		
	</label>
	<g:textField name="webPage" value="${personInstance?.webPage}"/>
</div>

