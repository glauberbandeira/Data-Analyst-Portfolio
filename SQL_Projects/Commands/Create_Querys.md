# **Creating Queries for Dimensions | Criando Queries para as Dimensões**

Este documento contém as queries utilizadas para criar dimensões em um ambiente de análise de dados. Cada query é explicada em inglês e português para facilitar o entendimento.

---

## **1. Query to Create `dProduto` | Query para criar a `dProduto`**

```sql
SELECT
    p.ProductKey,
    p.ProductName,
    p.BrandName,
    p.ProductSubcategoryKey,
    ps.ProductSubcategoryName,
    pc.ProductCategoryKey
FROM Product p
LEFT JOIN ProductSubcategory ps ON ps.ProductSubcategoryKey = p.ProductSubcategoryKey
LEFT JOIN ProductCategory pc ON pc.ProductCategoryKey = ps.ProductCategoryKey;
```

### **Explanation | Explicação:**
- **Purpose | Propósito:**  
  This query creates the `dProduto` dimension by combining data from the `Product`, `ProductSubcategory`, and `ProductCategory` tables.  
  (_Esta query cria a dimensão `dProduto`, combinando dados das tabelas `Product`, `ProductSubcategory` e `ProductCategory`._)

- **Joins Used | Joins Utilizados:**  
  - `LEFT JOIN` between `Product` and `ProductSubcategory`: Links each product to its subcategory.  
    (_`LEFT JOIN` entre `Product` e `ProductSubcategory`: Liga cada produto à sua subcategoria._)
  - `LEFT JOIN` between `ProductSubcategory` and `ProductCategory`: Links subcategories to their parent categories.  
    (_`LEFT JOIN` entre `ProductSubcategory` e `ProductCategory`: Liga subcategorias às suas categorias principais._)

- **Key Columns | Colunas Principais:**
  - `ProductKey`: Unique identifier for each product.  
    (_Identificador único para cada produto._)
  - `ProductName`: Name of the product.  
    (_Nome do produto._)
  - `ProductSubcategoryName`: Name of the product's subcategory.  
    (_Nome da subcategoria do produto._)

---

## **2. Query to Create `dCliente` | Query para criar a `dCliente`**

```sql
SELECT
    c.CustomerKey,
    CONCAT(c.FirstName, ' ', c.LastName) AS 'FullName',
    c.Occupation,
    g.ContinentName,
    g.RegionCountryName,
    g.StateProvinceName,
    g.CityName
FROM Customer c
LEFT JOIN [Geography] g ON c.GeographyKey = g.GeographyKey;
```

### **Explanation | Explicação:**
- **Purpose | Propósito:**  
  This query creates the `dCliente` dimension by combining customer information from the `Customer` table with geographic data from the `Geography` table.  
  (_Esta query cria a dimensão `dCliente`, combinando informações de clientes da tabela `Customer` com dados geográficos da tabela `Geography`._)

- **Joins Used | Joins Utilizados:**  
  - `LEFT JOIN` between `Customer` and `Geography`: Links each customer to their geographic location.  
    (_`LEFT JOIN` entre `Customer` e `Geography`: Liga cada cliente à sua localização geográfica._)

- **Key Columns | Colunas Principais:**
  - `CustomerKey`: Unique identifier for each customer.  
    (_Identificador único para cada cliente._)
  - `FullName`: Full name of the customer, created using `CONCAT`.  
    (_Nome completo do cliente, criado usando `CONCAT`._)
  - `ContinentName`, `RegionCountryName`, etc.: Geographic details of the customer.  
    (_Detalhes geográficos do cliente._)

---

## **3. Query to Create `dLojaOnline` | Query para criar a `dLojaOnline`**

```sql
SELECT
    st.StoreKey,
    st.StoreName,
    g.ContinentName
FROM Store st
LEFT JOIN [Geography] g ON st.GeographyKey = g.GeographyKey
WHERE StoreType = 'Online';
```

### **Explanation | Explicação:**
- **Purpose | Propósito:**  
  This query creates the `dLojaOnline` dimension by filtering the `Store` table for online stores and joining it with geographic data.  
  (_Esta query cria a dimensão `dLojaOnline` filtrando a tabela `Store` para lojas online e conectando-a com dados geográficos._)

- **Filters Used | Filtros Utilizados:**  
  - `WHERE StoreType = 'Online'`: Ensures only online stores are included.  
    (_Garante que apenas lojas online sejam incluídas._)

- **Joins Used | Joins Utilizados:**  
  - `LEFT JOIN` between `Store` and `Geography`: Links each store to its geographic location.  
    (_`LEFT JOIN` entre `Store` e `Geography`: Liga cada loja à sua localização geográfica._)

- **Key Columns | Colunas Principais:**
  - `StoreKey`: Unique identifier for each store.  
    (_Identificador único para cada loja._)
  - `StoreName`: Name of the store.  
    (_Nome da loja._)
  - `ContinentName`: Geographic continent of the store.  
    (_Continente geográfico da loja._)

---