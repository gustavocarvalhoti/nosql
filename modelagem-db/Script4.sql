SELECT SUM(salario) AS SALARIO_TOTAL FROM tb_funcionario;

# Por linha
SELECT JSON_EXTRACT(`JSON`,"$.Salario") AS SALARIO_TOTAL FROM tb_object_funcionario;
# Soma os valores
SELECT SUM(JSON_EXTRACT(`JSON`,"$.Salario")) AS SALARIO_TOTAL FROM tb_object_funcionario;

# Agrupa por departamento
SELECT Numero_Departamento, SUM(salario) as SALARIO_TOTAL from tb_funcionario
GROUP BY Numero_Departamento
ORDER BY Numero_Departamento;
# NoSQL
SELECT REPLACE(JSON_EXTRACT(`JSON`, "$.Numero_Departamento"), """", "") AS Numero_Departamento
     , SUM(JSON_EXTRACT(`JSON`, "$.Salario"))                           as SALARIO_TOTAL
from tb_object_funcionario
GROUP BY REPLACE(JSON_EXTRACT(`JSON`, "$.Numero_Departamento"), """", "")
ORDER BY REPLACE(JSON_EXTRACT(`JSON`, "$.Numero_Departamento"), """", "");