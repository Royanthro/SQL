set autocommit = 0;
commit;

-- creating the database--
create database shopping_behaviour;
use shopping_behaviour;
----------------------------------------------------------
-- data uderstanding --
describe shopping_behavior_edited;
select * from shopping_behavior_edited;
----------------------------------------------------------
-- data cleaning ---
-- handling missing values--
select * from shopping_behavior_edited where Age is not null;
select * from shopping_behavior_edited;
-- changing coloumn name--
select LOWER(Gender) as gender from shopping_behavior_edited;
-- -------------------------------------------------------
-- exploratory data analysis --
-- summary--
select avg(age), min(age), max(age) from shopping_behavior_edited;
-- - ------------------------------------------------------
-- creating new feature --
select *, case when Age < 18 then 'Under 18' else 'Adult' end as Age_Group from shopping_behavior_edited;

select Color,Category,Age,Season,Shipping_Type from shopping_behavior_edited where gender = "male" order by age; 

select distinct(Customer_ID) from shopping_behavior_edited where gender ='female' and Color = 'red';

select * from shopping_behavior_edited
order by `Purchase_Amount_(USD)`, Age ,Frequency_Purchases asc;

select distinct Payment_Method from shopping_behavior_edited 
where Age<=20
and gender = 'male';
-- -------------------------------------------------------
-- data aggregation--
select Customer_ID, SUM(`Purchase_Amount_(USD)`) as Total_Purchase_Amount from shopping_behavior_edited group by Customer_ID;
---------------------------------------------------------
-- generating new coloumn--
-- first we have to remove the existing null column--
alter table shopping_behavior_edited
drop column total_purchase;

-- now we will generate a new coloumn--
alter table shopping_behavior_edited
add column total_purchase int;



