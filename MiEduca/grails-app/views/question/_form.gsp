<%@ page import="mieduca.Question" %>



<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'answer', 'error')} required">
	<label for="answer">
		<g:message code="question.answer.label" default="Answer" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="answer" type="number" value="${questionInstance.answer}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'lesson', 'error')} required">
	<label for="lesson">
		<g:message code="question.lesson.label" default="Lesson" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="lesson" name="lesson.id" from="${mieduca.Lesson.list()}" optionKey="id" required="" value="${questionInstance?.lesson?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'statement', 'error')} ">
	<label for="statement">
		<g:message code="question.statement.label" default="Statement" />
		
	</label>
	<g:textField name="statement" value="${questionInstance?.statement}"/>
</div>

