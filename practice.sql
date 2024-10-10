USE AdvDB1;

select ProductID, ProductName, Product.SupplierID, SupplierName, Product.CategoryId, CategoryName
from Product right join supplier
on product.SupplierID=Supplier.SupplierID
inner join Category
on Product.CategoryID=Category.CategoryID;

select * 
from Product left join supplier
on product.SupplierID=Supplier.SupplierID;

select ProductID, ProductName, Product.SupplierID, SupplierName
from Product inner join supplier
on product.SupplierID=Supplier.SupplierID;

