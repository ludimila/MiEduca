<%@ page import="mieduca.Person" %>

<div id="header">
        	<div class="col-lg-6">
  				<h1 class="text-center">Cadastre-se</h1>

				<div class=" ${hasErrors(bean: personInstance, field: 'username', 'error')} required">
				    <div class="form-group">
                      <input type="text" class="form-control input-lg" placeholder="Nome" name="username" required="" value="${personInstance?.username}">
                    </div>
				</div>

				<div class=" ${hasErrors(bean: personInstance, field: 'password', 'error')} required">
				    <div class="form-group">
              			<input type="password" class="form-control input-lg" placeholder="Senha" name="password" required="" value="${personInstance?.password}">
           			</div>
				</div>

				<div class=" ${hasErrors(bean: personInstance, field: 'email', 'error')} required">
					<div class="form-group">
        				<input type="email" class="form-control input-lg" placeholder="E-mail" name="email" required="" value="${personInstance?.email}">
    				</div>
				</div>
				
				
				<div class=" ${hasErrors(bean: personInstance, field: 'photo', 'error')} required">
					<div class="form-group">
                      <input type="file" class="form-control input-lg" placeholder="Pagina da Web" id="photo" name="photo" />
                    </div>
				</div>  

				<!--
				<div class=" ${hasErrors(bean: personInstance, field: 'enabled', 'error')} ">

					<g:checkBox name="enabled" value="${true}" />
				</div> -->

				<!-- URL
				<div class=" ${hasErrors(bean: personInstance, field: 'webPage', 'error')} ">
					<div class="form-group">
                      <input type="text" class="form-control input-lg" placeholder="Pagina da Web" name="webPage" value="${personInstance?.webPage}">
                    </div>
				</div> -->

				<div class="form-group">
             		<button class="btn btn-theme btn-lg btn-block" name="create" value="${message(default: 'Create')}">Cadastrar</button>
            	</div>

        	</div> <!-- Fim div col lg 06-->
</div><!-- Fim div header-->
  
<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
<script src="${request.contextPath}/login/js/bootstrap.min.js"></script>

