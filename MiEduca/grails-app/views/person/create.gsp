<%@ page import="mieduca.Person" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
    	<meta http-equiv="X-UA-Compatible" content="IE=edge">
   		<meta name="viewport" content="width=device-width, initial-scale=1.0">
    	<meta name="description" content="">
    	<meta name="author" content="">
    	<link rel="shortcut icon" href="${request.contextPath}/login/img/favicon.png">

    	<title>MiEduca</title>

    	<!-- Bootstrap -->
    	<link href="${request.contextPath}/login/css/bootstrap.css" rel="stylesheet">
		<link href="${request.contextPath}/login/css/bootstrap-theme.css" rel="stylesheet">

    	<!-- siimple style -->
    	<link href="${request.contextPath}/login/css/style.css" rel="stylesheet">
    
    	<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    	<!--[if lt IE 9]>
      		<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      		<script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
   		<![endif]-->

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


		<!-- Fixed navbar -->
    	<div class="navbar navbar-inverse navbar-fixed-top">
      		<div class="container">

        		<div class="navbar-header">
          			<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            			<span class="icon-bar"></span>
            			<span class="icon-bar"></span>
            			<span class="icon-bar"></span>
         			 </button>
          			<a class="navbar-brand" href="index.html">MiEduca</a>
        		</div>

        		<div class="navbar-collapse collapse">
          			<ul class="nav navbar-nav navbar-right">
			     		<li><a href="${request.contextPath}/signin.html">Entrar</a></li>
          			</ul>
        		</div><!--/.nav-collapse -->

     		 </div>
    	</div>
   		<!-- FIM Nabar -->

		<div id="create-person" class="content scaffold-create" role="main">
			<h1><g:message code="default.create.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${personInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${personInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form action="save"  enctype="multipart/form-data">
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
