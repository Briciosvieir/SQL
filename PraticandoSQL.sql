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

--DISTINCT pega apenas nomes únicos da tabela
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
--Funções de agregação  basicamente agregam ou combinan dados de uma tabela em 1 resultado só.

-- Somando o valor total dos valores de uma tabela, SUM é a soma do que você selecionar
select SUM(linetotal) as 'Soma Total' from Sales.SalesOrderDetail;

 -- Qual  menor valor da tabela Sales 
 select min(LineTotal) as 'Valor Minimo' from Sales.SalesOrderDetail;

 -- Qual a média do valor total das tabelas, utilize AVG
 select AVG(LineTotal) AS 'Média' from sales.SalesOrderDetail;

 -- ########### Group by #################
 --Divide o resultado da sua pesquisa em grupos.

 --Exemplo agrupando pelo ID.
 select SpecialOfferID, SUM(UnitPrice)  from sales.SalesOrderDetail group by SpecialOfferID;

 -- Vamos dizer que eu quero saber quantos de cada produto foi vendido até hoje.
 select ProductID, COUNT(ProductID) from Sales.SalesOrderDetail group by ProductID;

 --Quero saber quantos nomes de cada nomes temos no banco de dados
 select FirstName, COUNT(FirstName) as 'Quantidade de Cada Nome' from Person.Person group by FirstName order by FirstName asc ;

 --Na tabela de produtos eu quero saber a media de preço  para os produtos que são pratas (silver)
 select Color, AVG(ListPrice) from Production.Product where color ='silver' group by Color;

 --( 1 )Quero saber quantas pessoas tem o mesmo middlename (nome do meio ) e agrupe pelo middlename
 select MiddleName, COUNT(MiddleName) AS 'Quantidade de Pessoas nome do meio' from Person.Person group by MiddleName;

 --( 2 ) Eu preciso saber a média e qual é a quantidade (qantity orderQTY) que cada produto é vendido na loja.
 select ProductID, AVG(OrderQty) AS 'Média' from Sales.SalesOrderDetail group by ProductID;
  
 --( 3 ) Quero saber quais foram as 10 vendas que no total tiveram os maiores valores de vendas 
 --(linetotal) por produto do maior valor para o menor
select top 10 ProductID, SUM(LineTotal) AS 'Valor total' from sales.SalesOrderDetail group by ProductID order by SUM(LineTotal) desc;

--( 4 ) Quantos produtos e qual a media de produtos temos cadastrados nas ordens de serviços (workOrder), agrupados por produtcID
select ProductID, COUNT(ProductID) as 'Estoque', AVG(OrderQty) AS 'média' from Production.WorkOrder group by ProductID order by ProductID;

--################################  HAVING ##########################
-- Normalmente é usado junto com grupo by

select FirstName, COUNT(FirstName) as 'Quantidade' from Person.Person
group by FirstName having COUNT(FirstName) > 10 and COUNT(FirstName)< 30 ;

-- Queremos saber quais pordutos que no total de vendas estão entre 162 a 500k
select top 10 ProductID, sum(LineTotal)  AS'Total' from Sales.SalesOrderDetail group by ProductID having sum(LineTotal) between 162000 and 500000;

--  Quero saber quais nomes no sistema tem uma ocorrencia de maior que 10 vezes, porém somente onde o título é "Mr"
select FirstName, COUNT(FirstName) from person.Person where Title ='Mr.' group by FirstName having COUNT(FirstName) > 10 ;
select *from person.person;

-- ( 1 )Estamos querendo identificar as provincias (stateProvincedID) com o maior numero de cadastros no nosso sistema, então é preciso encontrar quais
--provincias (stateProvinced ) estão registradas no banco de dados mais de 1000 vezes
select * from person.Address;
select StateProvinceID, COUNT(StateProvinceID)AS'Quanidade' from person.Address group by StateProvinceID having COUNT(StateProvinceID)>1000;

--( 2 )Quero saber quais os produtos (productid) não estao trazendo media minima de 1 milhão em total de vendas(linetotal)
select*from Sales.SalesOrderDetail;

