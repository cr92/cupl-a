fun is_older (date1: int * int * int, date2: int * int * int) : bool =
  let
    val (year1, month1, day1) = date1;
    val (year2, month2, day2) = date2;
  in
    if year1 < year2 then true
    else if month1 < month2 andalso year1 = year2 then true
    else if day1 < day2 andalso month1 = month2 andalso year1 = year2 then true
    else false
  end


fun number_in_month (dates: (int * int * int) list, month: int) : int =
  if null dates then 0
  else if #2 (hd dates) = month then 1 + number_in_month (tl dates, month)
  else number_in_month (tl dates, month)


fun number_in_months (dates: (int * int * int) list, months: int list) : int =
  if null months then 0
  else number_in_month (dates, hd months) + number_in_months (dates, tl months)


fun dates_in_month (dates: (int * int * int) list, month: int) : (int * int * int) list =
  if null dates then []
  else if #2 (hd dates) = month then (hd dates) :: dates_in_month (tl dates, month)
  else dates_in_month (tl dates, month)


fun dates_in_months (dates: (int * int * int) list, months: int list) : (int * int * int) list =
  if not (null months) then dates_in_month (dates, hd months) @ dates_in_months (dates, tl months)
  else []


fun get_nth (strs: string list, n: int) : string =
  if n = 1 then hd strs else get_nth (tl strs, n - 1)
(*
Write a function get_nth that takes a list of strings and an int n and returns the nth element of the
list where the head of the list is 1st . Do not worry about the case where the list has too few elements:
your function may apply hd or tl to the empty list in this case, which is okay. *)
