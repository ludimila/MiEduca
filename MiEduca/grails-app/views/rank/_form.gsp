<%@ page import="mieduca.Rank" %>



<div class="fieldcontain ${hasErrors(bean: rankInstance, field: 'users', 'error')} ">
	<label for="users">
		<g:message code="rank.users.label" default="Users" />
		
	</label>
	<g:select name="users" from="${mieduca.User.list()}" multiple="multiple" optionKey="id" size="5" value="${rankInstance?.users*.id}" class="many-to-many"/>
</div>

