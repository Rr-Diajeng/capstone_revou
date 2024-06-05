-- berapa orang yang mesan

SELECT 
--     hb.arrival_date_week_number AS week,
    row_number() over (partition by hb.arrival_date_month order by hb.arrival_date_week_number asc) week,
    hb.arrival_date_month as bulan,
    SUM(CASE WHEN DAYNAME(STR_TO_DATE(CONCAT(hb.arrival_date_year, '-', hb.arrival_date_month, '-', hb.arrival_date_day_of_month), '%Y-%M-%d')) = 'Monday' THEN 1 ELSE 0 END) AS Monday,
    SUM(CASE WHEN DAYNAME(STR_TO_DATE(CONCAT(hb.arrival_date_year, '-', hb.arrival_date_month, '-', hb.arrival_date_day_of_month), '%Y-%M-%d')) = 'Tuesday' THEN 1 ELSE 0 END) AS Tuesday,
    SUM(CASE WHEN DAYNAME(STR_TO_DATE(CONCAT(hb.arrival_date_year, '-', hb.arrival_date_month, '-', hb.arrival_date_day_of_month), '%Y-%M-%d')) = 'Wednesday' THEN 1 ELSE 0 END) AS Wednesday,
    SUM(CASE WHEN DAYNAME(STR_TO_DATE(CONCAT(hb.arrival_date_year, '-', hb.arrival_date_month, '-', hb.arrival_date_day_of_month), '%Y-%M-%d')) = 'Thursday' THEN 1 ELSE 0 END) AS Thursday,
    SUM(CASE WHEN DAYNAME(STR_TO_DATE(CONCAT(hb.arrival_date_year, '-', hb.arrival_date_month, '-', hb.arrival_date_day_of_month), '%Y-%M-%d')) = 'Friday' THEN 1 ELSE 0 END) AS Friday,
    SUM(CASE WHEN DAYNAME(STR_TO_DATE(CONCAT(hb.arrival_date_year, '-', hb.arrival_date_month, '-', hb.arrival_date_day_of_month), '%Y-%M-%d')) = 'Saturday' THEN 1 ELSE 0 END) AS Saturday,
    SUM(CASE WHEN DAYNAME(STR_TO_DATE(CONCAT(hb.arrival_date_year, '-', hb.arrival_date_month, '-', hb.arrival_date_day_of_month), '%Y-%M-%d')) = 'Sunday' THEN 1 ELSE 0 END) AS Sunday
FROM 
    hotel_bookings hb
WHERE 
    hb.reservation_status = "Check-Out" AND 
    hb.arrival_date_year = "2017"
GROUP BY 
    hb.arrival_date_week_number, bulan
ORDER BY 2, 1 asc



-- berapa orang yang literally nginap di hari tersebut


select CONCAT(hb.arrival_date_year, '-', hb.arrival_date_month, '-', hb.arrival_date_day_of_month) as tanggal, 
	DAYNAME(STR_TO_DATE(CONCAT(hb.arrival_date_year, '-', hb.arrival_date_month, '-', hb.arrival_date_day_of_month), '%Y-%M-%d')) as hari_arrival,
	hb.stays_in_weekend_nights as lama_weekend,
	hb.stays_in_week_nights as lama_weekday,
	hb.stays_in_weekend_nights + hb.stays_in_week_nights as lama_nginap,
	hb.reservation_status_date,
	hb.arrival_date_month
from hotel_bookings hb 
where hb.reservation_status = 'Check-Out' and 
	hb.arrival_date_year = '2017' and 
	CONCAT(hb.arrival_date_year, '-', hb.arrival_date_month, '-', hb.arrival_date_day_of_month) = '2017-January-1'
	and hb.stays_in_weekend_nights + hb.stays_in_week_nights > 1;


CREATE TABLE banyak_orang_dalam_1_hari (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tanggal VARCHAR(255),
    jumlah INTEGER
);

select CONCAT(hb.arrival_date_year, '-', hb.arrival_date_month, '-', hb.arrival_date_day_of_month) as tanggal, 
	DAYNAME(STR_TO_DATE(CONCAT(hb.arrival_date_year, '-', hb.arrival_date_month, '-', hb.arrival_date_day_of_month), '%Y-%M-%d')) as hari_arrival,
	hb.stays_in_weekend_nights as lama_weekend,
	hb.stays_in_week_nights as lama_weekday,
	hb.stays_in_weekend_nights + hb.stays_in_week_nights as lama_nginap,
	hb.reservation_status_date,
	hb.arrival_date_month
from hotel_bookings hb 
where hb.reservation_status = 'Check-Out' and 
	hb.arrival_date_year = '2017' and 
	CONCAT(hb.arrival_date_year, '-', hb.arrival_date_month, '-', hb.arrival_date_day_of_month) = '2017-January-2'


SELECT 
    row_number() over (partition by hb.arrival_date_month order by hb.arrival_date_week_number asc) week,
    hb.arrival_date_month as bulan,
    SUM(CASE WHEN DAYNAME(STR_TO_DATE(CONCAT(hb.arrival_date_year, '-', hb.arrival_date_month, '-', hb.arrival_date_day_of_month), '%Y-%M-%d')) = 'Monday' THEN 1 ELSE 0 END) AS Monday,
    SUM(CASE WHEN DAYNAME(STR_TO_DATE(CONCAT(hb.arrival_date_year, '-', hb.arrival_date_month, '-', hb.arrival_date_day_of_month), '%Y-%M-%d')) = 'Tuesday' THEN 1 ELSE 0 END) AS Tuesday,
    SUM(CASE WHEN DAYNAME(STR_TO_DATE(CONCAT(hb.arrival_date_year, '-', hb.arrival_date_month, '-', hb.arrival_date_day_of_month), '%Y-%M-%d')) = 'Wednesday' THEN 1 ELSE 0 END) AS Wednesday,
    SUM(CASE WHEN DAYNAME(STR_TO_DATE(CONCAT(hb.arrival_date_year, '-', hb.arrival_date_month, '-', hb.arrival_date_day_of_month), '%Y-%M-%d')) = 'Thursday' THEN 1 ELSE 0 END) AS Thursday,
    SUM(CASE WHEN DAYNAME(STR_TO_DATE(CONCAT(hb.arrival_date_year, '-', hb.arrival_date_month, '-', hb.arrival_date_day_of_month), '%Y-%M-%d')) = 'Friday' THEN 1 ELSE 0 END) AS Friday,
    SUM(CASE WHEN DAYNAME(STR_TO_DATE(CONCAT(hb.arrival_date_year, '-', hb.arrival_date_month, '-', hb.arrival_date_day_of_month), '%Y-%M-%d')) = 'Saturday' THEN 1 ELSE 0 END) AS Saturday,
    SUM(CASE WHEN DAYNAME(STR_TO_DATE(CONCAT(hb.arrival_date_year, '-', hb.arrival_date_month, '-', hb.arrival_date_day_of_month), '%Y-%M-%d')) = 'Sunday' THEN 1 ELSE 0 END) AS Sunday
FROM 
    hotel_bookings hb
WHERE 
    hb.reservation_status = "Check-Out" AND 
    hb.arrival_date_year = "2017"
GROUP BY 
    hb.arrival_date_week_number, bulan
ORDER BY 2, 1 asc


create table hari_pengunjung
as(
	select distinct CONCAT(hb.arrival_date_year, '-', hb.arrival_date_month, '-', hb.arrival_date_day_of_month) as tanggal,
		DAYNAME(STR_TO_DATE(CONCAT(hb.arrival_date_year, '-', hb.arrival_date_month, '-', hb.arrival_date_day_of_month), '%Y-%M-%d')) as hari
	from hotel_bookings hb
	where hb.arrival_date_year = '2017'
)


-- ngeliat hasil berdasarkan tanggal

select 
from hotel_bookings hb 


SELECT 
    row_number() over (partition by hb.arrival_date_month order by hb.arrival_date_week_number asc) week,
    hb.arrival_date_month as bulan,
    SUM(CASE WHEN DAYNAME(STR_TO_DATE(CONCAT(hb.arrival_date_year, '-', hb.arrival_date_month, '-', hb.arrival_date_day_of_month), '%Y-%M-%d')) = 'Monday' THEN 1 ELSE 0 END) AS Monday,
    SUM(CASE WHEN DAYNAME(STR_TO_DATE(CONCAT(hb.arrival_date_year, '-', hb.arrival_date_month, '-', hb.arrival_date_day_of_month), '%Y-%M-%d')) = 'Tuesday' THEN 1 ELSE 0 END) AS Tuesday,
    SUM(CASE WHEN DAYNAME(STR_TO_DATE(CONCAT(hb.arrival_date_year, '-', hb.arrival_date_month, '-', hb.arrival_date_day_of_month), '%Y-%M-%d')) = 'Wednesday' THEN 1 ELSE 0 END) AS Wednesday,
    SUM(CASE WHEN DAYNAME(STR_TO_DATE(CONCAT(hb.arrival_date_year, '-', hb.arrival_date_month, '-', hb.arrival_date_day_of_month), '%Y-%M-%d')) = 'Thursday' THEN 1 ELSE 0 END) AS Thursday,
    SUM(CASE WHEN DAYNAME(STR_TO_DATE(CONCAT(hb.arrival_date_year, '-', hb.arrival_date_month, '-', hb.arrival_date_day_of_month), '%Y-%M-%d')) = 'Friday' THEN 1 ELSE 0 END) AS Friday,
    SUM(CASE WHEN DAYNAME(STR_TO_DATE(CONCAT(hb.arrival_date_year, '-', hb.arrival_date_month, '-', hb.arrival_date_day_of_month), '%Y-%M-%d')) = 'Saturday' THEN 1 ELSE 0 END) AS Saturday,
    SUM(CASE WHEN DAYNAME(STR_TO_DATE(CONCAT(hb.arrival_date_year, '-', hb.arrival_date_month, '-', hb.arrival_date_day_of_month), '%Y-%M-%d')) = 'Sunday' THEN 1 ELSE 0 END) AS Sunday
FROM 
    hotel_bookings hb
WHERE 
    hb.reservation_status = "Check-Out" AND 
    hb.arrival_date_year = "2017"
GROUP BY 
    hb.arrival_date_week_number, bulan
ORDER BY 2, 1 asc


create table banyak_arrival as(
	select 
		CONCAT(hb.arrival_date_year, '-', hb.arrival_date_month, '-', hb.arrival_date_day_of_month) as tanggal,
		count(*) as jumlah_arrival
	from hotel_bookings hb 
	where hb.arrival_date_year = '2017' and hb.reservation_status = "Check-Out"
	group by CONCAT(hb.arrival_date_year, '-', hb.arrival_date_month, '-', hb.arrival_date_day_of_month)
	order by tanggal
)

select hp.tanggal, hp.hari, x.arrival, x.jumlah_orang_dalam_1_hari
from hari_pengunjung hp 
join (
	select ba.tanggal as tanggal, ba.jumlah_arrival as arrival, bodh.jumlah as jumlah_orang_dalam_1_hari
	from banyak_arrival ba 
	join banyak_orang_dalam_1_hari bodh on ba.tanggal = bodh.tanggal 
) as x on x.tanggal = hp.tanggal 


select ba.tanggal, hp.hari 
from banyak_arrival ba
join hari_pengunjung hp on ba.tanggal = hp.tanggal 
join banyak_orang_dalam_1_hari bodh on bodh.tanggal = ba.tanggal


create table banyak_orang as(
	SELECT bodh.tanggal, DAYNAME(STR_TO_DATE(bodh.tanggal, '%Y-%M-%d')) AS nama_hari, bodh.jumlah as jumlah_orang
	FROM banyak_orang_dalam_1_hari bodh
)

-- tabel yg dipakai: banyak_orang dan banyak_arrival


SELECT bo.tanggal, bo.nama_hari, ba.jumlah_arrival, bo.jumlah_orang 
FROM banyak_orang bo 
LEFT JOIN banyak_arrival ba 
ON bo.tanggal = ba.tanggal

select count(*)
from hotel_bookings hb 
where CONCAT(hb.arrival_date_year, '-', hb.arrival_date_month, '-', hb.arrival_date_day_of_month) = '2017-January-2'
	and hb.reservation_status = "Check-Out"
group by CONCAT(hb.arrival_date_year, '-', hb.arrival_date_month, '-', hb.arrival_date_day_of_month)



------------------ clean code

---- 1. create table banyak arrival

create table banyak_arrival as(
	select 
		CONCAT(hb.arrival_date_year, '-', hb.arrival_date_month, '-', hb.arrival_date_day_of_month) as tanggal,
		count(*) as jumlah_arrival
	from hotel_bookings hb 
	where hb.arrival_date_year = '2017' and hb.reservation_status = "Check-Out"
	group by CONCAT(hb.arrival_date_year, '-', hb.arrival_date_month, '-', hb.arrival_date_day_of_month)
	order by tanggal
)

---- 2. jalanin script python dulu

---- 3. create table banyak orang 

create table banyak_orang as(
	SELECT bodh.tanggal, DAYNAME(STR_TO_DATE(bodh.tanggal, '%Y-%M-%d')) AS nama_hari, bodh.jumlah as jumlah_orang
	FROM banyak_orang_dalam_1_hari bodh
)

---- 4. gabungan banyak orang dan banyak arrival

SELECT bo.tanggal, bo.nama_hari, ba.jumlah_arrival, bo.jumlah_orang 
FROM banyak_orang bo 
LEFT JOIN banyak_arrival ba 
ON bo.tanggal = ba.tanggal
order by bo.tanggal asc;

UPDATE banyak_arrival
SET tanggal = STR_TO_DATE(tanggal, '%Y-%M-%d');



--- resort hotel

create table banyak_arrival_resort as(
	select 
		CONCAT(hb.arrival_date_year, '-', hb.arrival_date_month, '-', hb.arrival_date_day_of_month) as tanggal,
		count(*) as jumlah_arrival
	from hotel_bookings hb 
	where hb.arrival_date_year = '2017' and hb.reservation_status = "Check-Out" and hb.hotel = "Resort Hotel"
	group by CONCAT(hb.arrival_date_year, '-', hb.arrival_date_month, '-', hb.arrival_date_day_of_month)
	order by tanggal
)

create table banyak_orang_resort as(
	SELECT rh.tanggal, DAYNAME(STR_TO_DATE(rh.tanggal, '%Y-%M-%d')) AS nama_hari, rh.jumlah as jumlah_orang 
	FROM resort_hotel rh 
)

SELECT bor.tanggal, bor.nama_hari, bar.jumlah_arrival, bor.jumlah_orang 
from banyak_orang_resort bor 
LEFT JOIN banyak_arrival_resort bar 
ON bor.tanggal = bar.tanggal
order by tanggal asc;

UPDATE banyak_arrival_resort
SET tanggal = STR_TO_DATE(tanggal, '%Y-%M-%d');

UPDATE banyak_orang_resort
SET tanggal = STR_TO_DATE(tanggal, '%Y-%M-%d');

---- city hotel

create table banyak_arrival_city as(
	select 
		CONCAT(hb.arrival_date_year, '-', hb.arrival_date_month, '-', hb.arrival_date_day_of_month) as tanggal,
		count(*) as jumlah_arrival
	from hotel_bookings hb 
	where hb.arrival_date_year = '2017' and hb.reservation_status = "Check-Out" and hb.hotel = "City Hotel"
	group by CONCAT(hb.arrival_date_year, '-', hb.arrival_date_month, '-', hb.arrival_date_day_of_month)
	order by tanggal
)

create table banyak_orang_city as(
	SELECT ch.tanggal, DAYNAME(STR_TO_DATE(ch.tanggal, '%Y-%M-%d')) AS nama_hari, ch.jumlah as jumlah_orang 
	FROM city_hotel ch 
)

SELECT boc.tanggal, boc.nama_hari, bac.jumlah_arrival, boc.jumlah_orang 
from banyak_orang_city boc 
LEFT JOIN banyak_arrival_city bac 
ON boc.tanggal = bac.tanggal
order by boc.tanggal asc

UPDATE banyak_arrival_city
SET tanggal = STR_TO_DATE(tanggal, '%Y-%M-%d');

UPDATE banyak_orang_city
SET tanggal = STR_TO_DATE(tanggal, '%Y-%M-%d');


-------

select count(*)
from hotel_bookings hb 
where hb.country = "undefined"

select distinct (hb.country)
from hotel_bookings hb 


update hotel_bookings 
set country = "undefined"
where country = ""


UPDATE hotel_bookings hb
SET tanggal = STR_TO_DATE(tanggal, '%Y-%M-%d');

        select CONCAT(hb.arrival_date_year, '-', hb.arrival_date_month, '-', hb.arrival_date_day_of_month) as tanggal, 
            DAYNAME(STR_TO_DATE(CONCAT(hb.arrival_date_year, '-', hb.arrival_date_month, '-', hb.arrival_date_day_of_month), '%Y-%M-%d')) as hari_arrival,
            hb.country,
            count(*) as jumlah
        from hotel_bookings hb 
        where hb.reservation_status = 'Check-Out' and 
            hb.arrival_date_year = '2017' and
            hb.hotel = "City Hotel" and hb.country = 'FRA'
        GROUP BY tanggal, hb.country, hari_arrival
        order by tanggal
        
        
        select * 
        from hotel_bookings hb 
        where hb.reservation_status = 'Check-Out' and 
            hb.arrival_date_year = '2017' and
            hb.hotel = "City Hotel" and hb.country = 'FRA'
            and hb.arrival_date_month = 'April' and arrival_date_day_of_month = '1'
        
 
select count(*)
from hotel_bookings hb 
where hb.hotel = 'Resort Hotel' and hb.reservation_status = 'Check-Out' and 
            hb.arrival_date_year = '2017'
            
 select CONCAT(hb.arrival_date_year, '-', hb.arrival_date_month, '-', hb.arrival_date_day_of_month) as tanggal, 
            DAYNAME(STR_TO_DATE(CONCAT(hb.arrival_date_year, '-', hb.arrival_date_month, '-', hb.arrival_date_day_of_month), '%Y-%M-%d')) as hari_arrival,
            hb.stays_in_weekend_nights as lama_weekend,
            hb.stays_in_week_nights as lama_weekday,
            hb.stays_in_weekend_nights + hb.stays_in_week_nights as lama_nginap,
            hb.reservation_status_date,
            hb.country,
            count(*) as jumlah
        from hotel_bookings hb 
        where hb.reservation_status = 'Check-Out' and 
            hb.arrival_date_year = '2017' and
            hb.hotel = "City Hotel" and hb.country = 'FRA'
        GROUP BY tanggal, hb.country, hari_arrival, lama_weekend, lama_weekday, lama_nginap, hb.reservation_status_date
        order by tanggal

        
select distinct (hb.country)
from hotel_bookings hb 

create table negara



CREATE TABLE negara (
    id INT AUTO_INCREMENT PRIMARY KEY,
    kode_negara varchar(255),
    nama_negara varchar(255)
);


---- arrival by country

create table banyak_arrival_city_country as(
	select 
		CONCAT(hb.arrival_date_year, '-', hb.arrival_date_month, '-', hb.arrival_date_day_of_month) as tanggal,
		hb.country,
		n.nama_negara,
		count(hb.country) as jumlah_arrival
	from hotel_bookings hb
	join negara as n on hb.country = n.kode_negara
	where hb.arrival_date_year = '2017' and hb.reservation_status = "Check-Out" and hb.hotel = "City Hotel"
	group by CONCAT(hb.arrival_date_year, '-', hb.arrival_date_month, '-', hb.arrival_date_day_of_month), hb.country, n.nama_negara
	order by tanggal
)


create table banyak_arrival_resort_country as(
	select 
		CONCAT(hb.arrival_date_year, '-', hb.arrival_date_month, '-', hb.arrival_date_day_of_month) as tanggal,
		hb.country,
		n.nama_negara,
		count(hb.country) as jumlah_arrival
	from hotel_bookings hb
	join negara as n on hb.country = n.kode_negara
	where hb.arrival_date_year = '2017' and hb.reservation_status = "Check-Out" and hb.hotel = "Resort Hotel"
	group by CONCAT(hb.arrival_date_year, '-', hb.arrival_date_month, '-', hb.arrival_date_day_of_month), hb.country, n.nama_negara
	order by tanggal
)



select bacc.nama_negara, count(*) as jumlah
from banyak_arrival_city_country bacc 
group by bacc.nama_negara
order by jumlah desc


select bacc.nama_negara, count(*) as jumlah
from banyak_arrival_resort_country bacc 
group by bacc.nama_negara
order by jumlah desc


--- per tahun 2015 2016 2017


CREATE TABLE resort_hotel_2015 (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tanggal VARCHAR(255),
    jumlah INTEGER
);

CREATE TABLE resort_hotel_2016 (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tanggal VARCHAR(255),
    jumlah INTEGER
);

CREATE TABLE city_hotel_2015 (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tanggal VARCHAR(255),
    jumlah INTEGER
);

CREATE TABLE city_hotel_2016 (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tanggal VARCHAR(255),
    jumlah INTEGER
);


--- 2015

--- resort hotel

create table banyak_arrival_resort_2015 as(
	select 
		CONCAT(hb.arrival_date_year, '-', hb.arrival_date_month, '-', hb.arrival_date_day_of_month) as tanggal,
		count(*) as jumlah_arrival
	from hotel_bookings hb 
	where hb.arrival_date_year = '2015' and hb.reservation_status = "Check-Out" and hb.hotel = "Resort Hotel"
	group by CONCAT(hb.arrival_date_year, '-', hb.arrival_date_month, '-', hb.arrival_date_day_of_month)
	order by tanggal
)

create table banyak_orang_resort_2015 as(
	SELECT rh.tanggal, DAYNAME(STR_TO_DATE(rh.tanggal, '%Y-%M-%d')) AS nama_hari, rh.jumlah as jumlah_orang 
	FROM resort_hotel_2015 rh 
)

SELECT bor.tanggal, bor.nama_hari, bar.jumlah_arrival, bor.jumlah_orang 
from banyak_orang_resort_2015 bor 
LEFT JOIN banyak_arrival_resort_2015 bar 
ON bor.tanggal = bar.tanggal


---- city hotel

create table banyak_arrival_city_2015 as(
	select 
		CONCAT(hb.arrival_date_year, '-', hb.arrival_date_month, '-', hb.arrival_date_day_of_month) as tanggal,
		count(*) as jumlah_arrival
	from hotel_bookings hb 
	where hb.arrival_date_year = '2015' and hb.reservation_status = "Check-Out" and hb.hotel = "City Hotel"
	group by CONCAT(hb.arrival_date_year, '-', hb.arrival_date_month, '-', hb.arrival_date_day_of_month)
	order by tanggal
)

create table banyak_orang_city_2015 as(
	SELECT ch.tanggal, DAYNAME(STR_TO_DATE(ch.tanggal, '%Y-%M-%d')) AS nama_hari, ch.jumlah as jumlah_orang 
	FROM city_hotel_2015 ch 
)

SELECT boc.tanggal, boc.nama_hari, bac.jumlah_arrival, boc.jumlah_orang 
from banyak_orang_city_2015 boc 
LEFT JOIN banyak_arrival_city_2015 bac 
ON boc.tanggal = bac.tanggal


--- 2016

--- resort hotel

create table banyak_arrival_resort_2016 as(
	select 
		CONCAT(hb.arrival_date_year, '-', hb.arrival_date_month, '-', hb.arrival_date_day_of_month) as tanggal,
		count(*) as jumlah_arrival
	from hotel_bookings hb 
	where hb.arrival_date_year = '2016' and hb.reservation_status = "Check-Out" and hb.hotel = "Resort Hotel"
	group by CONCAT(hb.arrival_date_year, '-', hb.arrival_date_month, '-', hb.arrival_date_day_of_month)
	order by tanggal
)

create table banyak_orang_resort_2016 as(
	SELECT rh.tanggal, DAYNAME(STR_TO_DATE(rh.tanggal, '%Y-%M-%d')) AS nama_hari, rh.jumlah as jumlah_orang 
	FROM resort_hotel_2016 rh 
)

SELECT bor.tanggal, bor.nama_hari, bar.jumlah_arrival, bor.jumlah_orang 
from banyak_orang_resort_2016 bor 
LEFT JOIN banyak_arrival_resort_2016 bar 
ON bor.tanggal = bar.tanggal


---- city hotel

create table banyak_arrival_city_2016 as(
	select 
		CONCAT(hb.arrival_date_year, '-', hb.arrival_date_month, '-', hb.arrival_date_day_of_month) as tanggal,
		count(*) as jumlah_arrival
	from hotel_bookings hb 
	where hb.arrival_date_year = '2016' and hb.reservation_status = "Check-Out" and hb.hotel = "City Hotel"
	group by CONCAT(hb.arrival_date_year, '-', hb.arrival_date_month, '-', hb.arrival_date_day_of_month)
	order by tanggal
)

create table banyak_orang_city_2016 as(
	SELECT ch.tanggal, DAYNAME(STR_TO_DATE(ch.tanggal, '%Y-%M-%d')) AS nama_hari, ch.jumlah as jumlah_orang 
	FROM city_hotel_2016 ch 
)

SELECT boc.tanggal, boc.nama_hari, bac.jumlah_arrival, boc.jumlah_orang 
from banyak_orang_city_2016 boc 
LEFT JOIN banyak_arrival_city_2016 bac 
ON boc.tanggal = bac.tanggal



-- market


select count(*) as jumlah, hb.market_segment 
from hotel_bookings hb 
where hb.arrival_date_year = '2017' and hb.reservation_status = "Check-Out" and hb.hotel = "City Hotel"
group by hb.market_segment 
order by jumlah desc

select count(*) as jumlah, hb.market_segment 
from hotel_bookings hb 
where hb.arrival_date_year = '2017' and hb.reservation_status = "Check-Out" and hb.hotel = "Resort Hotel"
group by hb.market_segment 
order by jumlah desc


-- customer type

select count(*) as jumlah, hb.customer_type  
from hotel_bookings hb 
where hb.arrival_date_year = '2017' and hb.reservation_status = "Check-Out" and hb.hotel = "City Hotel"
group by hb.customer_type  
order by jumlah desc

select count(*) as jumlah, hb.customer_type  
from hotel_bookings hb 
where hb.arrival_date_year = '2017' and hb.reservation_status = "Check-Out" and hb.hotel = "Resort Hotel"
group by hb.customer_type  
order by jumlah desc


-- channel

select count(*) as jumlah, hb.distribution_channel  
from hotel_bookings hb 
where hb.arrival_date_year = '2017' and hb.reservation_status = "Check-Out" and hb.hotel = "City Hotel"
group by hb.distribution_channel  
order by jumlah desc


select count(*) as jumlah, hb.distribution_channel  
from hotel_bookings hb 
where hb.arrival_date_year = '2017' and hb.reservation_status = "Check-Out" and hb.hotel = "Resort Hotel"
group by hb.distribution_channel  
order by jumlah desc

