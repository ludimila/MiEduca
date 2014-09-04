
<%@ page import="mieduca.AnswerOption" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'answerOption.label', default: 'AnswerOption')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-answerOption" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-answerOption" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="number" title="${message(code: 'answerOption.number.label', default: 'Number')}" />
					
						<g:sortableColumn property="text" title="${message(code: 'answerOption.text.label', default: 'Text')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${answerOptionInstanceList}" status="i" var="answerOptionInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${answerOptionInstance.id}">${fieldValue(bean: answerOptionInstance, field: "number")}</g:link></td>
					
						<td>${fieldValue(bean: answerOptionInstance, field: "text")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${answerOptionInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
