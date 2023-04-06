-- Listing Name, Host location, Host Response Time, Host Response Rate, Host is superhost, 
        --  Host Total listings count, Host Identity verified

select Name,
       Host_Location,
	   Host_Response_Time,
	   Host_Response_Rate,
	   Host_is_superhost, 
	   Host_Total_listings_count, 
	   Host_Identity_verified 
	   from  dbo.ListingsSmall


-- Find the listings with price less than 100/night

select Listing_id, Name, Price
 from dbo.ListingsSmall where price < 100 


  --How many reviews per neighbourhood

select  rev.neighbourhood, count ( distinct p.review_Id) as review_count_per_neighbourhood    
 from dbo.reviewsSmall as p
 inner join dbo.ListingsSmall as rev on p.listing_Id = rev.listing_Id
 group by rev.neighbourhood


 -- What is the minimum review scores rating per property type

 select  min(review_scores_rating) as min_review_scores_rating
  from dbo.ListingsSmall;
  
  
 
--How many reviews per listing name

 select  rev.name, count ( distinct p.review_Id) as review_count_per_listing_name    
 from dbo.reviewsSmall as p
 inner join dbo.ListingsSmall as rev on p.listing_Id = rev.listing_Id
 group by rev.name


-- What is the listing name with the most reviews

select  rev.name, count ( distinct p.review_Id) as review_count_per_listing_name    
 from dbo.reviewsSmall as p
 inner join dbo.ListingsSmall as rev on p.listing_Id = rev.listing_Id
 group by rev.name
order by count (*) desc;

