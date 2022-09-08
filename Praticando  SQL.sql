--Distinct: Retorna dados da tabela eliminando nomes ou dados repetidos.
select distinct firstname from person.person;

-- Where: onde a condição é pegar os nomes unicos que tem como sobrenome  Miller
select distinct firstname, lastname from person.person where lastname = 'miller';

--Forma de trazer todos os produtos que tem valor entre 500 a 700kg
select * from Production.Product where  listPrice >= 500 and listprice <=700 order by name;

--Forma de remover um elemento, exemplo cor com <>
select * from Production.Product where  color <> 'red' and listPrice >= 500 and listprice <=700 order by name;

--Forma de trazer o peso:
select * from Production.Product where  weight >= 500 and weight <=700 order by name;

--Foi pedido ao marketing a relacao de quem é casado e tem salario.
select * from HumanResources.Employee where MaritalStatus = 'm' and SalariedFlag > 0;

--Achar e e-mail de Peter Krebs juntando duas tabelas da forma simples observando pelo id
select * from Person.Person where FirstName ='Peter' and LastName = 'Krebs'; 
select * from Person.EmailAddress where BusinessEntityID ='26';

--DISTINCT elimina nomes repetidos da tabela exemplo é nomes.
SELECT DISTINCT LastName FROM Person.Person;
SELECT DISTINCT count( LastName ) FROM Person.Person;

--Count da o número de linhas, faça a contagem de todas as colunas na tabela
select COUNT(*) from Person.Person;

--Saber quantos produtos tem cadastrado na tabela de produtos
select COUNT(*) from Production.Product;

--Quantos tamanhos de produtos temos cadastrados em nossa tabela (production.product)
select COUNT(size) from Production.Product;

--Comando TOP que seleciona a quantidade que você quer.
select top 10 * from Production.Product;

--Ordene a coluna person em ordem crescente pesson pelo id.
select * from Person.Person order by BusinessEntityID asc;

--Ordene a coluna product em ordem decrescente pesson pelo id.
select* from Production.Product order by ProductID desc;

--Select os produtos mais caros como top 10
select top 10 ProductID as id, ListPrice as preço from  Production.Product order by ListPrice desc;

-- Between (Liste todos os produtos que ficam entre 1000 a 1500
select * from Production.Product where ListPrice between 1000 and 1500 order by ListPrice asc;

-- Between (Liste todos os produtos que NÃOOO ESTÃO entre 1000 a 1500
select * from Production.Product where ListPrice  NOT between 1000 and 1500 order by ListPrice asc;

--BETWEEN com data, encontre os empregados que foram contratados entre 2010 a 2015
select * from HumanResources.Employee where HireDate between '2010/01/01' and '2015/01/01' order by HireDate asc;

-- Fazer uma pusca no banco de dados com IN de duas cores, red e black;
select * from production.product where color in ('red','black') order by color asc;


--Procurar algo com  o like, exemplo procurar alguem que o nome começa com OVI...
select * from Person.Person where FirstName like 'ovi%';

-- ######### Atividades de tudo que foi visto #########

-- ( 1 )Quantos produtos temos cadastrado no sistema de custam mais de 1500 dolares
select count(ListPrice) from Production.Product where ListPrice > 1500;

-- ( 2 ) Quantas pessoas temos com nome que inicia com a letra P
select count( FirstName ) from Person.Person where FirstName like 'P%';

-- ( 3 ) Em quantas cidades unicas estão cadastradas nossos clientes
 select  COUNT(distinct(city)) from Person.Address;

 -- ( 4 ) Quais são as cidades unicas que temos cadastrdos em nosso sistema
 select distinct city from Person.Address;

 -- ( 5 ) Quantos produtos red tem o preço entre 500 a 1000 dolares
select COUNT(*) from Production.Product where Color = 'red' and ListPrice between 500 and 1000;

-- ( 6 ) Quantos produtos cadastrado tem a palavra road no nome deles?
select COUNT(*) from Production.Product where Name like '%road%';

-- ##################  MIN - MAX - SUM E AVG ####################
--Funções de agregação  vasicamente agregam ou combinan dados de uma tabela em 1 resultado só.




