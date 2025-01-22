-- The SELECT * command retrieves all columns in the table, providing a complete view of the data.
-- (O comando SELECT * recupera todas as colunas da tabela, fornecendo uma visão completa dos dados.)
select * from Product

-- Retrieve only the ProductName and BrandName columns from the Product table.
-- (Recupera apenas as colunas ProductName e BrandName da tabela Product.)
select ProductName, BrandName from Product

-- Retrieve all columns from the Product table where BrandName equals 'Contoso'.
-- (Recupera todas as colunas da tabela Product onde BrandName é igual a 'Contoso'.)
select * from Product
where BrandName = 'Contoso'

-- Display unique combinations of ClassName and BrandName.
-- (Exibe combinações únicas de ClassName e BrandName.)
select ClassName, BrandName from Product
group by ClassName, BrandName

-- Display unique combinations of ClassName and BrandName, along with the average UnitPrice for each group.
-- (Exibe combinações únicas de ClassName e BrandName, junto com o preço médio (UnitPrice) para cada grupo.)
select ClassName, BrandName, AVG(UnitPrice) as 'AVGUnitPrice' from Product
group by ClassName, BrandName


-- Perform a LEFT JOIN between Product and ProductSubcategory tables to retrieve all columns from both tables.
-- (Realiza um LEFT JOIN entre as tabelas Product e ProductSubcategory para recuperar todas as colunas de ambas as tabelas.)
select * from Product p
left join ProductSubcategory ps on ps.ProductSubcategoryKey = p.ProductSubcategoryKey

-- Use a LEFT JOIN to retrieve the BrandName and ProductSubcategoryName from Product and ProductSubcategory tables.
-- (Usa um LEFT JOIN para recuperar BrandName e ProductSubcategoryName das tabelas Product e ProductSubcategory.)
Use a LEFT JOIN to retrieve the BrandName and ProductSubcategoryName from Product and ProductSubcategory tables.
select p.BrandName, ps.ProductSubcategoryName from Product p
left join ProductSubcategory ps on ps.ProductSubcategoryKey = p.ProductSubcategoryKey

-- Retrieve the first 10 rows from the Product table.
-- (Recupera as 10 primeiras linhas da tabela Product.)
select TOP(10) * from Product

-- Retrieve all columns from the Product table and order the results by the UnitPrice column in descending order.
-- (Recupera todas as colunas da tabela Product e ordena os resultados pela coluna UnitPrice em ordem decrescente.)
select * from Product
order by UnitPrice DESC