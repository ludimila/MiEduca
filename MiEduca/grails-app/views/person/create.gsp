<%@ page import="mieduca.Person" %>
<!DOCTYPE html>
<html>
	<head>
		<g:render template="bootstrap"/>

		<g:set var="entityName" value="${message(code: 'person.label', default: 'Person')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<!-- Barra principal para voltar para o pagina inicial	
		<a href="#create-person" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
			</ul>
		</div> -->

		<g:render template="navbar"/>

		<div id="create-person" class="content scaffold-create" role="main">
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${personInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${personInstance}" var="error">
					<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/>
					</li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form action="save"  enctype="multipart/form-data">
				<g:render template="form"/>
			</g:form>
		</div>
	</body>
</html>
