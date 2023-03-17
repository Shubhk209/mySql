/*

	MATHEMATICAL FUNCTION IN SQL
	----------------------------


	1. ABS (numeric_expression)
	- stands Absolute
	- Return : the absolute (positive) number.


	2. CEILING(numeric_expression)
	- take single parameter
	- RETURN: the smallest integer value greater than or equal to the parameter.

	3. FLOOR(numeric_expression)
	- take single parameter
	- RETURN: the LARGEST integer value less than or equal to the parameter.
		
	4. POWER(expression, power)
	- RETURN: the power value of the specified expression to the specified power.

	5. SQUARE(expression)
	- RETURN: the SQUARE value of the specified expression

	5. SQRT(expression)
	- RETURN: the SQUARE ROOT value of the specified expression 

	6. RAND([seed_value])
	- RETURN: random float number between 0 to 1.
	- it takes an OPTIONAL seed parameter.
	- when seed value is supplied the RAND() function always returns the same value for the same seed.


	7. ROUND(numeric_expression,length,[Function])
	- Round the given numeric expression based on length.
	- 3 Parameter:	
					1. Numeric Expression: Number we want to round
					2. Length: specify the number of digit we want to round
								- positive number : rounding is applied to decimal part
								- negative numbber: rounding is applied to the number before the decimal
					3. Optional Function: used to indicate rounding or truncating operation
											- 0 indicate ronding (BY DEFAULT)
											- non-zero indicate truncate 


	NOTE:
	TO CHECK ALL AVAILABLE MATHEMATICAL FUNCTION IN SQL
	- OBJECT EXPLORER > DATABASES > ANY_DATABASE > PROGRAMMABILITY > SYSTEM FUNCTION > MATHEMATICAL FUNCTIONS.
*/


-- ABS function

SELECT ABS(-101.5);			-- RETURNS 101.5, WITHOUT - SIGN
GO


-- CEILING FUNCTION 

SELECT CEILING(15.2)		-- RETURNS:  16

SELECT CEILING(-15.2)		-- RETURNS: -15

GO


-- FLOOR FUNCTION 

SELECT FLOOR(15.2)		-- RETURNS:  15

SELECT FLOOR(-15.2)		-- RETURNS: -16

GO


-- POWER FUNCTION
SELECT POWER(2,3)		-- RETURN: 8 , (2*2*2=8)
GO


-- SQUARE FUNCTION

SELECT SQUARE(2)		-- RETURN: 4 , (2*2=4)
GO


-- SQRT FUNCTION

SELECT SQRT(81)		-- RETURN: 9 

SELECT SQRT(22)		-- RETURN: 4.69041575982343 
GO


-- RAND FUNCTION
SELECT RAND(1)		-- 0.713591993212924, ALWAYS RETURNS THE SAME VALUE

SELECT RAND()		-- ALWAY RETURN DIFFERNT VALUE BETWEEN 0 TO 1.


-- GENERATE RANDOM NUMBER BETWEEN 1 TO 100

SELECT FLOOR(RAND() * 100) 


-- PRINT 10 RANDOM NUMBER BETWEEN 1 TO 100

/*Delcare counter variable*/
DECLARE @COUNTER INT

/* set counter to initial value 1*/
SET @COUNTER = 1

/*WHILE LOOP*/
WHILE(@COUNTER <= 10)
BEGIN
	PRINT FLOOR(RAND()*100)
	SET @COUNTER = @COUNTER + 1

END

GO


-- ROUND FUNCTION

-- Round to 2 places after (to the right) the decimal point
SELECT ROUND(850.556, 2)		-- 850.560


-- Truncate anything to after 2 places, after (to the right) the decimal point
SELECT ROUND(850.556, 2, 1)		-- 850.550


-- Round to 1 places after (to the right) the decimal point
SELECT ROUND(850.556, 1)		-- 850.600


-- Truncate anything to after 1 places, after (to the right) the decimal point
SELECT ROUND(850.556, 1, 1)		-- 850.500


-- Round to last 2 places before (to the left) the decimal point
SELECT ROUND(850.556, -2)		-- 900.000



-- Round to last 1 places before (to the left) the decimal point
SELECT ROUND(850.556, -1)		-- 850.000

go