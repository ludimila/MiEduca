<html>
<head>
	<g:render template="bootstrap"/>
	<title><g:message code="springSecurity.login.title"/></title>
</head>

<body>

<g:render template="navbar"/>
<div id="header">
	<div class="col-lg-6">
		<div class="form-group">

			<g:if test='${flash.message}'>
				<div class='login_message'>${flash.message}</div>
			</g:if>

			<form action='${postUrl}' method='POST' id='loginForm' class="form-group" autocomplete='off'>
				<div class="form-group"><p>
					<input type='text' class="form-control input-lg" name='j_username' id='username' placeholder="Nome"/>
				</p></div>

				<div class="form-group"><p>
					<input type='password' class="form-control input-lg" name='j_password' id='password' placeholder="Senha"/>
				</p></div>

				<div class="form-group"><p>
					<!--<input type='submit' id="submit" value='${message(code: "springSecurity.login.button")}'/>-->
					<button class="btn btn-theme btn-lg btn-block" name="create" type='submit' id="submit">Entrar</button>
				</p></div>

				<div class="form-group"><p id="remember_me_holder">
					<input type='checkbox' class='chk' name='${rememberMeParameter}' id='remember_me' <g:if test='${hasCookie}'>checked='checked'</g:if>/>
					<label for='remember_me'><g:message code="springSecurity.login.remember.me.label"/></label>
				</p></div>

			</form>
		</div>
	</div>
</div>
<script type='text/javascript'>
	<!--
	(function() {
		document.forms['loginForm'].elements['j_username'].focus();
	})();
	// -->
</script>
</body>
</html>
