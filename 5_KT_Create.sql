CREATE OR REPLACE PROCEDURE Structure_Create()
LANGUAGE plpgsql
AS $$
BEGIN
    CALL Create_1();
    RAISE NOTICE 'Структура базы данных успешно создана.';
END;
$$;