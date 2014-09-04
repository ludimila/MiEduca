<%@ page import="mieduca.AnswerOption" %>



<div class="fieldcontain ${hasErrors(bean: answerOptionInstance, field: 'number', 'error')} required">
	<label for="number">
		<g:message code="answerOption.number.label" default="Number" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="number" type="number" value="${answerOptionInstance.number}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: answerOptionInstance, field: 'text', 'error')} required">
	<label for="text">
		<g:message code="answerOption.text.label" default="Text" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="text" required="" value="${answerOptionInstance?.text}"/>
</div>
