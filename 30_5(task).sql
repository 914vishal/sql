-- TASk: CREATE  REMAINING PROCEDURES LIKE (/,%,*),CREATE  ARTHEMATIC PROCEDURE .CALL REMAINING PROCEDURES IN ARTHMATIC PROCEDURE .

-- delimiter $$
-- create procedure sum_two(IN n1 int, IN n2 int)
-- begin
-- select n1+n2 as sum_result;
-- end $$
-- delimiter ;

-- delimiter $$
-- create procedure diff_two(IN n1 int, IN n2 int)
-- begin
-- select n1-n2 as diff_result;
-- end $$
-- delimiter ;

-- delimiter $$
-- create procedure mul_two(IN n1 int, IN n2 int)
-- begin
-- select n1*n2 as mul_result;
-- end $$
-- delimiter ;

-- delimiter $$
-- create procedure div_two(IN n1 int, IN n2 int)
-- begin
-- select n1/n2 as div_result;
-- end $$
-- delimiter ;

-- delimiter $$
-- create procedure rem_two(IN n1 int, IN n2 int)
-- begin
-- select n1%n2 as rem_result;
-- end $$
-- delimiter ;



-- delimiter $$
-- create procedure arthematics(IN n1 int, IN n2 int)
-- begin
-- call sum_two(n1,n2);
-- call diff_two(n1,n2);
-- call mul_two(n1,n2);
-- call div_two(n1,n2);
-- call rem_two(n1,n2);
-- end $$
-- delimiter ;

call arthematics(5,7);
