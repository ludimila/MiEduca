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
	<g:textArea name="description" cols="40" rows="5" maxlength="5000" required="" value="${lessonInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: lessonInstance, field: 'questions', 'error')} ">
	<label for="questions">
		<g:message code="lesson.questions.label" default="Questions" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${lessonInstance?.questions?}" var="q">
    <li><g:link controller="question" action="show" id="${q.id}">${q?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="question" action="create" params="['lesson.id': lessonInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'question.label', default: 'Question')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: lessonInstance, field: 'contents', 'error')} ">
	<label for="contents">
		<g:message code="lesson.contents.label" default="Contents" />
		
	</label>
	<g:select name="contents" from="${mieduca.Content.list()}" multiple="multiple" optionKey="id" size="5" value="${lessonInstance?.contents*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: lessonInstance, field: 'course', 'error')} required">
	<label for="course">
		<g:message code="lesson.course.label" default="Course" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="course" name="course.id" from="${mieduca.Course.list()}" optionKey="id" required="" value="${lessonInstance?.course?.id}" class="many-to-one"/>
</div>

