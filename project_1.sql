#----------------Data Cleaning-----------------
select * from layoffs;

#--------------Remove Duplicates---------------------
#-------------- Standerize---------------------------
#---------------Null Values--------------------------
#---------------remove unessary columns--------------

Create table layoffs_staging
like layoffs;

select * from layoffs_staging;

insert layoffs_staging
select *
from layoffs;

select * ,
row_number() over(
partition by company,industry,total_laid_off,percentage_laid_off,'data') as row_num
from layoffs_staging;

with duplicate_cte as
(select * ,
row_number() over(
partition by company,location,stage,country,industry,funds_raised_millions,total_laid_off,percentage_laid_off,'data') as row_num
from layoffs_staging)

select * from duplicate_cte
where row_num > 1; 

with duplicate_cte as
(select * ,
row_number() over(
partition by company,location,stage,country,industry,funds_raised_millions,total_laid_off,percentage_laid_off,'data') as row_num
from layoffs_staging)
delete 
from duplicate_cte
where row_num > 1;

CREATE TABLE `layoffs_staging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
   `row_num` int
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
select * from layoffs_staging2;

insert into layoffs_staging2
select * ,
row_number() over(
partition by company,location,stage,country,industry,
funds_raised_millions,total_laid_off,percentage_laid_off,'data') as row_num
from layoffs_staging ;

select * from layoffs_staging2
where row_num >1;

delete  from layoffs_staging2
where row_num >1;


select * from layoffs_staging2
where row_num >1;




#-------------------------Standerize Data-----------------------------------
select company, trim(company) from layoffs_staging2;

update layoffs_staging2 set company = trim(company);

select  distinct industry from layoffs_staging2 order by 1;


select  * from layoffs_staging2
 where industry like 'Crypto%' ;
 
 update layoffs_staging2
 set industry='Crypto'
 where industry like 'Cryoto%' ;
 
 select  distinct location from layoffs_staging2;
  select  distinct country from layoffs_staging2;
  
select  * from layoffs_staging2
where country like 'United States%'
order by 1;

update layoffs_staging2
 set country='United States'
 where country like 'United States%';
 
 
 select  * from layoffs_staging2
where country like 'United States%'
order by 1;
  
select  date ,
str_to_date(date,'%m/%d/%Y')
 from layoffs_staging2;
 
 update layoffs_staging2
 set date = str_to_date(date,'%m/%d/%Y');
 
 alter table layoffs_staging2
 modify column date DATE;
 
 
  select  * from layoffs_staging2;
  
  
  #-------------------null values---------------
  
    select  *
    from layoffs_staging2 where total_laid_off   is null  
    and percentage_laid_off is null;
    
    delete 
    from layoffs_staging2
     where total_laid_off   is null  
    and percentage_laid_off is null;
    
    
      select  * from layoffs_staging2 where industry is null or industry ='';
      
      
select * from layoffs_staging2 t1 
join layoffs_staging2 t2
on t1.company=t2.company
and
t1.location=t2.location
where (t1.industry is null or t1.industry= '') and 
t2.industry is not null;

update layoffs_staging2
set industry = null where
industry = '';
    
update layoffs_staging2 t1 
join layoffs_staging2 t2
on t1.company =t2.company 
set t1.industry = t2.industry
where (t1.industry is null ) and 
t2.industry is not null;

select * from layoffs_staging2;

 alter table layoffs_staging2
 drop column row_num;
 
 
 
 
 
 
 
 
 
 
 #-----------------------------------------Exploring Data-------------------------------------
 select * from layoffs_staging2;
 select max(total_laid_off),max(percentage_laid_off)
 from layoffs_staging2;
 
  select * from layoffs_staging2
  where percentage_laid_off=1
  order by funds_raised_millions desc;
  
  select company,sum(total_laid_off)
  from layoffs_staging2
  group by company order by 2 desc;
  
  select  min(date),max(date)
  from layoffs_staging2;
 
  select industry,sum(total_laid_off)
  from layoffs_staging2
  group by industry order by 2 desc;
  
    select country,sum(total_laid_off)
  from layoffs_staging2
  group by country order by 2 desc;
  
select year(date),sum(total_laid_off)
 from layoffs_staging2
  group by year (date)
  order by 2 desc;
  
  select stage,sum(total_laid_off)
 from layoffs_staging2
  group by stage
  order by 2 desc;