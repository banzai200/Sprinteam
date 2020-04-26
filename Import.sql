-- Adminer 4.7.6 PostgreSQL dump

\connect "sprinteam";

DROP TABLE IF EXISTS "auth_group";
DROP SEQUENCE IF EXISTS auth_group_id_seq;
CREATE SEQUENCE auth_group_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

CREATE TABLE "public"."auth_group" (
    "id" integer DEFAULT nextval('auth_group_id_seq') NOT NULL,
    "name" character varying(150) NOT NULL,
    CONSTRAINT "auth_group_name_key" UNIQUE ("name"),
    CONSTRAINT "auth_group_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

CREATE INDEX "auth_group_name_a6ea08ec_like" ON "public"."auth_group" USING btree ("name");


DROP TABLE IF EXISTS "auth_group_permissions";
DROP SEQUENCE IF EXISTS auth_group_permissions_id_seq;
CREATE SEQUENCE auth_group_permissions_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

CREATE TABLE "public"."auth_group_permissions" (
    "id" integer DEFAULT nextval('auth_group_permissions_id_seq') NOT NULL,
    "group_id" integer NOT NULL,
    "permission_id" integer NOT NULL,
    CONSTRAINT "auth_group_permissions_group_id_permission_id_0cd325b0_uniq" UNIQUE ("group_id", "permission_id"),
    CONSTRAINT "auth_group_permissions_pkey" PRIMARY KEY ("id"),
    CONSTRAINT "auth_group_permissio_permission_id_84c5c92e_fk_auth_perm" FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED DEFERRABLE,
    CONSTRAINT "auth_group_permissions_group_id_b120cbf9_fk_auth_group_id" FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED DEFERRABLE
) WITH (oids = false);

CREATE INDEX "auth_group_permissions_group_id_b120cbf9" ON "public"."auth_group_permissions" USING btree ("group_id");

CREATE INDEX "auth_group_permissions_permission_id_84c5c92e" ON "public"."auth_group_permissions" USING btree ("permission_id");


DROP TABLE IF EXISTS "auth_permission";
DROP SEQUENCE IF EXISTS auth_permission_id_seq;
CREATE SEQUENCE auth_permission_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

CREATE TABLE "public"."auth_permission" (
    "id" integer DEFAULT nextval('auth_permission_id_seq') NOT NULL,
    "name" character varying(255) NOT NULL,
    "content_type_id" integer NOT NULL,
    "codename" character varying(100) NOT NULL,
    CONSTRAINT "auth_permission_content_type_id_codename_01ab375a_uniq" UNIQUE ("content_type_id", "codename"),
    CONSTRAINT "auth_permission_pkey" PRIMARY KEY ("id"),
    CONSTRAINT "auth_permission_content_type_id_2f476e4b_fk_django_co" FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED DEFERRABLE
) WITH (oids = false);

CREATE INDEX "auth_permission_content_type_id_2f476e4b" ON "public"."auth_permission" USING btree ("content_type_id");

INSERT INTO "auth_permission" ("id", "name", "content_type_id", "codename") VALUES
(1,	'Can add boards',	1,	'add_boards'),
(2,	'Can change boards',	1,	'change_boards'),
(3,	'Can delete boards',	1,	'delete_boards'),
(4,	'Can view boards',	1,	'view_boards'),
(5,	'Can add cards',	2,	'add_cards'),
(6,	'Can change cards',	2,	'change_cards'),
(7,	'Can delete cards',	2,	'delete_cards'),
(8,	'Can view cards',	2,	'view_cards'),
(9,	'Can add teams',	3,	'add_teams'),
(10,	'Can change teams',	3,	'change_teams'),
(11,	'Can delete teams',	3,	'delete_teams'),
(12,	'Can view teams',	3,	'view_teams'),
(13,	'Can add users',	4,	'add_users'),
(14,	'Can change users',	4,	'change_users'),
(15,	'Can delete users',	4,	'delete_users'),
(16,	'Can view users',	4,	'view_users'),
(17,	'Can add lists',	5,	'add_lists'),
(18,	'Can change lists',	5,	'change_lists'),
(19,	'Can delete lists',	5,	'delete_lists'),
(20,	'Can view lists',	5,	'view_lists'),
(21,	'Can add categories',	6,	'add_categories'),
(22,	'Can change categories',	6,	'change_categories'),
(23,	'Can delete categories',	6,	'delete_categories'),
(24,	'Can view categories',	6,	'view_categories'),
(25,	'Can add log entry',	7,	'add_logentry'),
(26,	'Can change log entry',	7,	'change_logentry'),
(27,	'Can delete log entry',	7,	'delete_logentry'),
(28,	'Can view log entry',	7,	'view_logentry'),
(29,	'Can add permission',	8,	'add_permission'),
(30,	'Can change permission',	8,	'change_permission'),
(31,	'Can delete permission',	8,	'delete_permission'),
(32,	'Can view permission',	8,	'view_permission'),
(33,	'Can add group',	9,	'add_group'),
(34,	'Can change group',	9,	'change_group'),
(35,	'Can delete group',	9,	'delete_group'),
(36,	'Can view group',	9,	'view_group'),
(37,	'Can add user',	10,	'add_user'),
(38,	'Can change user',	10,	'change_user'),
(39,	'Can delete user',	10,	'delete_user'),
(40,	'Can view user',	10,	'view_user'),
(41,	'Can add content type',	11,	'add_contenttype'),
(42,	'Can change content type',	11,	'change_contenttype'),
(43,	'Can delete content type',	11,	'delete_contenttype'),
(44,	'Can view content type',	11,	'view_contenttype'),
(45,	'Can add session',	12,	'add_session'),
(46,	'Can change session',	12,	'change_session'),
(47,	'Can delete session',	12,	'delete_session'),
(48,	'Can view session',	12,	'view_session');

DROP TABLE IF EXISTS "auth_user";
DROP SEQUENCE IF EXISTS auth_user_id_seq;
CREATE SEQUENCE auth_user_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

CREATE TABLE "public"."auth_user" (
    "id" integer DEFAULT nextval('auth_user_id_seq') NOT NULL,
    "password" character varying(128) NOT NULL,
    "last_login" timestamptz,
    "is_superuser" boolean NOT NULL,
    "username" character varying(150) NOT NULL,
    "first_name" character varying(30) NOT NULL,
    "last_name" character varying(150) NOT NULL,
    "email" character varying(254) NOT NULL,
    "is_staff" boolean NOT NULL,
    "is_active" boolean NOT NULL,
    "date_joined" timestamptz NOT NULL,
    CONSTRAINT "auth_user_pkey" PRIMARY KEY ("id"),
    CONSTRAINT "auth_user_username_key" UNIQUE ("username")
) WITH (oids = false);

CREATE INDEX "auth_user_username_6821ab7c_like" ON "public"."auth_user" USING btree ("username");

INSERT INTO "auth_user" ("id", "password", "last_login", "is_superuser", "username", "first_name", "last_name", "email", "is_staff", "is_active", "date_joined") VALUES
(1,	'pbkdf2_sha256$180000$2J3FFc8KGu4C$0TPbkFEH8ENEiQmSmHFYstqIHI9whYdQEcddjsqB02w=',	'2020-04-19 17:54:16.335679+00',	'1',	'root',	'',	'',	'',	'1',	'1',	'2020-04-19 02:43:54.292311+00');

DROP TABLE IF EXISTS "auth_user_groups";
DROP SEQUENCE IF EXISTS auth_user_groups_id_seq;
CREATE SEQUENCE auth_user_groups_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

CREATE TABLE "public"."auth_user_groups" (
    "id" integer DEFAULT nextval('auth_user_groups_id_seq') NOT NULL,
    "user_id" integer NOT NULL,
    "group_id" integer NOT NULL,
    CONSTRAINT "auth_user_groups_pkey" PRIMARY KEY ("id"),
    CONSTRAINT "auth_user_groups_user_id_group_id_94350c0c_uniq" UNIQUE ("user_id", "group_id"),
    CONSTRAINT "auth_user_groups_group_id_97559544_fk_auth_group_id" FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED DEFERRABLE,
    CONSTRAINT "auth_user_groups_user_id_6a12ed8b_fk_auth_user_id" FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED DEFERRABLE
) WITH (oids = false);

CREATE INDEX "auth_user_groups_group_id_97559544" ON "public"."auth_user_groups" USING btree ("group_id");

CREATE INDEX "auth_user_groups_user_id_6a12ed8b" ON "public"."auth_user_groups" USING btree ("user_id");


DROP TABLE IF EXISTS "auth_user_user_permissions";
DROP SEQUENCE IF EXISTS auth_user_user_permissions_id_seq;
CREATE SEQUENCE auth_user_user_permissions_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

CREATE TABLE "public"."auth_user_user_permissions" (
    "id" integer DEFAULT nextval('auth_user_user_permissions_id_seq') NOT NULL,
    "user_id" integer NOT NULL,
    "permission_id" integer NOT NULL,
    CONSTRAINT "auth_user_user_permissions_pkey" PRIMARY KEY ("id"),
    CONSTRAINT "auth_user_user_permissions_user_id_permission_id_14a6b632_uniq" UNIQUE ("user_id", "permission_id"),
    CONSTRAINT "auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm" FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED DEFERRABLE,
    CONSTRAINT "auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id" FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED DEFERRABLE
) WITH (oids = false);

CREATE INDEX "auth_user_user_permissions_permission_id_1fbb5f2c" ON "public"."auth_user_user_permissions" USING btree ("permission_id");

CREATE INDEX "auth_user_user_permissions_user_id_a95ead1b" ON "public"."auth_user_user_permissions" USING btree ("user_id");


DROP TABLE IF EXISTS "django_admin_log";
DROP SEQUENCE IF EXISTS django_admin_log_id_seq;
CREATE SEQUENCE django_admin_log_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

CREATE TABLE "public"."django_admin_log" (
    "id" integer DEFAULT nextval('django_admin_log_id_seq') NOT NULL,
    "action_time" timestamptz NOT NULL,
    "object_id" text,
    "object_repr" character varying(200) NOT NULL,
    "action_flag" smallint NOT NULL,
    "change_message" text NOT NULL,
    "content_type_id" integer,
    "user_id" integer NOT NULL,
    CONSTRAINT "django_admin_log_pkey" PRIMARY KEY ("id"),
    CONSTRAINT "django_admin_log_content_type_id_c4bce8eb_fk_django_co" FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED DEFERRABLE,
    CONSTRAINT "django_admin_log_user_id_c564eba6_fk_auth_user_id" FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED DEFERRABLE
) WITH (oids = false);

CREATE INDEX "django_admin_log_content_type_id_c4bce8eb" ON "public"."django_admin_log" USING btree ("content_type_id");

CREATE INDEX "django_admin_log_user_id_c564eba6" ON "public"."django_admin_log" USING btree ("user_id");


DROP TABLE IF EXISTS "django_content_type";
DROP SEQUENCE IF EXISTS django_content_type_id_seq;
CREATE SEQUENCE django_content_type_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

CREATE TABLE "public"."django_content_type" (
    "id" integer DEFAULT nextval('django_content_type_id_seq') NOT NULL,
    "app_label" character varying(100) NOT NULL,
    "model" character varying(100) NOT NULL,
    CONSTRAINT "django_content_type_app_label_model_76bd3d3b_uniq" UNIQUE ("app_label", "model"),
    CONSTRAINT "django_content_type_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "django_content_type" ("id", "app_label", "model") VALUES
(1,	'kanban',	'boards'),
(2,	'kanban',	'cards'),
(3,	'kanban',	'teams'),
(4,	'kanban',	'users'),
(5,	'kanban',	'lists'),
(6,	'kanban',	'categories'),
(7,	'admin',	'logentry'),
(8,	'auth',	'permission'),
(9,	'auth',	'group'),
(10,	'auth',	'user'),
(11,	'contenttypes',	'contenttype'),
(12,	'sessions',	'session');

DROP TABLE IF EXISTS "django_migrations";
DROP SEQUENCE IF EXISTS django_migrations_id_seq;
CREATE SEQUENCE django_migrations_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

CREATE TABLE "public"."django_migrations" (
    "id" integer DEFAULT nextval('django_migrations_id_seq') NOT NULL,
    "app" character varying(255) NOT NULL,
    "name" character varying(255) NOT NULL,
    "applied" timestamptz NOT NULL,
    CONSTRAINT "django_migrations_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "django_migrations" ("id", "app", "name", "applied") VALUES
(1,	'contenttypes',	'0001_initial',	'2020-04-19 01:30:11.161558+00'),
(2,	'auth',	'0001_initial',	'2020-04-19 01:30:11.25638+00'),
(3,	'admin',	'0001_initial',	'2020-04-19 01:30:11.363499+00'),
(4,	'admin',	'0002_logentry_remove_auto_add',	'2020-04-19 01:30:11.404482+00'),
(5,	'admin',	'0003_logentry_add_action_flag_choices',	'2020-04-19 01:30:11.463022+00'),
(6,	'contenttypes',	'0002_remove_content_type_name',	'2020-04-19 01:30:11.519235+00'),
(7,	'auth',	'0002_alter_permission_name_max_length',	'2020-04-19 01:30:11.534386+00'),
(8,	'auth',	'0003_alter_user_email_max_length',	'2020-04-19 01:30:11.56371+00'),
(9,	'auth',	'0004_alter_user_username_opts',	'2020-04-19 01:30:11.585603+00'),
(10,	'auth',	'0005_alter_user_last_login_null',	'2020-04-19 01:30:11.625268+00'),
(11,	'auth',	'0006_require_contenttypes_0002',	'2020-04-19 01:30:11.636025+00'),
(12,	'auth',	'0007_alter_validators_add_error_messages',	'2020-04-19 01:30:11.674616+00'),
(13,	'auth',	'0008_alter_user_username_max_length',	'2020-04-19 01:30:11.709173+00'),
(14,	'auth',	'0009_alter_user_last_name_max_length',	'2020-04-19 01:30:11.732616+00'),
(15,	'auth',	'0010_alter_group_name_max_length',	'2020-04-19 01:30:11.761313+00'),
(16,	'auth',	'0011_update_proxy_permissions',	'2020-04-19 01:30:11.805149+00'),
(17,	'kanban',	'0001_initial',	'2020-04-19 01:30:11.84184+00'),
(18,	'kanban',	'0002_auto_20200405_1740',	'2020-04-19 01:30:11.97801+00'),
(19,	'sessions',	'0001_initial',	'2020-04-19 01:30:12.030164+00');

DROP TABLE IF EXISTS "django_session";
CREATE TABLE "public"."django_session" (
    "session_key" character varying(40) NOT NULL,
    "session_data" text NOT NULL,
    "expire_date" timestamptz NOT NULL,
    CONSTRAINT "django_session_pkey" PRIMARY KEY ("session_key")
) WITH (oids = false);

CREATE INDEX "django_session_expire_date_a5c62663" ON "public"."django_session" USING btree ("expire_date");

CREATE INDEX "django_session_session_key_c0390e0f_like" ON "public"."django_session" USING btree ("session_key");

INSERT INTO "django_session" ("session_key", "session_data", "expire_date") VALUES
('lfgsf2icsfeuk3tsrnfw8xave4e8boo4',	'ZTFjMDg1ODJkYzY3ODZhNzI2Y2Y1Njc3YmM4YTA3NjQyYjRlN2JmMTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmOTdmZDNhM2M1MWQ2MjZkYjU2MDdjOWZjNzM2NTJlMTNmOTdkMTJiIn0=',	'2020-05-03 17:54:16.342709+00');

DROP TABLE IF EXISTS "kanban_boards";
DROP SEQUENCE IF EXISTS kanban_boards_id_seq;
CREATE SEQUENCE kanban_boards_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

CREATE TABLE "public"."kanban_boards" (
    "id" integer DEFAULT nextval('kanban_boards_id_seq') NOT NULL,
    "b_name" character varying(40) NOT NULL,
    "b_description" character varying(500) NOT NULL,
    "b_topics" character varying(10) NOT NULL,
    "b_points" integer NOT NULL,
    "b_team_id" integer NOT NULL,
    CONSTRAINT "kanban_boards_pkey" PRIMARY KEY ("id"),
    CONSTRAINT "kanban_boards_b_team_id_b76ea797_fk_kanban_teams_id" FOREIGN KEY (b_team_id) REFERENCES kanban_teams(id) DEFERRABLE INITIALLY DEFERRED DEFERRABLE
) WITH (oids = false);

CREATE INDEX "kanban_boards_b_team_id_b76ea797" ON "public"."kanban_boards" USING btree ("b_team_id");

INSERT INTO "kanban_boards" ("id", "b_name", "b_description", "b_topics", "b_points", "b_team_id") VALUES
(1,	'Coronga',	'Vairus',	'yea',	10,	1);

DROP TABLE IF EXISTS "kanban_cards";
DROP SEQUENCE IF EXISTS kanban_cards_id_seq;
CREATE SEQUENCE kanban_cards_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

CREATE TABLE "public"."kanban_cards" (
    "id" integer DEFAULT nextval('kanban_cards_id_seq') NOT NULL,
    "c_name" character varying(40) NOT NULL,
    "c_description" character varying(500) NOT NULL,
    "c_topic" character varying(10) NOT NULL,
    "c_deadline" timestamptz NOT NULL,
    "c_complexity" integer NOT NULL,
    "c_assigned_id" integer NOT NULL,
    "c_list_id" integer NOT NULL,
    CONSTRAINT "kanban_cards_pkey" PRIMARY KEY ("id"),
    CONSTRAINT "kanban_cards_c_assigned_id_dd02cc6d_fk_kanban_users_id" FOREIGN KEY (c_assigned_id) REFERENCES kanban_users(id) DEFERRABLE INITIALLY DEFERRED DEFERRABLE,
    CONSTRAINT "kanban_cards_c_list_id_107ff981_fk_kanban_lists_id" FOREIGN KEY (c_list_id) REFERENCES kanban_lists(id) DEFERRABLE INITIALLY DEFERRED DEFERRABLE
) WITH (oids = false);

CREATE INDEX "kanban_cards_c_assigned_id_dd02cc6d" ON "public"."kanban_cards" USING btree ("c_assigned_id");

CREATE INDEX "kanban_cards_c_list_id_107ff981" ON "public"."kanban_cards" USING btree ("c_list_id");

INSERT INTO "kanban_cards" ("id", "c_name", "c_description", "c_topic", "c_deadline", "c_complexity", "c_assigned_id", "c_list_id") VALUES
(4,	'Teste',	'Apenas testando a funcionalidade dos cards',	'teste',	'2020-04-19 19:54:28.441048+00',	10,	1,	1),
(5,	'Teste 2',	'Apenas testando a funcionalidade dos cards',	'teste',	'2020-04-19 19:54:28.441048+00',	10,	1,	2);

DROP TABLE IF EXISTS "kanban_categories";
DROP SEQUENCE IF EXISTS kanban_categories_id_seq;
CREATE SEQUENCE kanban_categories_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

CREATE TABLE "public"."kanban_categories" (
    "id" integer DEFAULT nextval('kanban_categories_id_seq') NOT NULL,
    "cat_name" character varying(20) NOT NULL,
    "cat_board_id" integer NOT NULL,
    CONSTRAINT "kanban_categories_pkey" PRIMARY KEY ("id"),
    CONSTRAINT "kanban_categories_cat_board_id_8797c48e_fk_kanban_boards_id" FOREIGN KEY (cat_board_id) REFERENCES kanban_boards(id) DEFERRABLE INITIALLY DEFERRED DEFERRABLE
) WITH (oids = false);

CREATE INDEX "kanban_categories_cat_board_id_8797c48e" ON "public"."kanban_categories" USING btree ("cat_board_id");


DROP TABLE IF EXISTS "kanban_lists";
DROP SEQUENCE IF EXISTS kanban_lists_id_seq;
CREATE SEQUENCE kanban_lists_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

CREATE TABLE "public"."kanban_lists" (
    "id" integer DEFAULT nextval('kanban_lists_id_seq') NOT NULL,
    "list_name" character varying(30) NOT NULL,
    "list_position" integer NOT NULL,
    "list_board_id" integer NOT NULL,
    CONSTRAINT "kanban_lists_pkey" PRIMARY KEY ("id"),
    CONSTRAINT "kanban_lists_list_board_id_df5d1412_fk_kanban_boards_id" FOREIGN KEY (list_board_id) REFERENCES kanban_boards(id) DEFERRABLE INITIALLY DEFERRED DEFERRABLE
) WITH (oids = false);

CREATE INDEX "kanban_lists_list_board_id_df5d1412" ON "public"."kanban_lists" USING btree ("list_board_id");

INSERT INTO "kanban_lists" ("id", "list_name", "list_position", "list_board_id") VALUES
(1,	'Makin',	1,	1),
(2,	'Makin 2 ',	2,	1),
(3,	'makeng',	3,	1),
(4,	'yeaa',	4,	1);

DROP TABLE IF EXISTS "kanban_teams";
DROP SEQUENCE IF EXISTS kanban_teams_id_seq;
CREATE SEQUENCE kanban_teams_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

CREATE TABLE "public"."kanban_teams" (
    "id" integer DEFAULT nextval('kanban_teams_id_seq') NOT NULL,
    "t_name" character varying(100) NOT NULL,
    "t_company" character varying(100) NOT NULL,
    "t_details" character varying(400) NOT NULL,
    CONSTRAINT "kanban_teams_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "kanban_teams" ("id", "t_name", "t_company", "t_details") VALUES
(1,	'Sprinteam',	'Please, Understand',	'AIRONOUTFA IDOING');

DROP TABLE IF EXISTS "kanban_users";
DROP SEQUENCE IF EXISTS kanban_users_id_seq;
CREATE SEQUENCE kanban_users_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

CREATE TABLE "public"."kanban_users" (
    "id" integer DEFAULT nextval('kanban_users_id_seq') NOT NULL,
    "u_name" character varying(40) NOT NULL,
    "u_username" character varying(80) NOT NULL,
    "u_email" character varying(80) NOT NULL,
    "u_admin" integer NOT NULL,
    "u_team_id" integer NOT NULL,
    CONSTRAINT "kanban_users_pkey" PRIMARY KEY ("id"),
    CONSTRAINT "kanban_users_u_team_id_6360fb47_fk_kanban_teams_id" FOREIGN KEY (u_team_id) REFERENCES kanban_teams(id) DEFERRABLE INITIALLY DEFERRED DEFERRABLE
) WITH (oids = false);

CREATE INDEX "kanban_users_u_team_id_6360fb47" ON "public"."kanban_users" USING btree ("u_team_id");

INSERT INTO "kanban_users" ("id", "u_name", "u_username", "u_email", "u_admin", "u_team_id") VALUES
(1,	'Za boss',	'yoooo',	'no@no.com',	1,	1);

-- 2020-04-26 16:28:56.700854+00
