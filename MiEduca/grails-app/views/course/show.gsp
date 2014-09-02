
<%@ page import="mieduca.Course" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'course.label', default: 'Course')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-course" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-course" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list course">
			
				<g:if test="${courseInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="course.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${courseInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${courseInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="course.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${courseInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${courseInstance?.publishDate}">
				<li class="fieldcontain">
					<span id="publishDate-label" class="property-label"><g:message code="course.publishDate.label" default="Publish Date" /></span>
					
						<span class="property-value" aria-labelledby="publishDate-label"><g:formatDate date="${courseInstance?.publishDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${courseInstance?.lastEditDate}">
				<li class="fieldcontain">
					<span id="lastEditDate-label" class="property-label"><g:message code="course.lastEditDate.label" default="Last Edit Date" /></span>
					
						<span class="property-value" aria-labelledby="lastEditDate-label"><g:formatDate date="${courseInstance?.lastEditDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${courseInstance?.points}">
				<li class="fieldcontain">
					<span id="points-label" class="property-label"><g:message code="course.points.label" default="Points" /></span>
					
						<span class="property-value" aria-labelledby="points-label"><g:fieldValue bean="${courseInstance}" field="points"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${courseInstance?.coursePhoto}">
				<li class="fieldcontain">
					<span id="coursePhoto-label" class="property-label"><g:message code="course.coursePhoto.label" default="Course Photo" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${courseInstance?.id}" />
					<g:link class="edit" action="edit" id="${courseInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
