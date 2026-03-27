CALL Clients_Update(1, 'Иванов Иван Иванович', '1990-01-01', 'М', '+79999999999', ...); -- Изменение
CALL Clients_Insert(5, 'Новый Клиент', ...); -- Добавление (если есть право)

SET ROLE rl_store_admin;
CALL GameType_Update(1, 'Новое название игры', ...);
CALL GameType_Delete(3);