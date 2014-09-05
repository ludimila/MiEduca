<%@ page import="mieduca.Course" %>



<div class="fieldcontain ${hasErrors(bean: courseInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="course.name.label" default="Nome" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" maxlength="100" required="" value="${courseInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: courseInstance, field: 'description', 'error')} required">
	<label for="description">
		<g:message code="course.description.label" default="Descrição" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="description" cols="40" rows="5" maxlength="5000" required="" value="${courseInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: courseInstance, field: 'coursePhoto', 'error')} required">
	<label for="coursePhoto">
		<g:message code="course.coursePhoto.label" default="Course Photo" />
		<span class="required-indicator">*</span>
	</label>
	<input type="file" id="coursePhoto" name="coursePhoto" />
</div>

<div class="fieldcontain ${hasErrors(bean: courseInstance, field: 'lessons', 'error')} required">
	<label for="lessons">
		<g:message code="course.lessons.label" default="Aulas" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="lessons" from="${mieduca.Lesson.list()}" multiple="multiple" optionKey="id" size="5" required="" value="${courseInstance?.lessons*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: courseInstance, field: 'publishDate', 'error')} required">
	<label for="publishDate">
		<g:message code="course.publishDate.label" default="Data de publicação" />
		<span class="required-indicator">*</span>
	</label>
	${courseInstance?.publishDate?.toString()}
</div>

<div class="fieldcontain ${hasErrors(bean: courseInstance, field: 'lastEditDate', 'error')} required">
	<label for="lastEditDate">
		<g:message code="course.lastEditDate.label" default="Data da última edição" />
		<span class="required-indicator">*</span>
	</label>
	${courseInstance?.lastEditDate?.toString()}
</div>

