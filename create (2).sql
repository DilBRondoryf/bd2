create or replace procedure Create_1 ()
language plpgsql
as $$
	begin 
	create table if not exists Clients
	(
		oms_number serial not null primary key,
		full_name varchar(150) not null,
		birth_date date not null,
		gender char(1) not null,
		phone varchar(20) not null,
		email varchar(254) not null,
		passport_series varchar(4) not null,
		passport_issue_date date not null,
		passport_issue_by varchar(255) not null,
		passport_division_code varchar(7) not null,
		address text not null,
		registration_date date not null,
		is_verified boolean default true not null
	);

	create table if not exists Employee
	(
		login serial not null primary key,
		password_hash varchar(255) not null,
		full_name varchar(150) not null,
		email varchar(100) not null,
		phone varchar(20) not null,
		hire_date varchar(20) null,
		position varchar(20) not null,
		is_active boolean not null,
		created_at timestamp not null,
		updated_at timestamp not null
	);

	create table if not exists GameType
	(
		type_code serial not null primary key,
		type_name varchar(100) not null,
		description_id text not null,
		base_price decimal(10, 2) not null,
		duration_minutes int not null,
		max_players int not null,
		min_players int not null,
		is_available boolean default true not null
	);

	create table if not exists GameMap
	(
		map_code serial not null primary key,
		map_name varchar(100) not null,
		description_id text not null,
		difficulty_level int not null,
		rental_price decimal(10, 2) not null,
		area_sqm decimal(8, 2) not null,
		max_players int not null,
		min_players int not null,
		is_available boolean default true not null
	);

	create table if not exists Contract
	(
		contract_number serial not null primary key,
		contract_date timestamp not null,
		game_date timestamp not null,
		game_duration int not null,
		game_end_time timestamp not null,
		total_price decimal(10, 2) not null,
		prepayment decimal(10, 2) not null,
		login int not null,
		oms_number int not null,
		type_code int not null,
		payment_status varchar(20) not null,
		notes text not null,
		cancellation_reason text not null,
		foreign key (login) references Employee (login),
		foreign key (oms_number) references Clients (oms_number),
		foreign key (type_code) references GameType (type_code)
	);

	create table if not exists Inventory
	(
		inventory_id serial not null primary key,
		contract_number int not null,
		item_name varchar(100) not null,
		brand_model varchar(100) not null,
		item_type varchar(20) not null,
		total_quantity int not null,
		available_quantity int not null,
		purchase_price decimal(10, 2) not null,
		rental_price_per_hour decimal(10, 2) not null,
		condition_status varchar(20) not null,
		last_maintenance_date date not null,
		next_maintenance_date date not null,
		foreign key (contract_number) references Contract (contract_number)
	);

	create table if not exists AdditionalOption
	(
		option_code serial not null primary key,
		option_name varchar(100) not null,
		contract_number int not null,
		description_id varchar(20) not null,
		unit_price decimal(10, 2) not null,
		unit_type varchar(20) not null,
		is_available boolean default true not null,
		foreign key (contract_number) references Contract (contract_number)
	);

	create table if not exists Addendum
	(
		addendum_number serial not null primary key,
		contract_number int not null,
		oms_number int not null,
		participant_role varchar(100) not null,
		created_at timestamp not null,
		signed_at timestamp not null,
		foreign key (contract_number) references Contract (contract_number),
		foreign key (oms_number) references Clients (oms_number)
	);

	create table if not exists ContractOption
	(
		id serial not null primary key,
		contract_number int not null,
		option_code int not null,
		quantity int not null,
		actual_unit_price decimal(10, 2) not null,
		total_price decimal(10, 2) not null,
		foreign key (contract_number) references Contract (contract_number),
		foreign key (option_code) references AdditionalOption (option_code)
	);

	create table if not exists InventorySpecification
	(
		spec_name serial not null primary key,
		inventory_id int not null,
		spec_value varchar(20) not null,
		unit varchar(20) not null,
		foreign key (inventory_id) references Inventory (inventory_id)
	);

	create table if not exists InventoryRental
	(
		rental_id serial not null primary key,
		inventory_id int not null,
		contract_number int not null,
		quantity int not null,
		rental_hours int not null,
		unit_price decimal(10, 2) not null,
		total_price decimal(10, 2) not null,
		rental_status varchar(20) not null,
		planned_issue_time timestamp not null,
		actual_issue_time timestamp not null,
		planned_return_time timestamp not null,
		actual_return_time timestamp not null,
		notes text not null,
		damage_description text not null,
		penalty_amount decimal(10, 2) not null,
		foreign key (inventory_id) references Inventory (inventory_id),
		foreign key (contract_number) references Contract (contract_number)
	);