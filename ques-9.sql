-- ques9

with supplier_summary as
	(
		select supp_id, avg(rat_ratstars) as avg_rating from `order` o
		join Supplier_pricing sp using(pricing_id)
		join rating r using(ord_id)
		group by supp_id
	)
	select supp_id, supp_name, avg_rating,
		(
		CASE 
			WHEN avg_rating = 5 THEN 'Excellent service'
			WHEN avg_rating > 4 THEN 'Good Service'
			WHEN avg_rating > 2 THEN 'Average Service'
			ELSE 'Poor Service'
		END) AS type_of_service
	from supplier_summary join supplier using(supp_id);