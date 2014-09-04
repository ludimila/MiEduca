<%@ page import="mieduca.Question" %>



<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'statement', 'error')} required">
	<label for="statement">
		<g:message code="question.statement.label" default="Statement" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="statement" required="" value="${questionInstance?.statement}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'options', 'error')} required">
	<label for="options">
		<g:message code="question.options.label" default="Options" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="options" from="${mieduca.AnswerOption.list()}" multiple="multiple" optionKey="id" size="5" required="" value="${questionInstance?.options*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'correctAnswer', 'error')} required">
	<label for="correctAnswer">
		<g:message code="question.correctAnswer.label" default="Correct Answer" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="correctAnswer" name="correctAnswer.id" from="${mieduca.AnswerOption.list()}" optionKey="id" required="" value="${questionInstance?.correctAnswer?.id}" class="many-to-one"/>
</div>

