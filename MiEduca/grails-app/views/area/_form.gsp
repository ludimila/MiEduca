<%@ page import="mieduca.Area" %>



<div class="fieldcontain ${hasErrors(bean: areaInstance, field: 'courses', 'error')} ">
	<label for="courses">
		<g:message code="area.courses.label" default="Courses" />
		
	</label>
	<g:select name="courses" from="${mieduca.Course.list()}" multiple="multiple" optionKey="id" size="5" value="${areaInstance?.courses*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: areaInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="area.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${areaInstance?.name}"/>
</div>

