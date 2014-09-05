<%@ page import="mieduca.Person" %>

<div id="header">
  	<div class="container">
  		<div class="row">
  			
        	<div class="col-lg-6">
  				<h1 class="text-center">Cadastre-se</h1>

				<div class=" ${hasErrors(bean: personInstance, field: 'username', 'error')} required">
				
					<g:textField name="username" required="" value="${personInstance?.username}"/>
				</div>

				<div class=" ${hasErrors(bean: personInstance, field: 'password', 'error')} required">
						<g:message code="person.password.label" default="Password" />
					<g:textField name="password" required="" value="${personInstance?.password}"/>
				</div>

				<div class=" ${hasErrors(bean: personInstance, field: 'email', 'error')} required">
						<g:message code="person.email.label" default="Email" />
					<g:field type="email" name="email" required="" value="${personInstance?.email}"/>
				</div>

				<div class=" ${hasErrors(bean: personInstance, field: 'photo', 'error')} required">
						<g:message code="person.photo.label" default="Photo" />
					<input type="file" id="photo" name="photo" />
				</div>

				<div class=" ${hasErrors(bean: personInstance, field: 'enabled', 'error')} ">
						<g:message code="person.enabled.label" default="Enabled" />
					<g:checkBox name="enabled" value="${true}" />
				</div>

				<div class=" ${hasErrors(bean: personInstance, field: 'webPage', 'error')} ">
						<g:message code="person.webPage.label" default="Web Page" />
					<g:textField name="webPage" value="${personInstance?.webPage}"/>
				</div>
        	</div> <!-- Fim div col lg 06-->
        </div> <!-- Fim div row-->
    </div><!-- Fim div container-->
</div><!-- Fim div header-->
  
<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
<script src="${request.contextPath}/login/js/bootstrap.min.js"></script>

