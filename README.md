MiEduca
=======

 MiEduca é uma aplicativo web que tem como principal objetivo oferecer um ambiente de aprendizagem virtual capaz de garantir a circulação do conhecimento, que estaria disponível em trilhas de cursos para os interessados. 

How to Install
======

1. Certifique-se de que a variável $JAVA_HOME está setada corretamente. Caso esteja, pule para o passo 4.
2. Caso não esteja setada. Utilize o seguinte comando: export JAVA_HOME=/usr/lib/jvm/java-<version> (Diretório onde comumente é instalado o Java).
3. Em seguida, o comando: export PATH=$JAVA_HOME/bin:$PATH
4. Instale o Curl: sudo apt-get install curl
5. Instale a VM do groovy pelo Curl: curl -s get.gvmtool.net | bash
6. Abra uma nova aba do terminal e instale o grails: gvm install grails 2.2.4 
7. Se dirija ao diretório onde se encontra o projeto.
8. Rode o seguinte comando no diretório que possui a pasta grails-app: grails run-app
9. Espere o Grails compilar e rodar o servidor.
10. Abra uma aba no seu navegador e na barra de endereços, coloque o endereço o qual foi dado pelo GVM.
