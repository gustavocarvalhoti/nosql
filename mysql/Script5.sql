create table t1 (`JSON` json);
insert into t1 values ('{"Hobby":["Praia", "Futebol", "Volei"]}');
select JSON_EXTRACT(`JSON`, "$.Hobby") as HOBBIES from t1;
# Primeiro Elemento
select JSON_EXTRACT(`JSON`, "$.Hobby[0]") as HOBBIES from t1;

drop table t2;
create table t2 (`JSON` json);
insert into t2
values ('{
  "Cliente": [
    {
      "Nome": "Gustavo",
      "Hobby": [
        "Praia",
        "Futebol",
        "Volei"
      ]
    },
    {
      "Nome": "Michelle",
      "Hobby": [
        "Praia"
      ]
    }
  ]
}');
SELECT * FROM t2;
SELECT JSON_EXTRACT(`JSON`, "$.Cliente[0].Nome") AS Cliente FROM t2;
SELECT JSON_EXTRACT(`JSON`, "$.Cliente[1].Nome") AS Cliente FROM t2;
SELECT JSON_EXTRACT(`JSON`, "$.Cliente[0].Hobby[0]") AS Cliente FROM t2;

CREATE TABLE t3 (`JSON` JSON);
INSERT INTO t3
VALUES ('{
  "Cliente": [
    {
      "Nome": "Gustavo",
      "Hobby": "Praia"
    },
    {
      "Nome": "Michelle",
      "Hobby": "Futebol"
    }
  ]
}');
SELECT JSON_EXTRACT(`JSON`, "$.Cliente[0].Nome") AS Cliente,
       JSON_EXTRACT(`JSON`, "$.Cliente[0].Hobby") AS Hobby FROM t3;

# Cria uma tabela a partir do JSON
SELECT jsonTable.NOME, jsonTable.HOBBY
FROM t3
CROSS JOIN JSON_TABLE (
    JSON_EXTRACT(`JSON`, "$.Cliente"), "$[*]"
    COLUMNS (NOME VARCHAR(10) PATH "$.Nome", HOBBY VARCHAR(10) PATH "$.Hobby")
) jsonTable;
