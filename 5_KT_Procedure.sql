CREATE OR REPLACE PROCEDURE Create_1()
LANGUAGE plpgsql
AS $$
	BEGIN 
		CREATE TABLE IF NOT EXISTS Clients ( ... ); -- Ваш код CREATE TABLE
		CREATE TABLE IF NOT EXISTS Employee ( ... ); -- Ваш код
		CREATE TABLE IF NOT EXISTS InventoryRental ( ... ); -- Ваш код
	END;
$$;

CREATE OR REPLACE PROCEDURE Clients_Insert(
	p_oms_number INT, p_full_name VARCHAR(150), p_birth_date DATE,
	p_gender CHAR(1), p_phone VARCHAR(20), p_email VARCHAR(254),
	p_passport_series VARCHAR(4), p_passport_issue_date DATE,
	p_passport_issue_by VARCHAR(255), p_passport_division_code VARCHAR(7),
	p_address TEXT, p_registration_date DATE, p_is_verified BOOLEAN
)
LANGUAGE plpgsql AS $$
BEGIN
	INSERT INTO Clients (oms_number, full_name, birth_date, gender, phone, email,
		passport_series, passport_issue_date, passport_issue_by, passport_division_code,
		address, registration_date, is_verified)
	VALUES (p_oms_number, p_full_name, p_birth_date, p_gender, p_phone, p_email,
		p_passport_series, p_passport_issue_date, p_passport_issue_by, p_passport_division_code,
		p_address, p_registration_date, p_is_verified);
END;
$$;

CREATE OR REPLACE PROCEDURE Clients_Update(
	p_oms_number INT, p_full_name VARCHAR(150), p_birth_date DATE,
	p_gender CHAR(1), p_phone VARCHAR(20), p_email VARCHAR(254),
	p_passport_series VARCHAR(4), p_passport_issue_date DATE,
	p_passport_issue_by VARCHAR(255), p_passport_division_code VARCHAR(7),
	p_address TEXT, p_registration_date DATE, p_is_verified BOOLEAN
)
LANGUAGE plpgsql AS $$
BEGIN
	UPDATE Clients SET
		full_name = p_full_name, birth_date = p_birth_date, gender = p_gender,
		phone = p_phone, email = p_email, passport_series = p_passport_series,
		passport_issue_date = p_passport_issue_date, passport_issue_by = p_passport_issue_by,
		passport_division_code = p_passport_division_code, address = p_address,
		registration_date = p_registration_date, is_verified = p_is_verified
	WHERE oms_number = p_oms_number;
END;
$$;

CREATE OR REPLACE PROCEDURE Clients_Delete(p_oms_number INT)
LANGUAGE plpgsql AS $$
BEGIN
	DELETE FROM Clients WHERE oms_number = p_oms_number;
END;
$$;
CREATE ROLE IF NOT EXISTS rl_store_admin; -- Администратор
CREATE ROLE IF NOT EXISTS rl_store_manager; -- Менеджер
CREATE ROLE IF NOT EXISTS rl_store_consultant; -- Консультант

GRANT EXECUTE ON PROCEDURE Clients_Insert TO rl_store_admin;
GRANT EXECUTE ON PROCEDURE Clients_Update TO rl_store_admin;
GRANT EXECUTE ON PROCEDURE Clients_Delete TO rl_store_admin;

GRANT EXECUTE ON PROCEDURE Clients_Insert TO rl_store_manager;
GRANT EXECUTE ON PROCEDURE Clients_Update TO rl_store_manager;
GRANT EXECUTE ON PROCEDURE Contract_Insert TO rl_store_manager;