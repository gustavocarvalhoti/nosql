SELECT JSON_EXTRACT(`JSON`, "$.Dependentes") FROM tb_object_funcionario;

SELECT JSON_EXTRACT(`JSON`, "$.Dependentes[0]") FROM tb_object_funcionario;

SELECT JSON_EXTRACT(`JSON`, "$.Cpf"),
       JSON_EXTRACT(`JSON`, "$.Dependentes[0].Nome_Dependente")
FROM tb_object_funcionario;

SELECT
    REPLACE(JSON_EXTRACT(tb_object_funcionario.`JSON`, "$.Cpf"), """", "") AS CPF_FUNCIONARIO,
    jsonTable.NOME_DEPENDENTE,
    jsonTable.SEXO,
    jsonTable.DATA_NASCIMENTO,
    jsonTable.PARENTESCO
FROM tb_object_funcionario
         CROSS JOIN JSON_TABLE (
        JSON_EXTRACT(`JSON`, "$.Dependentes"), "$[*]"
        COLUMNS (
            NOME_DEPENDENTE VARCHAR(20) PATH "$.Nome_Dependente",
            SEXO            VARCHAR(20) PATH "$.Sexo",
            DATA_NASCIMENTO DATETIME    PATH "$.Data_Nascimento",
            PARENTESCO      VARCHAR(10) PATH "$.Parentesco"
            )
    ) jsonTable;

# Funcionário sem dependente
select tf.PRIMEIRO_NOME, tf.NOME_MEIO, tf.ULTIMO_NOME
from tb_funcionario tf
         left join tb_dependente td on tf.CPF = td.CPF_FUNCIONARIO
where td.CPF_FUNCIONARIO is null;
# Funcionário sem dependente
SELECT JSON_EXTRACT(tb_object_funcionario.`JSON`, "$.Primeiro_Nome") AS PRIMEIRO_NOME,
       JSON_EXTRACT(tb_object_funcionario.`JSON`, "$.Nome_Meio")     AS NOME_MEIO,
       JSON_EXTRACT(tb_object_funcionario.`JSON`, "$.Ultimo_Nome")   AS ULTIMO_NOME
FROM tb_object_funcionario
         LEFT JOIN (
    SELECT JSON_EXTRACT(tb_object_funcionario.`JSON`, "$.Cpf") AS Cpf_Funcionario,
           tb_object_dependente.Nome_Dependente,
           tb_object_dependente.Sexo,
           tb_object_dependente.Data_Nascimento,
           tb_object_dependente.Parentesco
    FROM tb_object_funcionario
             CROSS JOIN
         JSON_TABLE(
                 JSON_EXTRACT(`JSON`, "$.Dependentes"), "$[*]"
                 COLUMNS (
                     Nome_Dependente VARCHAR(20) PATH "$.Nome_Dependente",
                     Sexo VARCHAR(20) PATH "$.Sexo",
                     Data_Nascimento Datetime PATH "$.Data_Nascimento",
                     Parentesco VARCHAR(10) PATH "$.Parentesco")
             ) AS tb_object_dependente
) tb_dependente ON JSON_EXTRACT(tb_object_funcionario.`JSON`, "$.Cpf") = tb_dependente.Cpf_Funcionario
WHERE tb_dependente.Cpf_Funcionario IS NULL;