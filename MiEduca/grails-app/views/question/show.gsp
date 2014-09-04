
<%@ page import="mieduca.Question" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'question.label', default: 'Question')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-question" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-question" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list question">
			
				<g:if test="${questionInstance?.correctAnswer}">
				<li class="fieldcontain">
					<span id="correctAnswer-label" class="property-label"><g:message code="question.correctAnswer.label" default="Correct Answer" /></span>
					
						<span class="property-value" aria-labelledby="correctAnswer-label"><g:link controller="answerOption" action="show" id="${questionInstance?.correctAnswer?.id}">${questionInstance?.correctAnswer?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${questionInstance?.options}">
				<li class="fieldcontain">
					<span id="options-label" class="property-label"><g:message code="question.options.label" default="Options" /></span>
					
						<g:each in="${questionInstance.options}" var="o">
						<span class="property-value" aria-labelledby="options-label"><g:link controller="answerOption" action="show" id="${o.id}">${o?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${questionInstance?.statement}">
				<li class="fieldcontain">
					<span id="statement-label" class="property-label"><g:message code="question.statement.label" default="Statement" /></span>
					
						<span class="property-value" aria-labelledby="statement-label"><g:fieldValue bean="${questionInstance}" field="statement"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${questionInstance?.id}" />
					<g:link class="edit" action="edit" id="${questionInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
