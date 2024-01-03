-- criando um usuario pelos códigos // 'supervisor' = nome do usuario // '@' = está localizado em // 'localhost' é onde está hospedado o servidor, caso seja longe coloque o IP //
create user 'supervisor'@'localhost' identified by 'Root#23#Sp2';

-- dar permissões // SPTECHB é o database criado em sala // isso está garantindo as permissões de edição do usuario para o database selecionado. // 
grant SELECT, UPDATE, DELETE, INSERT on sptechb.*
								to 'supervisor'@'localhost';

-- garantir / confirmar que estou dando os privilegios
flush privileges;

-- editar as permissões do ususario
revoke SELECT, UPDATE, DELETE, INSERT on sptechb.*
		from 'supervisor'@'localhost';
        
-- garantir / confirmar que estou dando os privilegios, sempre dar isso ao final das alterações
flush privileges;        

-- adicionar todos os comandos/permissão para o usuario supervisor // sempre colocar o 'nome'@'local-hospedado' ;
grant all privileges on sptech.*
		to 'supervisor'@'localhost';
    
flush privileges;

create database sptechb;

grant SELECT, UPDATE, DELETE, INSERT on sptechb.*
								to 'supervisor'@'localhost';
                                
flush privileges;

grant CREATE, SELECT, UPDATE, DELETE, INSERT on sptechb.* 
			to 'supervisor'@'localhost';
            
flush privileges;

revoke SELECT, UPDATE, DELETE, INSERT on sptechb.*
		from 'supervisor'@'localhost';