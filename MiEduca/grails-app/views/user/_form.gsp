<%@ page import="mieduca.User" %>



<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'userName', 'error')} required">
	<label for="userName">
		<g:message code="user.userName.label" default="User Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="userName" required="" value="${userInstance?.userName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'email', 'error')} ">
	<label for="email">
		<g:message code="user.email.label" default="Email" />
		
	</label>
	<g:field type="email" name="email" value="${userInstance?.email}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'password', 'error')} ">
	<label for="password">
		<g:message code="user.password.label" default="Password" />
		
	</label>
	<g:field type="password" name="password" value="${userInstance?.password}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'points', 'error')} ">
	<label for="points">
		<g:message code="user.points.label" default="Points" />
		
	</label>
	<g:select name="points" from="${userInstance.constraints.points.inList}" value="${userInstance?.points}" valueMessagePrefix="user.points" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'webPage', 'error')} ">
	<label for="webPage">
		<g:message code="user.webPage.label" default="Web Page" />
		
	</label>
	<g:textField name="webPage" value="${userInstance?.webPage}"/>
</div>

