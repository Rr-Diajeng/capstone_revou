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
