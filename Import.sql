INSERT INTO "kanban_teams" ("id", "t_name", "t_company", "t_details") VALUES
(1,	'Sprinteam',	'Please, Understand',	'AIRONOUTFA IDOING');

INSERT INTO "kanban_users" ("id", "u_name", "u_username", "u_email", "u_admin", "u_team_id") VALUES
(1,	'Za boss',	'yoooo',	'no@no.com',	1,	1);

INSERT INTO "kanban_boards" ("id", "b_name", "b_description", "b_topics", "b_points", "b_team_id") VALUES
(1,	'Coronga',	'Vairus',	'yea',	10,	1);

INSERT INTO "kanban_lists" ("id", "list_name", "list_position", "list_board_id") VALUES
(1,	'Makin',	1,	1),
(2,	'Makin 2 ',	2,	1),
(3,	'makeng',	3,	1),
(4,	'yeaa',	4,	1);

INSERT INTO "kanban_cards" ("id", "c_name", "c_description", "c_topic", "c_deadline", "c_complexity", "c_assigned_id", "c_list_id") VALUES
(4,	'Teste',	'Apenas testando a funcionalidade dos cards',	'teste',	'2020-04-19 19:54:28.441048+00',	10,	1,	1),
(5,	'Teste 2',	'Apenas testando a funcionalidade dos cards',	'teste',	'2020-04-19 19:54:28.441048+00',	10,	1,	2);
