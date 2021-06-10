SELECT * FROM tb_funcionario;
SELECT * FROM tb_dependente;
SELECT * FROM tb_object_funcionario;
SELECT * FROM tb_funcionario WHERE sexo = 'F';

# Nesse caso não funciona porque tem o campo JSON, não tem o campo sexo
SELECT * FROM tb_object_funcionario WHERE sexo = 'F';