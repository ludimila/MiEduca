<%@ page import="mieduca.Area" %>



<div class="fieldcontain ${hasErrors(bean: areaInstance, field: 'courses', 'error')} required">
	<label for="courses">
		<g:message code="area.courses.label" default="Courses" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="courses" from="${mieduca.Course.list()}" multiple="multiple" optionKey="id" size="5" required="" value="${areaInstance?.courses*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: areaInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="area.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" maxlength="50" required="" value="${areaInstance?.name}"/>
</div>

