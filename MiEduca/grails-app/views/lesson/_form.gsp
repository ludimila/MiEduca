<%@ page import="mieduca.Lesson" %>



<div class="fieldcontain ${hasErrors(bean: lessonInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="lesson.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" maxlength="100" required="" value="${lessonInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: lessonInstance, field: 'description', 'error')} required">
	<label for="description">
		<g:message code="lesson.description.label" default="Description" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="description" required="" value="${lessonInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: lessonInstance, field: 'contents', 'error')} required">
	<label for="contents">
		<g:message code="lesson.contents.label" default="Contents" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="contents" from="${mieduca.Content.list()}" multiple="multiple" optionKey="id" size="5" required="" value="${lessonInstance?.contents*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: lessonInstance, field: 'questions', 'error')} required">
	<label for="questions">
		<g:message code="lesson.questions.label" default="Questions" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="questions" from="${mieduca.Question.list()}" multiple="multiple" optionKey="id" size="5" required="" value="${lessonInstance?.questions*.id}" class="many-to-many"/>
</div>

