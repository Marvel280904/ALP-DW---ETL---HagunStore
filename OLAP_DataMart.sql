-- trigger ngubah Male dan Female
DROP TRIGGER IF EXISTS tUpdCustData;

DELIMITER $$
CREATE TRIGGER tUpdCustData
BEFORE INSERT ON product
FOR EACH ROW
BEGIN
	IF lower(new.gender = 'male') THEN SET new.gender = 'M'; 
  ELSEIF lower(new.gender = 'female') THEN SET new.gender = 'F';
  ELSE SET new.gender = '-';
  END IF;
END $$
DELIMITER ;




-- data mart 1 (cek customer dengan pembelian terbanyak)

DROP VIEW IF EXISTS vCustPurchase;
CREATE VIEW vCustPurchase AS
SELECT sf.customer_id, c.`name` as CustomerName, count(sf.customer_id) as PurchaseFreq, sf.order_origin
FROM SalesFact sf
LEFT JOIN customer c ON sf.customer_id = c.customer_id
GROUP BY sf.customer_id
ORDER BY PurchaseFreq DESC;

SELECT * FROM vCustPurchase;

DROP PROCEDURE IF EXISTS pCustPurchaseFilter;
DELIMITER $$
CREATE PROCEDURE pCustPurchaseFilter(IN parMode char(1), IN parOrigin varchar(255))
BEGIN
  IF parMode = '0' THEN
		-- All Origin
    SELECT CustomerName, PurchaseFreq
    FROM vCustPurchase;
  ELSEIF parMode = '1' THEN
		-- Specific Origin, 2 dimension
    SELECT CustomerName, PurchaseFreq
    FROM vCustPurchase
    WHERE order_origin = parOrigin;
	ELSEIF parMode = '2' THEN
		-- ALL, 3 dimension
    SELECT order_origin, CustomerName, PurchaseFreq
    FROM vCustPurchase
    ORDER BY order_origin, PurchaseFreq DESC;
  END IF;
END$$
DELIMITER ;

CALL pCustPurchaseFilter('0','');


-- data mart 2 (cek produk paling laku)

DROP VIEW IF EXISTS vSoldProducts;
CREATE VIEW vSoldProducts AS
SELECT o.order_date, sf.product_id, p.`name` as ProductName, sum(sf.quantity) as TotalSold
FROM SalesFact sf
LEFT JOIN product p ON p.product_id = sf.product_id
LEFT JOIN `order` o ON o.order_id = sf.order_id
GROUP BY o.order_date, sf.product_id, p.`name`
ORDER BY o.order_date, sf.product_id, sum(sf.quantity) DESC;

SELECT * FROM vSoldProducts;

DROP PROCEDURE IF EXISTS pSoldProductsFilter;
DELIMITER $$
CREATE PROCEDURE pSoldProductsFilter(IN parMode char(1))
BEGIN
  IF parMode = '0' THEN
		-- ALL
    SELECT sp.product_id, sp.ProductName, sum(sp.TotalSold) as TotalSold
		FROM vSoldProducts sp
		GROUP BY sp.product_id
		ORDER BY TotalSold DESC;
  ELSEIF parMode = '1' THEN
		-- Monthly
		SELECT MONTH(sp.order_date) as MonthNo, sp.product_id, sp.ProductName, sum(sp.TotalSold) as TotalSold
		FROM vSoldProducts sp
		GROUP BY sp.product_id
		ORDER BY MonthNo DESC, product_id, TotalSold DESC;
  ELSEIF parMode = '2' THEN
		-- Yearly
    SELECT YEAR(sp.order_date) as YearNo, sp.product_id, sp.ProductName, sum(sp.TotalSold) as TotalSold
		FROM vSoldProducts sp
		GROUP BY sp.product_id
		ORDER BY YearNo DESC, product_id, TotalSold DESC;
	END IF;
END$$
DELIMITER ;

CALL pSoldProductsFilter('2');



-- data mart 3 (cek size paling laku)

DROP VIEW IF EXISTS vPopularSize;
CREATE VIEW vPopularSize AS
SELECT od.size, sum(sf.quantity) as SizeFreq, sf.order_origin
FROM SalesFact sf, order_detail od
WHERE od.orderdetail_id = sf.orderdetail_Id
GROUP BY od.size, sf.order_origin
ORDER BY SizeFreq DESC;

SELECT * FROM vPopularSize;


DROP PROCEDURE IF EXISTS PopularSizeFilter;
DELIMITER $$
CREATE PROCEDURE PopularSizeFilter(IN parMode char(1), IN parOrigin varchar(255))
BEGIN
  IF parMode = '0' THEN
    -- All Origins
    SELECT size, SizeFreq
    FROM vPopularSize;
  ELSEIF parMode = '1' THEN
    -- Specific Origin
    SELECT size, SizeFreq
    FROM vPopularSize
    WHERE order_origin = parOrigin;
  ELSEIF parMode = '2' THEN
    -- All Origins, Ordered by Origin and Size Frequency
    SELECT order_origin, size, SizeFreq
    FROM vPopularSize
    ORDER BY order_origin, SizeFreq DESC;
  END IF;
END$$
DELIMITER ;


CALL PopularSizeFilter('2','');



-- data mart 4 (cek brand paling laku)

DROP VIEW IF EXISTS vSoldBrands;
CREATE VIEW vSoldBrands AS
SELECT sf.product_id, sf.order_date, p.brand, sum(sf.quantity) as BrandFreq, sf.order_origin
FROM SalesFact sf, product p
WHERE p.product_id = sf.product_id
GROUP BY p.brand, sf.order_origin
ORDER BY BrandFreq DESC;

SELECT * FROM vSoldBrands;

DROP PROCEDURE IF EXISTS pSoldBrandsFilter;
DELIMITER $$
CREATE PROCEDURE pSoldBrandsFilter(IN parMode char(1))
BEGIN
  IF parMode = '0' THEN
		-- ALL
    SELECT sp.brand, sum(sp.BrandFreq) as TotalSold
		FROM vSoldBrands sp
		GROUP BY sp.brand
		ORDER BY TotalSold DESC;
  ELSEIF parMode = '1' THEN
		-- Monthly
		SELECT MONTH(sp.order_date) as MonthNo, sp.product_id, sp.brand, sum(sp.BrandFreq) as TotalSold
		FROM vSoldBrands sp
		GROUP BY sp.brand
		ORDER BY MonthNo DESC, product_id, TotalSold DESC;
  ELSEIF parMode = '2' THEN
		-- Yearly
    SELECT YEAR(sp.order_date) as YearNo, sp.product_id, sp.brand, sum(sp.BrandFreq) as TotalSold
		FROM vSoldBrands sp
		GROUP BY sp.brand
		ORDER BY YearNo DESC, product_id, TotalSold DESC;
	END IF;
END$$
DELIMITER ;

CALL pSoldBrandsFilter('1');