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
select * from t2;
select JSON_EXTRACT(`JSON`, "$.Cliente[0].Nome") as Cliente from t2;
select JSON_EXTRACT(`JSON`, "$.Cliente[1].Nome") as Cliente from t2;
select JSON_EXTRACT(`JSON`, "$.Cliente[0].Hobby[0]") as Cliente from t2;

create table t3 (`JSON` json);
insert into t3
values ('{
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
select JSON_EXTRACT(`JSON`, "$.Cliente[0].Nome") as Cliente,
       JSON_EXTRACT(`JSON`, "$.Cliente[0].Hobby") as Hobby from t3;

# Cria uma tabela a partir do JSON
SELECT jsonTable.NOME, jsonTable.HOBBY
FROM t3
         CROSS JOIN JSON_TABLE (
        JSON_EXTRACT(`JSON`, "$.Cliente"), "$[*]"
        COLUMNS (NOME VARCHAR(10) PATH "$.Nome", HOBBY VARCHAR(10) PATH "$.Hobby")
    ) jsonTable;
