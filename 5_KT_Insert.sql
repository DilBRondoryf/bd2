INSERT INTO Clients (oms_number, full_name, birth_date, gender, phone, email, ...)
VALUES 
(1, 'Иванов Иван Иванович', '1990-01-01', 'М', '+79001112233', 'ivanov@mail.com', ...),
(2, 'Петров Петр Петрович', '1985-05-05', 'М', '+79002223344', 'petrov@mail.com', ...);

CALL Clients_Insert(3, 'Сидорова Мария Сергеевна', '1995-10-10', 'Ж', '+79003334455', 'sidorova@mail.com', ...);
CALL Clients_Insert(4, 'Козлова Елена Андреевна', '2000-03-03', 'Ж', '+79004445566', 'kozlova@mail.com', ...);

INSERT INTO Employee (login, password_hash, full_name, email, phone, ...) VALUES (1, 'hash1', ...);
CALL Employee_Insert(2, 'hash2', ...);