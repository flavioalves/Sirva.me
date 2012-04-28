## Sirva.me

Para saber sobre o sistema, visite [este link](http://felipebazzarella.wordpress.com/2012/04/23/nasceu-meu-primeiro-filho-conheca-o-sirva-me).

### Rodando Localmente

Confira o config/database.yml, veja se está tudo certo e rode:
	
	bundle install

	rake db:create

	rake db:migrate

	rails server thin

Acesse a área administrativa:

	http://localhost:3000/admin

Importe as empresas à partir de um CSV (db/new_companies.csv):

	rake companies:push

Rode as Specs:

	rake db:test:prepare

	spork # Opcional, caso queira usar o Spork

	rspec spec/

Faça deploy automatizado no Heroku:

	rake integrate # Deploy para Staging

	rake deploy # Deploy para Production

### Importante

* Insira os tokens de suas contas em app/helpers/application_helper.rb.
* Também insira os nomes de suas apps em lib/tasks/integrate.rake e lib/tasks/deploy.rake.
* As configurações atuais para envio de e-mail utiliza o Sendgrid (Heroku Add-On) e exije sua atenção nos arquivos config/environments/staging.rb e config/environment/production.rb.

### Licença

Faça o que quiser com este repositório.

### Créditos

* Felipe Bazzarella - [bazzarella.com](http://bazzarella.com) - fbazzarella@gmail.com