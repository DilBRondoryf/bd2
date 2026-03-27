CREATE OR REPLACE PROCEDURE Structure_Re_Create()
LANGUAGE plpgsql
AS $$
BEGIN
    DROP PROCEDURE IF EXISTS Clients_Insert;
    DROP PROCEDURE IF EXISTS Clients_Update;
    DROP PROCEDURE IF EXISTS Clients_Delete;

    DROP TABLE IF EXISTS InventoryRental CASCADE;
    DROP TABLE IF EXISTS ContractOption CASCADE;
    DROP TABLE IF EXISTS InventorySpecification CASCADE;
    DROP TABLE IF EXISTS Addendum CASCADE;
    DROP TABLE IF EXISTS AdditionalOption CASCADE;
    DROP TABLE IF EXISTS Inventory CASCADE;
    DROP TABLE IF EXISTS Contract CASCADE;
    DROP TABLE IF EXISTS GameMap CASCADE;
    DROP TABLE IF EXISTS GameType CASCADE;
    DROP TABLE IF EXISTS Employee CASCADE;
    DROP TABLE IF EXISTS Clients CASCADE;

    CALL Structure_Create();
    
    RAISE NOTICE 'База данных успешно пересоздана.';
END;
$$;