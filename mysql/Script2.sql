SELECT * FROM tb_funcionario;

SELECT * FROM tb_object_funcionario;

#JSON é palavra reservada
SELECT `JSON` AS JSON_DOCUMENTO FROM tb_object_funcionario;

#Deixa ele identado - JSON_PRETTY(`JSON`)
SELECT JSON_PRETTY(`JSON`) AS JSON_DOCUMENTO FROM tb_object_funcionario;

#Apenas o campo Sexo
SELECT `JSON`->"$.Sexo" AS SEXO FROM tb_object_funcionario;

# Remove as aspas duplas - """",""
SELECT REPLACE(`JSON` -> "$.Sexo", """", "") AS SEXO FROM tb_object_funcionario;
SELECT REPLACE(JSON_EXTRACT(`JSON`,"$.Sexo"),"""","") AS SEXO FROM tb_object_funcionario;

# Estrai as propriedades do JSON
SELECT REPLACE(JSON_EXTRACT(`JSON`, "$.Cpf"), """", "")                 AS CPF,
       REPLACE(JSON_EXTRACT(`JSON`, "$.Data_Nascimento"), """", "")     AS Data_Nascimento,
       REPLACE(JSON_EXTRACT(`JSON`, "$.Primeiro_Nome"), """", "")       AS Primeiro_Nome,
       REPLACE(JSON_EXTRACT(`JSON`, "$.Nome_Meio"), """", "")           AS Nome_Meio,
       REPLACE(JSON_EXTRACT(`JSON`, "$.Ultimo_Nome"), """", "")         AS Ultimo_Nome,
       REPLACE(JSON_EXTRACT(`JSON`, "$.Endereco"), """", "")            AS Endereco,
       REPLACE(JSON_EXTRACT(`JSON`, "$.Salario"), """", "")             AS Salario,
       REPLACE(JSON_EXTRACT(`JSON`, "$.Sexo"), """", "")                AS Sexo,
       REPLACE(JSON_EXTRACT(`JSON`, "$.Cpf_Supervisor"), """", "")      AS Cpf_Supervisor,
       REPLACE(JSON_EXTRACT(`JSON`, "$.Numero_Departamento"), """", "") AS Numero_Departamento,
       REPLACE(JSON_EXTRACT(`JSON`, "$.Dependentes"), """", "")         AS Dependentes
FROM tb_object_funcionario
WHERE CPF = '12345678966';

