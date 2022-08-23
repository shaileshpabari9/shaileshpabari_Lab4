-- ques3
with order_summary as 
(select cus_id, sum(ord_amount) as total_amount from `order` group by cus_id)
select cus_gender, count(*) from customer join order_summary using (cus_id)
where total_amount >= 3000
group by cus_gender;

-- ques4
select o.ord_id, pro_name from customer c 
join `order` o using (cus_id) 
join supplier_pricing using ( pricing_id )
join product using ( pro_id)
where cus_id = 2;

-- ques5
with supplier_product_info as
(select supp_id, count(*) as product_count from supplier_pricing group by supp_id)
select * from supplier_product_info spi join supplier using(supp_id)
where spi.product_count > 1;

-- ques6
with min_pricing as 
(
select cat_id, pro_id, PRO_NAME, min(supp_price) 
from product p 
join supplier_pricing sp using (pro_id)
group by cat_id
)
select * from min_pricing
join category using ( cat_id );

-- ques7
select pro_id, pro_name from `order`
join supplier_pricing using (pricing_id)
join product using (pro_id)
where ord_date>
'2021-10-05';


-- ques8
select cus_name, cus_gender from customer 
where cus_name like 'a%'  or cus_name like '%a';  

