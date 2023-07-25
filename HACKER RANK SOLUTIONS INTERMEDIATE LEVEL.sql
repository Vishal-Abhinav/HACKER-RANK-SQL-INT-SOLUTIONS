 select ci.city_name,pr.product_name,round(sum(ii.line_total_price),2) as tot from city ci,customer cu,invoice i, invoice_otem ii,product pr where ci.id=cu.city_id and cu.id=i.customer_id=ii.invoice_idand ii.product_id=pr.id group by ci.city_name,pr.product_name order by tot desc,ci.city_name,pr.product_name;

SELECT 
    ci.city_name,
    pr.product_name,
    ROUND(SUM(ii.line_total_price), 2) AS tot
FROM 
    city ci
JOIN 
    customer cu ON ci.id = cu.city_id
JOIN 
    invoice i ON cu.id = i.customer_id
JOIN 
    invoice_item ii ON i.id = ii.invoice_id
JOIN 
    product pr ON ii.product_id = pr.id
GROUP BY 
    ci.city_name,
    pr.product_name
ORDER BY 
    tot DESC, ci.city_name, pr.product_name;




 select co.country_name,count(*) , avg(i.total_price) from country co,city ci,customer cu,invoice i where co.id* ci.country_id and ci.id=cu.id and cu.id=i.customerid group by co.country_name having avg(i.total_price)>(elect avg(total_price)from invoice);



 SELECT 
    co.country_name,
    COUNT(*) AS total_invoices,
    AVG(i.total_price) AS average_total_price
FROM 
    country co
JOIN 
    city ci ON co.id = ci.country_id
JOIN 
    customer cu ON ci.id = cu.city_id
JOIN 
    invoice i ON cu.id = i.customer_id
GROUP BY 
    co.country_name
HAVING 
    AVG(i.total_price) > (SELECT AVG(total_price) FROM invoice);
