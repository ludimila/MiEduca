<%@ page import="mieduca.Course" %>



<div class="fieldcontain ${hasErrors(bean: courseInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="course.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" maxlength="100" required="" value="${courseInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: courseInstance, field: 'description', 'error')} required">
	<label for="description">
		<g:message code="course.description.label" default="Description" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="description" cols="40" rows="5" maxlength="5000" required="" value="${courseInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: courseInstance, field: 'publishDate', 'error')} required">
	<label for="publishDate">
		<g:message code="course.publishDate.label" default="Publish Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:formatDate format="dd/MM/yyyy" date="${courseInstance.publishDate}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: courseInstance, field: 'lastEditDate', 'error')} required">
	<label for="lastEditDate">
		<g:message code="course.lastEditDate.label" default="Last Edit Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:formatDate format="dd/MM/yyyy" date="${courseInstance?.lastEditDate}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: courseInstance, field: 'coursePhoto', 'error')} required">
	<label for="coursePhoto">
		<g:message code="course.coursePhoto.label" default="Course Photo" />
		<span class="required-indicator">*</span>
	</label>
	<input type="file" id="coursePhoto" name="coursePhoto" />
</div>

