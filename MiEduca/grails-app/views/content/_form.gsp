<%@ page import="mieduca.Content" %>



<div class="fieldcontain ${hasErrors(bean: contentInstance, field: 'type', 'error')} required">
	<label for="type">
		<g:message code="content.type.label" default="Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="type" type="number" value="${contentInstance.type}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: contentInstance, field: 'data', 'error')} required">
	<label for="data">
		<g:message code="content.data.label" default="Data" />
		<span class="required-indicator">*</span>
	</label>
	<input type="file" id="data" name="data" />
</div>
