use pandemic;

delimiter //

create function year_diff(input_year int)
returns int
deterministic
begin
	declare date_start date;
    set date_start = str_to_date(concat(input_year, '-01-01'), '%Y-%m-%d');
    return timestampdiff(year, date_start, curdate());
end;
//

delimiter ;