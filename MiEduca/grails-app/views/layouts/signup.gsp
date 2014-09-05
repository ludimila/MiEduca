<!DOCTYPE html>
<html lang="pt-br">
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
  </head>

  <body>

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

	<div id="header">
		<div class="container">
			<div class="row">
			
      	<div class="col-lg-6">
					<h1 class="text-center">Cadastre-se</h1>

					<form class="form col-md-12 center-block">

                  <div class="form-group">
                      <input type="text" class="form-control input-lg" placeholder="Nome">
                  </div>

            			<div class="form-group">
            			  	<input type="email" class="form-control input-lg" placeholder="E-mail">
           				 </div>

           				 <div class="form-group">
              				<input type="password" class="form-control input-lg" placeholder="Senha">
           				 </div>

           				 <div class="form-group">
             				 <button class="btn btn-theme btn-lg btn-block">Cadastrar</button>
            			</div>

          </form>
        </div> <!-- Fim div col lg 06-->
      </div> <!-- Fim div row-->
    </div><!-- Fim div container-->
  </div><!-- Fim div header-->
    <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
    <script src="${request.contextPath}/login/js/bootstrap.min.js"></script>
  </body>
</html>
