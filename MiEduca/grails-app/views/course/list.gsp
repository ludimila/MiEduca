
<%@ page import="mieduca.Course" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'course.label', default: 'Curso')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-course" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-course" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'course.name.label', default: 'Nome')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'course.description.label', default: 'Descrição')}" />
					
						<g:sortableColumn property="coursePhoto" title="${message(code: 'course.coursePhoto.label', default: 'Course Photo')}" />
					
						<g:sortableColumn property="publishDate" title="${message(code: 'course.publishDate.label', default: 'Data de publicação')}" />
					
						<g:sortableColumn property="lastEditDate" title="${message(code: 'course.lastEditDate.label', default: 'Data da última edição')}" />
					
						<g:sortableColumn property="points" title="${message(code: 'course.points.label', default: 'Pontos')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${courseInstanceList}" status="i" var="courseInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${courseInstance.id}">${fieldValue(bean: courseInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: courseInstance, field: "description")}</td>
					
						<td>${fieldValue(bean: courseInstance, field: "coursePhoto")}</td>
					
						<td><g:formatDate date="${courseInstance.publishDate}" /></td>
					
						<td><g:formatDate date="${courseInstance.lastEditDate}" /></td>
					
						<td>${fieldValue(bean: courseInstance, field: "points")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${courseInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
