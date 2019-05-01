
-- a) Insert 3 tuples
/*INSERT INTO position VALUES ('001','CEO','300','70','50'),
('003','Assistant','50','30','30'),
('004','Admin', '80', '40', '30'),
('007','Manager','100','40','40');

INSERT INTO Payment VALUES ('234','4/1/19','4500','414','345','134','3/15/19','3/31/19'),
('235','4/1/19','6831','187','248','130','3/15/19','3/31/19'),
('236','4/1/19','9730','614','745','337','3/15/19','3/31/19');


INSERT INTO PTO VALUES ('1', '2/5/19', '2/12/19', 'Vacation'),
('2', '12/2/18', '12/20/18', 'Flu'),
('3', '3/2/19', '3/19/19', 'Vacation');

INSERT INTO shift VALUES ('22','12:00','12:30','9:30','16:00'),
('33','12:00','13:00','10:00','16:00'),
('44','12:30','12:00','9:00','15:00');


INSERT INTO Employee VALUES ('1', 'Dave', '0', '30', '1', '001'),
('5', 'Neil', '30', '28', NULL, '004'),
('17', 'Tom', '15', '15', '2', '003'),
('20', 'Jane', '20', '25', '3', '007'),
('9', 'Kate', '32', '40', NULL, '007');


INSERT INTO Payment_Record VALUES ('234','1'),
('235','17'),
('236','20');
*/

-- b) DELETE queries


-- c) SELECT queries

-- SELECT record.payment_id, record.employee_id FROM payment_record record, Employee employee  WHERE record.employee_id = employee.EID AND employee.EID > 15; 

-- SELECT position.position_id AS PID, position.Position_Title AS Position, employee.name As Employee FROM Position position, Employee employee 
-- WHERE position.position_id = 7 AND position.position_id = employee.positionID;

-- SELECT employee.PTO_id, employee.name, pto.Reason AS Reasons_for_leave FROM Employee employee, PTO pto 
-- WHERE employee.PTO_id = pto.pto_id AND pto.Reason = 'Vacation'; 



