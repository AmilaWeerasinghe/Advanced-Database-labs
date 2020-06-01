//.........................................................Part 01.............................................................................///////

//select data from departments table
select * from departments;

//insert data into departments table
insert into `departments` (`dept_no`,`dept_name`) values ('d010','database Department'); 

//update row in departments table
update departments set dept_name='New database department t2' where dept_no='d010';



//................................................................Part 02...................................................................////////

//create databse
create database bank;

//create tables

CREATE TABLE `users` (  `User_name` varchar(100) NOT NULL,  `Account_number` int(11) NOT NULL,  `Branch` varchar(100) NOT NULL,  `Birth date` date NOT NULL) ENGINE=InnoDB DEFAULT CHARSET=latin1;

//index for user table

ALTER TABLE `users`
  ADD PRIMARY KEY (`Account_number`);

//create Account table 

CREATE TABLE `bank`.`Account` ( `Account_no` INT NOT NULL , `Balance` INT NOT NULL , `Interst_val` INT NOT NULL , PRIMARY KEY (`Account_no`)) ENGINE = InnoDB;

//insert into  account table
INSERT INTO `account` (`Account_no`, `Balance`, `Interst_val`) VALUES
(300, 1000, 4),
(400, 5000, 4);


//insert into users table
INSERT INTO `users` (`User_name`, `Account_number`, `Branch`, `Birth date`) VALUES
('Amila Weerasinghe', 300, 'Matale', '1996-01-21'),
('Kanthi Munasinghe', 400, 'Kandy', '1962-04-25');


// adding  index
ALTER TABLE `account`
  ADD PRIMARY KEY (`Account_no`);


........................//transaction of Rs.1000 from Kanthi to Amila...............................................

start transaction
select balance from Account where Account_no='400';
select balance from Account where Account_no='300';
update Account set balance=balance-1000 where Account_no='400' ;
update Account set balance=balance+1000 where Account_no='300' ;
commit;           //if all sql queries succed
rollback;            //if any of Sql queries failed or error
savepoint sv_p1;      //save point created so this use rollback in future cases.


