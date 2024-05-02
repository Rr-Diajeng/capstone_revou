---------------------- 2015

-- mengetahui jumlah booking 2015

SELECT COUNT(hb.`index`) AS jumlah_booking
FROM hotel_bookings hb 
WHERE arrival_date_year = 2015;

-- hasil: 21.996

-- yg checkout di tahun 2015
select count(hb.hotel)
from hotel_bookings hb
where reservation_status  = 'Check-Out' and arrival_date_year = 2015;

-- result = 13,854

-- yang cancel di tahun 2015

select count(*)
from hotel_bookings hb 
where is_canceled = 1 and arrival_date_year = 2015;

-- result = 8.142

-- yang tidak cancel di tahun 2015

select count(*)
from hotel_bookings hb 
where is_canceled = 0 and arrival_date_year = 2015;

-- result = 13.854


--------------------------
-- berarti dia iscancelled = 1 lalu dipecah jadi reservation status = cancelled dan no show

select count(*)
from hotel_bookings hb 
where reservation_status = "Canceled" and arrival_date_year = 2015;

-- 7.951

select count(*)
from hotel_bookings hb 
where reservation_status = "No-show" and arrival_date_year = 2015;

-- 191




------------------------------------- 2016

-- mengetahui jumlah booking 2016

SELECT COUNT(hb.`index`) AS jumlah_booking
FROM hotel_bookings hb 
WHERE arrival_date_year = 2016;

-- hasil: 56.707

-- yg checkout di tahun 2016
select count(hb.hotel)
from hotel_bookings hb
where reservation_status  = 'Check-Out' and arrival_date_year = 2016;

-- result = 36370

-- yang cancel di tahun 2016

select count(*)
from hotel_bookings hb 
where is_canceled = 1 and arrival_date_year = 2016;

-- result = 20337

-- yang tidak cancel di tahun 2016

select count(*)
from hotel_bookings hb 
where is_canceled = 0 and arrival_date_year = 2016;

-- result = 36370


--------------------------
-- berarti dia iscancelled = 1 lalu dipecah jadi reservation status = cancelled dan no show

select count(*)
from hotel_bookings hb 
where reservation_status = "Canceled" and arrival_date_year = 2016;

-- 19669

select count(*)
from hotel_bookings hb 
where reservation_status = "No-show" and arrival_date_year = 2016;

-- 668

------------------------------------- 2017

-- mengetahui jumlah booking 2017

SELECT COUNT(hb.`index`) AS jumlah_booking
FROM hotel_bookings hb 
WHERE arrival_date_year = 2017;

-- hasil: 40687

-- yg checkout di tahun 2017
select count(hb.hotel)
from hotel_bookings hb
where reservation_status  = 'Check-Out' and arrival_date_year = 2017;

-- result = 24942

-- yang cancel di tahun 2017

select count(*)
from hotel_bookings hb 
where is_canceled = 1 and arrival_date_year = 2017;

-- result = 15745

-- yang tidak cancel di tahun 2017

select count(*)
from hotel_bookings hb 
where is_canceled = 0 and arrival_date_year = 2017;

-- result = 24942


--------------------------
-- berarti dia iscancelled = 1 lalu dipecah jadi reservation status = cancelled dan no show

select count(*)
from hotel_bookings hb 
where reservation_status = "Canceled" and arrival_date_year = 2017;

-- 15397

select count(*)
from hotel_bookings hb 
where reservation_status = "No-show" and arrival_date_year = 2017;

-- 348


------------------------------------------------------------------------- cancellation rate

rata2 cancellation = jumlah_cancel / jumlah_booking * 100%
rata2 jumlah booking di tahun 2015 = jumlah booking di tahun 2015/ jumlah booking 2015,2016,2017

-- year
SELECT
    arrival_date_year,
    count(*) as total_bookings,
    count(case when is_canceled = 1 then 1 end) as total_cancelled,
    ROUND((count(case when is_canceled = 1 then 1 end) / count(*)) * 100) AS cancellation_percentage
FROM 
    hotel_bookings hb
WHERE 
    arrival_date_year IN (2015, 2016, 2017)
GROUP BY 
    Arrival_date_year
order by cancellation_percentage desc;
  

-- month
   

SELECT
    arrival_date_year,
    arrival_date_month,
    COUNT(*) as total_bookings,
    COUNT(CASE WHEN is_canceled = 1 THEN 1 END) as jumlah_cancelled,
    ROUND((SUM(CASE WHEN is_canceled = 1 THEN 1 END) / COUNT(*)) * 100) AS cancellation_percentage
FROM 
    hotel_bookings hb 
WHERE
    arrival_date_year IN (2015, 2016, 2017)
GROUP BY 
    arrival_date_year, arrival_date_month
order by cancellation_percentage desc;

 ------------------------------
 
 select arrival_date_year, arrival_date_month, count(hb.is_canceled) as jumlah_cancelled
 from hotel_bookings hb 
 where arrival_date_year = 2015 and is_canceled = 1
 group by arrival_date_month; -- juli = 2776
 
 select count(hb.is_canceled)
 from hotel_bookings hb 
 where arrival_date_year = 2015 and arrival_date_month = "August";


select sum(adults) as adults, sum(children)as children, sum(babies) as babies
from hotel_bookings hb
where reservation_status  = 'Check-Out' and arrival_date_year = 2015;

-- result: adults = 24,726; children = 1,036; babies = 182

select sum(adr)as total_revenue
from hotel_bookings hb
where reservation_status  = 'Check-Out' and arrival_date_year = 2015;

-- result: 1,299,044.1


------------------------------
---- di tahun berapa yang punya customer paling banyak dan berdasarkan tiap tipe hotel

select hotel, arrival_date_year  as year, count(*) as jumlah_booking
from hotel_bookings hb 
where reservation_status = "Check-Out"
group by arrival_date_year , hotel
order by jumlah_booking desc;

-- City Hotel	2016	22733

select count(*)
from hotel_bookings hb 
where reservation_status = "Check-Out" and arrival_date_year = 2016 and hotel = "City Hotel";


------ hotel yg paling banyak pendapatan (pakai adr)

select hotel, sum(adr) as jumlah_pendapatan
from hotel_bookings hb 
where is_canceled = 0
group by hotel
order by jumlah_pendapatan desc;

--- City Hotel	4888423.699999736


---- berapa orang yang check out di stay_in_weekend_nights dan berapa orang yang checkout di stay_in_week_nights:

select count(stays_in_weekend_nights)
from hotel_bookings hb 
where is_canceled = 0 and arrival_date_year = 2017;

--- 24942

select count(stays_in_weekend_nights)
from hotel_bookings hb 
where is_canceled = 0 and arrival_date_year = 2016;

-- 36370

select count(stays_in_weekend_nights)
from hotel_bookings hb 
where is_canceled = 0 and arrival_date_year = 2015;

-- 13854


-------------- paling sering customer menginap berapa lama?

select hb.stays_in_weekend_nights + hb.stays_in_week_nights as jumlah_nginap
from hotel_bookings hb 
where is_canceled = 0;

select
    hb.stays_in_weekend_nights + hb.stays_in_week_nights AS jumlah_nginap,
    COUNT(*) AS frekuensi
FROM 
    hotel_bookings hb 
WHERE 
    is_canceled = 0
GROUP BY 
    jumlah_nginap
ORDER BY 
    frekuensi desc
limit 1;
-- 1	15749

select
	hb.stays_in_weekend_nights as weekend, hb.stays_in_week_nights as weekday,
    hb.stays_in_weekend_nights + hb.stays_in_week_nights AS jumlah_nginap,
    COUNT(*) AS frekuensi
FROM 
    hotel_bookings hb 
WHERE 
    is_canceled = 0 and arrival_date_year = 2017
GROUP BY 
    jumlah_nginap, weekend, weekday
ORDER BY 
    frekuensi desc;
   
-- 0	1	1	12156



--- jenis meal yg paling banyak dipesan di thn 2017? sertakan data guests (child, babies, adults)

select distinct (hb.meal) 
from hotel_bookings hb;

select meal, count(*) as frekuensi
from hotel_bookings hb 
where arrival_date_year = 2017
group by meal
order by frekuensi desc;

-- BB	30524

select count(*)
from hotel_bookings hb 
where arrival_date_year = 2017 and meal = "BB";


-- paling banyak customer berasal dari country mana di thn 2017?

select hb.country as country, count(*) as frekuensi
from hotel_bookings hb 
where arrival_date_year = 2017
group by country
order by frekuensi desc;

--- PRT	12962

----- guest datang paling banyak di bulan apa pada thn 2017? tanpa kondisi apapun 
---- bandingkan dgn guest datang paling banyak di bulan ap pd thn 2017? dgn where is_cancelled = 0 or status_reservations = 'Check-Out

select hb.arrival_date_month as bulan, count(*) as frekuensi
from hotel_bookings hb 
where arrival_date_year = 2017 
group by bulan
order by frekuensi desc;

--- bulan may dengan 6313 (ini tanpa kondisi apapun)

select hb.arrival_date_month as bulan, count(*) as frekuensi
from hotel_bookings hb 
where arrival_date_year = 2017 and is_canceled = 0
group by bulan
order by frekuensi desc;

--- bulan may dengan 3551 (dengan kondisi checkout)


------------------------  guests yg paling lama mendapat konfirmasi dari hotel 
-- kondisi 1: (select customer type, country, days_in_waiting_lists where status reservation = cancelled in 2017)

select distinct (days_in_waiting_list)
from hotel_bookings hb;

select hb.customer_type, hb.country, hb.days_in_waiting_list 
from hotel_bookings hb 
where is_canceled = 0 and arrival_date_year = 2017
order by hb.days_in_waiting_list desc;

-- Transient-Party	DEU	223

---- kondisi 2: select customer type, country, days_in_waiting_lists, status reservation  where thn 2017 
--- order by day in waiting list desc


select hb.customer_type, hb.country, hb.days_in_waiting_list, hb.reservation_status 
from hotel_bookings hb 
where arrival_date_year = 2017 
order by hb.days_in_waiting_list desc;

-- Transient-Party	DEU	223	Check-Out


----------------------------------------------- full 2017

----- di bulan berapa, yang banyak dipesan di bulan apa (yang checkout)

select hotel, arrival_date_month as month, count(*) as jumlah_booking
from hotel_bookings hb 
where reservation_status = "Check-Out" and arrival_date_year = 2017
group by arrival_date_month, hotel
order by jumlah_booking desc;

-- City Hotel	May	2339

select count(*)
from hotel_bookings hb 
where hotel = "Resort Hotel" and reservation_status = "Check-Out" and arrival_date_year = 2017
and arrival_date_month = "April";



