fun is_older(date1:int*int*int, date2:int*int*int):bool = 
let
    val (year1,month1,day1) = date1;
    val (year2,month2,day2) = date2;
in
    if year1<year2 then true
    else if month1<month2 andalso year1=year2 then true
    else if day1<day2 andalso month1=month2 andalso year1=year2 then true
    else false
end


fun number_in_month(dates:(int*int*int)list, month:int):int =
    if null dates then 0
    else if #2 (hd dates)=month then 1 + number_in_month(tl dates, month)
    else number_in_month(tl dates, month)


fun number_in_months(dates:(int*int*int)list, months:int list):int =
    if null months then 0
    else number_in_month(dates, hd months) + number_in_months(dates, tl months)


fun dates_in_month(dates:(int*int*int)list, month:int):(int*int*int)list =
    if null dates then []
    else if #2 (hd dates)=month then (hd dates)::dates_in_month(tl dates, month)
    else dates_in_month(tl dates, month)
