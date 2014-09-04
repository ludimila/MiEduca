<%@ page import="mieduca.Question" %>



<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'correctAnswer', 'error')} required">
	<label for="correctAnswer">
		<g:message code="question.correctAnswer.label" default="Correct Answer" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="correctAnswer" name="correctAnswer.id" from="${mieduca.AnswerOption.list()}" optionKey="id" required="" value="${questionInstance?.correctAnswer?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'options', 'error')} ">
	<label for="options">
		<g:message code="question.options.label" default="Options" />
		
	</label>
	<g:select name="options" from="${mieduca.AnswerOption.list()}" multiple="multiple" optionKey="id" size="5" value="${questionInstance?.options*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'statement', 'error')} ">
	<label for="statement">
		<g:message code="question.statement.label" default="Statement" />
		
	</label>
	<g:textField name="statement" value="${questionInstance?.statement}"/>
</div>

