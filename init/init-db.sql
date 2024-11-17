--
-- PostgreSQL database dump
--

-- Dumped from database version 14.13 (Ubuntu 14.13-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.13 (Ubuntu 14.13-0ubuntu0.22.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: accounts_customuser; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.accounts_customuser (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined, role) VALUES (2, 'pbkdf2_sha256$870000$QIX2ueZQcTCC8ZrzQcfrZg$wAGkAYI/FxVjWonjKBAYSuAPeGC8XK+iee7N1GpimTk=', NULL, false, 'user', 'Test', 'User', '', false, true, '2024-10-22 20:42:57.002974+03', 'user');
INSERT INTO public.accounts_customuser (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined, role) VALUES (3, 'pbkdf2_sha256$870000$fXskqUx32JgHalqwUXmZ7f$HVXt6EbD+7SOQ1gtfC2YJmETokRXswGdliymOsTZ7GA=', NULL, true, 'admi', '', 'G7k#lZ8wQ', '', true, true, '2024-10-26 03:46:14+03', 'admin');
INSERT INTO public.accounts_customuser (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined, role) VALUES (1, 'pbkdf2_sha256$870000$DVe4OPg2dids3oXLRQKJKG$LTlnK+Xc5sfCUuuDUHV67oLIevZfP78w5nmmg4ctigg=', '2024-10-22 20:33:42+03', true, 'admin', '', '', '', true, true, '2024-10-22 20:32:36+03', 'admin');


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.auth_group (id, name) VALUES (2, 'admin');
INSERT INTO public.auth_group (id, name) VALUES (3, 'users');


--
-- Data for Name: accounts_customuser_groups; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.accounts_customuser_groups (id, customuser_id, group_id) VALUES (1, 3, 2);
INSERT INTO public.accounts_customuser_groups (id, customuser_id, group_id) VALUES (2, 1, 2);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.django_content_type (id, app_label, model) VALUES (1, 'auth', 'permission');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (2, 'auth', 'group');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (3, 'contenttypes', 'contenttype');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (4, 'accounts', 'customuser');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (5, 'admin', 'logentry');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (6, 'sessions', 'session');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (7, 'fishing', 'captain');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (8, 'fishing', 'fisherman');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (9, 'fishing', 'ship');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (10, 'fishing', 'fish');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (11, 'fishing', 'fishcatch');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (12, 'fishing', 'fishingreport');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (13, 'fishing', 'weathercondition');


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (1, 'Can add permission', 1, 'add_permission');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (2, 'Can change permission', 1, 'change_permission');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (3, 'Can delete permission', 1, 'delete_permission');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (4, 'Can view permission', 1, 'view_permission');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (5, 'Can add group', 2, 'add_group');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (6, 'Can change group', 2, 'change_group');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (7, 'Can delete group', 2, 'delete_group');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (8, 'Can view group', 2, 'view_group');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (9, 'Can add content type', 3, 'add_contenttype');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (10, 'Can change content type', 3, 'change_contenttype');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (11, 'Can delete content type', 3, 'delete_contenttype');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (12, 'Can view content type', 3, 'view_contenttype');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (13, 'Can add user', 4, 'add_customuser');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (14, 'Can change user', 4, 'change_customuser');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (15, 'Can delete user', 4, 'delete_customuser');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (16, 'Can view user', 4, 'view_customuser');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (17, 'Can add log entry', 5, 'add_logentry');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (18, 'Can change log entry', 5, 'change_logentry');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (19, 'Can delete log entry', 5, 'delete_logentry');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (20, 'Can view log entry', 5, 'view_logentry');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (21, 'Can add session', 6, 'add_session');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (22, 'Can change session', 6, 'change_session');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (23, 'Can delete session', 6, 'delete_session');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (24, 'Can view session', 6, 'view_session');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (25, 'Can add captain', 7, 'add_captain');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (26, 'Can change captain', 7, 'change_captain');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (27, 'Can delete captain', 7, 'delete_captain');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (28, 'Can view captain', 7, 'view_captain');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (29, 'Can add fisherman', 8, 'add_fisherman');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (30, 'Can change fisherman', 8, 'change_fisherman');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (31, 'Can delete fisherman', 8, 'delete_fisherman');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (32, 'Can view fisherman', 8, 'view_fisherman');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (33, 'Can add ship', 9, 'add_ship');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (34, 'Can change ship', 9, 'change_ship');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (35, 'Can delete ship', 9, 'delete_ship');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (36, 'Can view ship', 9, 'view_ship');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (37, 'Can add fish', 10, 'add_fish');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (38, 'Can change fish', 10, 'change_fish');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (39, 'Can delete fish', 10, 'delete_fish');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (40, 'Can view fish', 10, 'view_fish');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (41, 'Can add fish catch', 11, 'add_fishcatch');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (42, 'Can change fish catch', 11, 'change_fishcatch');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (43, 'Can delete fish catch', 11, 'delete_fishcatch');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (44, 'Can view fish catch', 11, 'view_fishcatch');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (45, 'Can add fishing report', 12, 'add_fishingreport');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (46, 'Can change fishing report', 12, 'change_fishingreport');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (47, 'Can delete fishing report', 12, 'delete_fishingreport');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (48, 'Can view fishing report', 12, 'view_fishingreport');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (49, 'Can add weather condition', 13, 'add_weathercondition');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (50, 'Can change weather condition', 13, 'change_weathercondition');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (51, 'Can delete weather condition', 13, 'delete_weathercondition');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (52, 'Can view weather condition', 13, 'view_weathercondition');


--
-- Data for Name: accounts_customuser_user_permissions; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.accounts_customuser_user_permissions (id, customuser_id, permission_id) VALUES (1, 3, 1);
INSERT INTO public.accounts_customuser_user_permissions (id, customuser_id, permission_id) VALUES (2, 3, 2);
INSERT INTO public.accounts_customuser_user_permissions (id, customuser_id, permission_id) VALUES (3, 3, 3);
INSERT INTO public.accounts_customuser_user_permissions (id, customuser_id, permission_id) VALUES (4, 3, 4);
INSERT INTO public.accounts_customuser_user_permissions (id, customuser_id, permission_id) VALUES (5, 3, 5);
INSERT INTO public.accounts_customuser_user_permissions (id, customuser_id, permission_id) VALUES (6, 3, 6);
INSERT INTO public.accounts_customuser_user_permissions (id, customuser_id, permission_id) VALUES (7, 3, 7);
INSERT INTO public.accounts_customuser_user_permissions (id, customuser_id, permission_id) VALUES (8, 3, 8);
INSERT INTO public.accounts_customuser_user_permissions (id, customuser_id, permission_id) VALUES (9, 3, 9);
INSERT INTO public.accounts_customuser_user_permissions (id, customuser_id, permission_id) VALUES (10, 3, 10);
INSERT INTO public.accounts_customuser_user_permissions (id, customuser_id, permission_id) VALUES (11, 3, 11);
INSERT INTO public.accounts_customuser_user_permissions (id, customuser_id, permission_id) VALUES (12, 3, 12);
INSERT INTO public.accounts_customuser_user_permissions (id, customuser_id, permission_id) VALUES (13, 3, 13);
INSERT INTO public.accounts_customuser_user_permissions (id, customuser_id, permission_id) VALUES (14, 3, 14);
INSERT INTO public.accounts_customuser_user_permissions (id, customuser_id, permission_id) VALUES (15, 3, 15);
INSERT INTO public.accounts_customuser_user_permissions (id, customuser_id, permission_id) VALUES (16, 3, 16);
INSERT INTO public.accounts_customuser_user_permissions (id, customuser_id, permission_id) VALUES (17, 3, 17);
INSERT INTO public.accounts_customuser_user_permissions (id, customuser_id, permission_id) VALUES (18, 3, 18);
INSERT INTO public.accounts_customuser_user_permissions (id, customuser_id, permission_id) VALUES (19, 3, 19);
INSERT INTO public.accounts_customuser_user_permissions (id, customuser_id, permission_id) VALUES (20, 3, 20);
INSERT INTO public.accounts_customuser_user_permissions (id, customuser_id, permission_id) VALUES (21, 3, 21);
INSERT INTO public.accounts_customuser_user_permissions (id, customuser_id, permission_id) VALUES (22, 3, 22);
INSERT INTO public.accounts_customuser_user_permissions (id, customuser_id, permission_id) VALUES (23, 3, 23);
INSERT INTO public.accounts_customuser_user_permissions (id, customuser_id, permission_id) VALUES (24, 3, 24);
INSERT INTO public.accounts_customuser_user_permissions (id, customuser_id, permission_id) VALUES (25, 3, 25);
INSERT INTO public.accounts_customuser_user_permissions (id, customuser_id, permission_id) VALUES (26, 3, 26);
INSERT INTO public.accounts_customuser_user_permissions (id, customuser_id, permission_id) VALUES (27, 3, 27);
INSERT INTO public.accounts_customuser_user_permissions (id, customuser_id, permission_id) VALUES (28, 3, 28);
INSERT INTO public.accounts_customuser_user_permissions (id, customuser_id, permission_id) VALUES (29, 3, 29);
INSERT INTO public.accounts_customuser_user_permissions (id, customuser_id, permission_id) VALUES (30, 3, 30);
INSERT INTO public.accounts_customuser_user_permissions (id, customuser_id, permission_id) VALUES (31, 3, 31);
INSERT INTO public.accounts_customuser_user_permissions (id, customuser_id, permission_id) VALUES (32, 3, 32);
INSERT INTO public.accounts_customuser_user_permissions (id, customuser_id, permission_id) VALUES (33, 3, 33);
INSERT INTO public.accounts_customuser_user_permissions (id, customuser_id, permission_id) VALUES (34, 3, 34);
INSERT INTO public.accounts_customuser_user_permissions (id, customuser_id, permission_id) VALUES (35, 3, 35);
INSERT INTO public.accounts_customuser_user_permissions (id, customuser_id, permission_id) VALUES (36, 3, 36);
INSERT INTO public.accounts_customuser_user_permissions (id, customuser_id, permission_id) VALUES (37, 3, 37);
INSERT INTO public.accounts_customuser_user_permissions (id, customuser_id, permission_id) VALUES (38, 3, 38);
INSERT INTO public.accounts_customuser_user_permissions (id, customuser_id, permission_id) VALUES (39, 3, 39);
INSERT INTO public.accounts_customuser_user_permissions (id, customuser_id, permission_id) VALUES (40, 3, 40);
INSERT INTO public.accounts_customuser_user_permissions (id, customuser_id, permission_id) VALUES (41, 3, 41);
INSERT INTO public.accounts_customuser_user_permissions (id, customuser_id, permission_id) VALUES (42, 3, 42);
INSERT INTO public.accounts_customuser_user_permissions (id, customuser_id, permission_id) VALUES (43, 3, 43);
INSERT INTO public.accounts_customuser_user_permissions (id, customuser_id, permission_id) VALUES (44, 3, 44);
INSERT INTO public.accounts_customuser_user_permissions (id, customuser_id, permission_id) VALUES (45, 3, 45);
INSERT INTO public.accounts_customuser_user_permissions (id, customuser_id, permission_id) VALUES (46, 3, 46);
INSERT INTO public.accounts_customuser_user_permissions (id, customuser_id, permission_id) VALUES (47, 3, 47);
INSERT INTO public.accounts_customuser_user_permissions (id, customuser_id, permission_id) VALUES (48, 3, 48);
INSERT INTO public.accounts_customuser_user_permissions (id, customuser_id, permission_id) VALUES (49, 3, 49);
INSERT INTO public.accounts_customuser_user_permissions (id, customuser_id, permission_id) VALUES (50, 3, 50);
INSERT INTO public.accounts_customuser_user_permissions (id, customuser_id, permission_id) VALUES (51, 3, 51);
INSERT INTO public.accounts_customuser_user_permissions (id, customuser_id, permission_id) VALUES (52, 3, 52);
INSERT INTO public.accounts_customuser_user_permissions (id, customuser_id, permission_id) VALUES (53, 1, 1);
INSERT INTO public.accounts_customuser_user_permissions (id, customuser_id, permission_id) VALUES (54, 1, 2);
INSERT INTO public.accounts_customuser_user_permissions (id, customuser_id, permission_id) VALUES (55, 1, 3);
INSERT INTO public.accounts_customuser_user_permissions (id, customuser_id, permission_id) VALUES (56, 1, 4);
INSERT INTO public.accounts_customuser_user_permissions (id, customuser_id, permission_id) VALUES (57, 1, 5);
INSERT INTO public.accounts_customuser_user_permissions (id, customuser_id, permission_id) VALUES (58, 1, 6);
INSERT INTO public.accounts_customuser_user_permissions (id, customuser_id, permission_id) VALUES (59, 1, 7);
INSERT INTO public.accounts_customuser_user_permissions (id, customuser_id, permission_id) VALUES (60, 1, 8);
INSERT INTO public.accounts_customuser_user_permissions (id, customuser_id, permission_id) VALUES (61, 1, 9);
INSERT INTO public.accounts_customuser_user_permissions (id, customuser_id, permission_id) VALUES (62, 1, 10);
INSERT INTO public.accounts_customuser_user_permissions (id, customuser_id, permission_id) VALUES (63, 1, 11);
INSERT INTO public.accounts_customuser_user_permissions (id, customuser_id, permission_id) VALUES (64, 1, 12);
INSERT INTO public.accounts_customuser_user_permissions (id, customuser_id, permission_id) VALUES (65, 1, 13);
INSERT INTO public.accounts_customuser_user_permissions (id, customuser_id, permission_id) VALUES (66, 1, 14);
INSERT INTO public.accounts_customuser_user_permissions (id, customuser_id, permission_id) VALUES (67, 1, 15);
INSERT INTO public.accounts_customuser_user_permissions (id, customuser_id, permission_id) VALUES (68, 1, 16);
INSERT INTO public.accounts_customuser_user_permissions (id, customuser_id, permission_id) VALUES (69, 1, 17);
INSERT INTO public.accounts_customuser_user_permissions (id, customuser_id, permission_id) VALUES (70, 1, 18);
INSERT INTO public.accounts_customuser_user_permissions (id, customuser_id, permission_id) VALUES (71, 1, 19);
INSERT INTO public.accounts_customuser_user_permissions (id, customuser_id, permission_id) VALUES (72, 1, 20);
INSERT INTO public.accounts_customuser_user_permissions (id, customuser_id, permission_id) VALUES (73, 1, 21);
INSERT INTO public.accounts_customuser_user_permissions (id, customuser_id, permission_id) VALUES (74, 1, 22);
INSERT INTO public.accounts_customuser_user_permissions (id, customuser_id, permission_id) VALUES (75, 1, 23);
INSERT INTO public.accounts_customuser_user_permissions (id, customuser_id, permission_id) VALUES (76, 1, 24);
INSERT INTO public.accounts_customuser_user_permissions (id, customuser_id, permission_id) VALUES (77, 1, 25);
INSERT INTO public.accounts_customuser_user_permissions (id, customuser_id, permission_id) VALUES (78, 1, 26);
INSERT INTO public.accounts_customuser_user_permissions (id, customuser_id, permission_id) VALUES (79, 1, 27);
INSERT INTO public.accounts_customuser_user_permissions (id, customuser_id, permission_id) VALUES (80, 1, 28);
INSERT INTO public.accounts_customuser_user_permissions (id, customuser_id, permission_id) VALUES (81, 1, 29);
INSERT INTO public.accounts_customuser_user_permissions (id, customuser_id, permission_id) VALUES (82, 1, 30);
INSERT INTO public.accounts_customuser_user_permissions (id, customuser_id, permission_id) VALUES (83, 1, 31);
INSERT INTO public.accounts_customuser_user_permissions (id, customuser_id, permission_id) VALUES (84, 1, 32);
INSERT INTO public.accounts_customuser_user_permissions (id, customuser_id, permission_id) VALUES (85, 1, 33);
INSERT INTO public.accounts_customuser_user_permissions (id, customuser_id, permission_id) VALUES (86, 1, 34);
INSERT INTO public.accounts_customuser_user_permissions (id, customuser_id, permission_id) VALUES (87, 1, 35);
INSERT INTO public.accounts_customuser_user_permissions (id, customuser_id, permission_id) VALUES (88, 1, 36);
INSERT INTO public.accounts_customuser_user_permissions (id, customuser_id, permission_id) VALUES (89, 1, 37);
INSERT INTO public.accounts_customuser_user_permissions (id, customuser_id, permission_id) VALUES (90, 1, 38);
INSERT INTO public.accounts_customuser_user_permissions (id, customuser_id, permission_id) VALUES (91, 1, 39);
INSERT INTO public.accounts_customuser_user_permissions (id, customuser_id, permission_id) VALUES (92, 1, 40);
INSERT INTO public.accounts_customuser_user_permissions (id, customuser_id, permission_id) VALUES (93, 1, 41);
INSERT INTO public.accounts_customuser_user_permissions (id, customuser_id, permission_id) VALUES (94, 1, 42);
INSERT INTO public.accounts_customuser_user_permissions (id, customuser_id, permission_id) VALUES (95, 1, 43);
INSERT INTO public.accounts_customuser_user_permissions (id, customuser_id, permission_id) VALUES (96, 1, 44);
INSERT INTO public.accounts_customuser_user_permissions (id, customuser_id, permission_id) VALUES (97, 1, 45);
INSERT INTO public.accounts_customuser_user_permissions (id, customuser_id, permission_id) VALUES (98, 1, 46);
INSERT INTO public.accounts_customuser_user_permissions (id, customuser_id, permission_id) VALUES (99, 1, 47);
INSERT INTO public.accounts_customuser_user_permissions (id, customuser_id, permission_id) VALUES (100, 1, 48);
INSERT INTO public.accounts_customuser_user_permissions (id, customuser_id, permission_id) VALUES (101, 1, 49);
INSERT INTO public.accounts_customuser_user_permissions (id, customuser_id, permission_id) VALUES (102, 1, 50);
INSERT INTO public.accounts_customuser_user_permissions (id, customuser_id, permission_id) VALUES (103, 1, 51);
INSERT INTO public.accounts_customuser_user_permissions (id, customuser_id, permission_id) VALUES (104, 1, 52);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.auth_group_permissions (id, group_id, permission_id) VALUES (1, 2, 1);
INSERT INTO public.auth_group_permissions (id, group_id, permission_id) VALUES (2, 2, 2);
INSERT INTO public.auth_group_permissions (id, group_id, permission_id) VALUES (3, 2, 3);
INSERT INTO public.auth_group_permissions (id, group_id, permission_id) VALUES (4, 2, 4);
INSERT INTO public.auth_group_permissions (id, group_id, permission_id) VALUES (5, 2, 5);
INSERT INTO public.auth_group_permissions (id, group_id, permission_id) VALUES (6, 2, 6);
INSERT INTO public.auth_group_permissions (id, group_id, permission_id) VALUES (7, 2, 7);
INSERT INTO public.auth_group_permissions (id, group_id, permission_id) VALUES (8, 2, 8);
INSERT INTO public.auth_group_permissions (id, group_id, permission_id) VALUES (9, 2, 9);
INSERT INTO public.auth_group_permissions (id, group_id, permission_id) VALUES (10, 2, 10);
INSERT INTO public.auth_group_permissions (id, group_id, permission_id) VALUES (11, 2, 11);
INSERT INTO public.auth_group_permissions (id, group_id, permission_id) VALUES (12, 2, 12);
INSERT INTO public.auth_group_permissions (id, group_id, permission_id) VALUES (13, 2, 13);
INSERT INTO public.auth_group_permissions (id, group_id, permission_id) VALUES (14, 2, 14);
INSERT INTO public.auth_group_permissions (id, group_id, permission_id) VALUES (15, 2, 15);
INSERT INTO public.auth_group_permissions (id, group_id, permission_id) VALUES (16, 2, 16);
INSERT INTO public.auth_group_permissions (id, group_id, permission_id) VALUES (17, 2, 17);
INSERT INTO public.auth_group_permissions (id, group_id, permission_id) VALUES (18, 2, 18);
INSERT INTO public.auth_group_permissions (id, group_id, permission_id) VALUES (19, 2, 19);
INSERT INTO public.auth_group_permissions (id, group_id, permission_id) VALUES (20, 2, 20);
INSERT INTO public.auth_group_permissions (id, group_id, permission_id) VALUES (21, 2, 21);
INSERT INTO public.auth_group_permissions (id, group_id, permission_id) VALUES (22, 2, 22);
INSERT INTO public.auth_group_permissions (id, group_id, permission_id) VALUES (23, 2, 23);
INSERT INTO public.auth_group_permissions (id, group_id, permission_id) VALUES (24, 2, 24);
INSERT INTO public.auth_group_permissions (id, group_id, permission_id) VALUES (25, 2, 25);
INSERT INTO public.auth_group_permissions (id, group_id, permission_id) VALUES (26, 2, 26);
INSERT INTO public.auth_group_permissions (id, group_id, permission_id) VALUES (27, 2, 27);
INSERT INTO public.auth_group_permissions (id, group_id, permission_id) VALUES (28, 2, 28);
INSERT INTO public.auth_group_permissions (id, group_id, permission_id) VALUES (29, 2, 29);
INSERT INTO public.auth_group_permissions (id, group_id, permission_id) VALUES (30, 2, 30);
INSERT INTO public.auth_group_permissions (id, group_id, permission_id) VALUES (31, 2, 31);
INSERT INTO public.auth_group_permissions (id, group_id, permission_id) VALUES (32, 2, 32);
INSERT INTO public.auth_group_permissions (id, group_id, permission_id) VALUES (33, 2, 33);
INSERT INTO public.auth_group_permissions (id, group_id, permission_id) VALUES (34, 2, 34);
INSERT INTO public.auth_group_permissions (id, group_id, permission_id) VALUES (35, 2, 35);
INSERT INTO public.auth_group_permissions (id, group_id, permission_id) VALUES (36, 2, 36);
INSERT INTO public.auth_group_permissions (id, group_id, permission_id) VALUES (37, 2, 37);
INSERT INTO public.auth_group_permissions (id, group_id, permission_id) VALUES (38, 2, 38);
INSERT INTO public.auth_group_permissions (id, group_id, permission_id) VALUES (39, 2, 39);
INSERT INTO public.auth_group_permissions (id, group_id, permission_id) VALUES (40, 2, 40);
INSERT INTO public.auth_group_permissions (id, group_id, permission_id) VALUES (41, 2, 41);
INSERT INTO public.auth_group_permissions (id, group_id, permission_id) VALUES (42, 2, 42);
INSERT INTO public.auth_group_permissions (id, group_id, permission_id) VALUES (43, 2, 43);
INSERT INTO public.auth_group_permissions (id, group_id, permission_id) VALUES (44, 2, 44);
INSERT INTO public.auth_group_permissions (id, group_id, permission_id) VALUES (45, 2, 45);
INSERT INTO public.auth_group_permissions (id, group_id, permission_id) VALUES (46, 2, 46);
INSERT INTO public.auth_group_permissions (id, group_id, permission_id) VALUES (47, 2, 47);
INSERT INTO public.auth_group_permissions (id, group_id, permission_id) VALUES (48, 2, 48);
INSERT INTO public.auth_group_permissions (id, group_id, permission_id) VALUES (49, 2, 49);
INSERT INTO public.auth_group_permissions (id, group_id, permission_id) VALUES (50, 2, 50);
INSERT INTO public.auth_group_permissions (id, group_id, permission_id) VALUES (51, 2, 51);
INSERT INTO public.auth_group_permissions (id, group_id, permission_id) VALUES (52, 2, 52);


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (1, '2024-10-22 20:34:53.797106+03', '1', 'users', 1, '[{"added": {}}]', 2, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (2, '2024-10-22 20:40:02.022836+03', '1', 'users', 3, '', 2, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (3, '2024-10-25 18:37:41.920949+03', '4', 'user user user', 3, '', 8, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (4, '2024-10-25 18:37:41.920977+03', '3', 'user user user', 3, '', 8, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (5, '2024-10-25 18:37:41.920991+03', '2', '', 3, '', 8, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (6, '2024-10-25 18:37:41.921002+03', '1', '', 3, '', 8, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (7, '2024-10-25 18:38:33.616218+03', '1', 'ship', 1, '[{"added": {}}]', 9, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (8, '2024-10-25 18:49:55.683592+03', '1', 'cap cap cap', 1, '[{"added": {}}]', 7, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (9, '2024-10-25 18:50:40.87999+03', '1', 'Report of cap cap cap on ship (2024-10-02 - 2024-10-25)', 1, '[{"added": {}}]', 12, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (10, '2024-10-25 18:55:37.107071+03', '1', 'fish', 1, '[{"added": {}}]', 10, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (11, '2024-10-25 18:55:46.309588+03', '1', 'Report of cap cap cap on ship (2024-10-02 - 2024-10-25)', 2, '[{"added": {"name": "fish catch", "object": "fish: 100.0 kg"}}]', 12, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (12, '2024-10-25 18:55:51.622064+03', '1', 'Report of cap cap cap on ship (2024-10-02 - 2024-10-25)', 2, '[]', 12, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (13, '2024-10-25 19:05:33.860213+03', '6', 'user user user', 3, '', 8, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (14, '2024-10-25 19:05:33.860245+03', '5', 'user user user', 3, '', 8, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (15, '2024-10-25 19:13:36.68607+03', '9', 'just', 3, '', 8, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (16, '2024-10-25 19:13:36.686098+03', '8', 'a', 3, '', 8, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (17, '2024-10-25 19:13:36.686112+03', '7', 'user user user', 3, '', 8, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (18, '2024-10-25 19:15:09.242444+03', '10', 'just', 3, '', 8, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (19, '2024-10-25 19:15:16.916217+03', '11', 'egor egor egor', 1, '[{"added": {}}]', 8, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (20, '2024-10-25 19:42:04.902352+03', '1', 'Report of cap cap cap on ship (2024-10-02 - 2024-10-25)', 3, '', 12, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (21, '2024-10-25 20:46:03.464154+03', '2', 'fish2', 1, '[{"added": {}}]', 10, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (22, '2024-10-25 21:31:43.43072+03', '1', 'Good', 1, '[{"added": {}}]', 13, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (23, '2024-10-25 21:31:46.871054+03', '2', 'Bad', 1, '[{"added": {}}]', 13, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (24, '2024-10-25 21:37:02.664134+03', '2', 'Report of cap cap cap on ship (2024-10-01 - 2024-10-25)', 1, '[{"added": {}}, {"added": {"name": "fish catch", "object": "fish: 1.0 kg"}}]', 12, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (25, '2024-10-25 21:39:10.818785+03', '2', 'Report of cap cap cap on ship (2024-10-01 - 2024-10-25)', 3, '', 12, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (26, '2024-10-25 21:51:06.833981+03', '4', 'Report of cap cap cap on ship (2024-10-03 - 2025-10-15)', 3, '', 12, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (27, '2024-10-25 21:51:06.834012+03', '3', 'Report of cap cap cap on ship (2024-10-02 - 2024-10-10)', 3, '', 12, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (28, '2024-10-25 23:00:37.40195+03', '2', 'cap2 2 2', 1, '[{"added": {}}]', 7, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (29, '2024-10-25 23:00:43.673279+03', '2', 'ship 2', 1, '[{"added": {}}]', 9, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (30, '2024-10-25 23:49:16.925142+03', '14', 'asd', 3, '', 8, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (31, '2024-10-25 23:49:16.925172+03', '13', '3 3 3', 3, '', 8, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (32, '2024-10-25 23:49:28.361134+03', '5', 'Report of cap cap cap on ship (2024-10-02 - 2024-10-10)', 3, '', 12, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (33, '2024-10-26 00:25:47.006818+03', '11', 'Report of cap cap cap on ship (2024-10-02 - 2024-10-17)', 3, '', 12, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (34, '2024-10-26 00:25:47.006848+03', '10', 'Report of cap cap cap on ship (2024-10-09 - 2024-10-24)', 3, '', 12, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (35, '2024-10-26 00:53:37.565932+03', '16', 'Report of cap cap cap on ship (2024-10-01 - 2024-10-23)', 3, '', 12, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (36, '2024-10-26 00:53:37.565963+03', '15', 'Report of cap cap cap on ship (2024-10-10 - 2024-10-25)', 3, '', 12, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (37, '2024-10-26 00:53:37.565981+03', '14', 'Report of cap cap cap on ship 2 (2024-10-10 - 2024-10-17)', 3, '', 12, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (38, '2024-10-26 00:53:37.565996+03', '13', 'Report of cap cap cap on 1 (2024-10-01 - 2024-10-09)', 3, '', 12, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (39, '2024-10-26 00:53:37.56601+03', '12', 'Report of cap cap cap on ship (2024-10-09 - 2024-10-17)', 3, '', 12, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (40, '2024-10-26 01:11:17.949647+03', '22', 'Report of cap cap cap on ship 2 (2024-10-09 - 2024-10-02)', 3, '', 12, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (41, '2024-10-26 01:11:17.949679+03', '21', 'Report of cap cap cap on ship 2 (2024-10-02 - 2024-10-09)', 3, '', 12, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (42, '2024-10-26 01:11:17.949696+03', '20', 'Report of cap cap cap on ship 2 (2024-10-01 - 2024-10-16)', 3, '', 12, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (43, '2024-10-26 01:11:17.94971+03', '19', 'Report of cap cap cap on ship (2024-10-02 - 2024-10-24)', 3, '', 12, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (44, '2024-10-26 01:11:17.949723+03', '18', 'Report of cap cap cap on ship (2024-10-01 - 2024-10-09)', 3, '', 12, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (45, '2024-10-26 01:11:17.949736+03', '17', 'Report of cap2 2 2 on ship (2024-10-10 - 2024-10-30)', 3, '', 12, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (46, '2024-10-26 01:12:20.57756+03', '23', 'Report of cap cap cap on ship (2024-10-25 - 2024-10-26)', 2, '[{"added": {"name": "fish catch", "object": "fish: 1.0 kg"}}]', 12, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (47, '2024-10-26 01:12:55.968935+03', '23', 'Report of cap cap cap on ship (2024-10-25 - 2024-10-26)', 3, '', 12, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (48, '2024-10-26 01:15:56.938691+03', '25', 'Report of cap cap cap on ship (2024-10-02 - 2024-10-09)', 3, '', 12, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (49, '2024-10-26 01:15:56.93872+03', '24', 'Report of cap cap cap on ship 2 (2024-10-17 - 2024-10-09)', 3, '', 12, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (50, '2024-10-26 01:37:22.430765+03', '34', 'Report of cap cap cap on ship (2024-10-02 - 2024-10-17)', 3, '', 12, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (51, '2024-10-26 01:37:22.430795+03', '33', 'Report of cap cap cap on ship (2024-10-08 - 2024-10-09)', 3, '', 12, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (52, '2024-10-26 01:37:22.430812+03', '32', 'Report of cap cap cap on ship (2024-10-02 - 2024-10-17)', 3, '', 12, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (53, '2024-10-26 01:37:22.430825+03', '31', 'Report of cap cap cap on ship (2024-10-02 - 2024-10-09)', 3, '', 12, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (54, '2024-10-26 01:37:22.430838+03', '30', 'Report of cap cap cap on ship 2 (2024-10-01 - 2024-10-08)', 3, '', 12, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (55, '2024-10-26 01:37:22.43085+03', '29', 'Report of cap cap cap on ship 2 (2024-10-02 - 2024-10-17)', 3, '', 12, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (56, '2024-10-26 01:37:22.430862+03', '28', 'Report of cap cap cap on ship (2024-10-01 - 2024-10-17)', 3, '', 12, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (57, '2024-10-26 01:37:22.430874+03', '27', 'Report of cap cap cap on ship (2024-10-08 - 2024-10-16)', 3, '', 12, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (58, '2024-10-26 01:37:22.430885+03', '26', 'Report of cap cap cap on ship (2024-10-01 - 2024-10-16)', 3, '', 12, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (59, '2024-10-26 01:50:45.254054+03', '48', 'Report of cap cap cap on ship (2024-10-09 - 2024-10-23)', 3, '', 12, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (60, '2024-10-26 01:50:45.254084+03', '47', 'Report of cap cap cap on ship (2024-10-02 - 2024-10-09)', 3, '', 12, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (61, '2024-10-26 01:50:45.2541+03', '46', 'Report of cap cap cap on ship (2024-10-17 - 2024-10-23)', 3, '', 12, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (62, '2024-10-26 01:50:45.254114+03', '45', 'Report of cap cap cap on ship (2024-10-15 - 2024-10-30)', 3, '', 12, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (63, '2024-10-26 01:50:45.254126+03', '44', 'Report of cap cap cap on ship (2024-10-09 - 2024-10-25)', 3, '', 12, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (64, '2024-10-26 01:50:45.254138+03', '43', 'Report of cap cap cap on ship (2024-10-23 - 2024-10-24)', 3, '', 12, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (65, '2024-10-26 01:50:45.254149+03', '42', 'Report of cap cap cap on ship (2024-10-02 - 2024-10-15)', 3, '', 12, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (66, '2024-10-26 01:50:45.254161+03', '41', 'Report of cap cap cap on ship (2024-10-23 - 2024-10-31)', 3, '', 12, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (67, '2024-10-26 01:50:45.254172+03', '40', 'Report of cap cap cap on ship (2024-10-09 - 2024-10-23)', 3, '', 12, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (68, '2024-10-26 01:50:45.254194+03', '39', 'Report of cap cap cap on ship (2024-10-01 - 2024-10-08)', 3, '', 12, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (69, '2024-10-26 01:50:45.254219+03', '38', 'Report of cap cap cap on ship (2024-10-16 - 2024-10-08)', 3, '', 12, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (70, '2024-10-26 01:50:45.254243+03', '37', 'Report of cap cap cap on ship (2024-10-09 - 2024-10-16)', 3, '', 12, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (71, '2024-10-26 01:50:45.254257+03', '36', 'Report of cap cap cap on ship (2024-10-09 - 2024-10-24)', 3, '', 12, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (72, '2024-10-26 01:50:45.254273+03', '35', 'Report of cap cap cap on ship (2024-10-01 - 2024-10-09)', 3, '', 12, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (73, '2024-10-26 01:52:51.554252+03', '51', 'Report of cap cap cap on ship (2024-10-08 - 2024-10-23)', 3, '', 12, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (74, '2024-10-26 01:52:51.554281+03', '50', 'Report of cap cap cap on ship (2024-10-01 - 2024-10-09)', 3, '', 12, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (75, '2024-10-26 01:52:51.554297+03', '49', 'Report of cap cap cap on ship 2 (2024-10-02 - 2024-10-09)', 3, '', 12, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (76, '2024-10-26 01:56:05.213593+03', '54', 'Report of cap cap cap on ship (2024-10-16 - 2024-10-24)', 3, '', 12, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (77, '2024-10-26 01:56:05.213628+03', '53', 'Report of cap cap cap on ship (2024-10-02 - 2024-10-17)', 3, '', 12, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (78, '2024-10-26 01:56:05.213644+03', '52', 'Report of cap cap cap on ship (2024-10-02 - 2024-10-23)', 3, '', 12, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (79, '2024-10-26 01:58:26.167841+03', '56', 'Report of cap cap cap on ship (2024-10-09 - 2024-10-24)', 3, '', 12, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (80, '2024-10-26 01:58:26.16787+03', '55', 'Report of cap cap cap on 1 (2024-10-31 - 2024-10-23)', 3, '', 12, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (81, '2024-10-26 01:58:56.408212+03', '57', 'Report of cap2 2 2 on ship 2 (2024-10-25 - 2024-10-25)', 1, '[{"added": {}}, {"added": {"name": "fish catch", "object": "fish: 2.0 kg"}}]', 12, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (82, '2024-10-26 02:02:56.904003+03', '57', 'Report of cap2 2 2 on ship 2 (2024-10-25 - 2024-10-25)', 3, '', 12, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (83, '2024-10-26 02:32:12.405515+03', '61', 'Report of cap cap cap on ship (2024-10-02 - 2024-10-23)', 3, '', 12, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (84, '2024-10-26 02:32:12.405547+03', '60', 'Report of cap cap cap on ship (2024-10-02 - 2024-10-23)', 3, '', 12, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (85, '2024-10-26 02:32:12.405565+03', '59', 'Report of cap cap cap on ship (2024-10-02 - 2024-10-23)', 3, '', 12, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (86, '2024-10-26 02:32:12.405579+03', '58', 'Report of cap cap cap on ship (2024-10-16 - 2024-10-23)', 3, '', 12, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (87, '2024-10-26 03:00:48.303235+03', '65', 'Report of cap cap cap on ship (2024-10-09 - 2024-10-10)', 3, '', 12, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (88, '2024-10-26 03:00:48.303264+03', '64', 'Report of cap cap cap on ship (2024-10-09 - 2024-10-10)', 3, '', 12, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (89, '2024-10-26 03:00:48.303281+03', '63', 'Report of cap cap cap on ship (2024-10-09 - 2024-10-10)', 3, '', 12, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (90, '2024-10-26 03:00:48.303297+03', '62', 'Report of cap cap cap on ship (2024-10-09 - 2024-10-10)', 3, '', 12, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (91, '2024-10-26 03:21:39.576305+03', '70', 'Report of cap cap cap on ship (2024-10-09 - 2024-10-09)', 3, '', 12, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (92, '2024-10-26 03:21:39.576338+03', '69', 'Report of cap cap cap on ship (2024-10-09 - 2024-10-09)', 3, '', 12, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (93, '2024-10-26 03:21:39.576355+03', '68', 'Report of cap cap cap on ship (2024-10-09 - 2024-10-09)', 3, '', 12, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (94, '2024-10-26 03:21:39.576371+03', '67', 'Report of cap cap cap on ship (2024-10-09 - 2024-10-09)', 3, '', 12, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (95, '2024-10-26 03:21:39.576384+03', '66', 'Report of cap cap cap on ship (2024-10-02 - 2024-10-24)', 3, '', 12, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (96, '2024-10-26 03:24:02.129928+03', '74', 'Report of cap cap cap on ship (2024-10-09 - 2024-10-09)', 3, '', 12, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (97, '2024-10-26 03:24:02.129958+03', '73', 'Report of cap cap cap on ship (2024-10-09 - 2024-10-09)', 3, '', 12, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (98, '2024-10-26 03:24:02.129974+03', '72', 'Report of cap cap cap on ship (2024-10-09 - 2024-10-09)', 3, '', 12, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (99, '2024-10-26 03:24:02.129988+03', '71', 'Report of cap cap cap on ship (2024-10-09 - 2024-10-09)', 3, '', 12, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (100, '2024-10-26 03:29:06.118179+03', '75', 'Report of cap cap cap on ship (2024-10-09 - 2024-10-09)', 3, '', 12, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (101, '2024-10-26 03:29:28.091254+03', '76', 'Report of cap cap cap on ship (2024-10-16 - 2024-10-08)', 2, '[{"changed": {"name": "fish catch", "object": "fish: 2000.0 kg", "fields": ["Weight"]}}]', 12, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (102, '2024-10-26 03:43:47.967565+03', '1', 'admin', 2, '[{"changed": {"fields": ["Role"]}}]', 4, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (103, '2024-10-26 03:44:27.117855+03', '1', 'admin', 2, '[]', 4, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (104, '2024-10-26 03:46:15.1158+03', '3', 'admi', 1, '[{"added": {}}]', 4, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (105, '2024-10-26 03:46:29.41382+03', '3', 'admi', 2, '[{"changed": {"fields": ["Last name", "Role"]}}]', 4, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (106, '2024-10-26 03:46:51.921781+03', '3', 'admi', 2, '[{"changed": {"fields": ["Staff status", "Superuser status", "User permissions"]}}]', 4, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (107, '2024-10-26 03:46:59.311719+03', '1', 'admin', 2, '[{"changed": {"fields": ["User permissions"]}}]', 4, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (108, '2024-10-26 03:47:39.610915+03', '2', 'admin', 1, '[{"added": {}}]', 2, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (109, '2024-10-26 03:47:46.383995+03', '3', 'users', 1, '[{"added": {}}]', 2, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (110, '2024-10-26 03:47:55.750454+03', '3', 'admi', 2, '[{"changed": {"fields": ["Groups"]}}]', 4, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (111, '2024-10-26 03:48:00.716999+03', '1', 'admin', 2, '[{"changed": {"fields": ["Groups"]}}]', 4, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (112, '2024-10-26 04:46:57.217896+03', '81', 'Report of 2 on ship (2024-10-01 - 2024-10-23)', 3, '', 12, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (113, '2024-10-26 04:46:57.217928+03', '80', 'Report of cap2 2 2 on ship (2024-10-09 - 2024-10-17)', 3, '', 12, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (114, '2024-10-26 04:46:57.217946+03', '79', 'Report of cap2 2 2 on ship (2024-10-09 - 2024-10-17)', 3, '', 12, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (115, '2024-10-26 04:46:57.21796+03', '78', 'Report of cap2 2 2 on ship (2024-10-09 - 2024-10-17)', 3, '', 12, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (116, '2024-10-26 04:46:57.217973+03', '77', 'Report of cap2 2 2 on ship (2024-10-09 - 2024-10-17)', 3, '', 12, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (117, '2024-10-26 04:46:57.217985+03', '76', 'Report of cap cap cap on ship (2024-10-16 - 2024-10-08)', 3, '', 12, 1);


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.django_migrations (id, app, name, applied) VALUES (1, 'contenttypes', '0001_initial', '2024-10-22 20:21:35.633682+03');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (2, 'contenttypes', '0002_remove_content_type_name', '2024-10-22 20:22:19.619645+03');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (3, 'auth', '0001_initial', '2024-10-22 20:22:19.644001+03');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (4, 'auth', '0002_alter_permission_name_max_length', '2024-10-22 20:22:19.647672+03');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (5, 'auth', '0003_alter_user_email_max_length', '2024-10-22 20:22:19.651098+03');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (6, 'auth', '0004_alter_user_username_opts', '2024-10-22 20:22:19.65454+03');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (7, 'auth', '0005_alter_user_last_login_null', '2024-10-22 20:22:19.657807+03');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (8, 'auth', '0006_require_contenttypes_0002', '2024-10-22 20:22:19.658842+03');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (9, 'auth', '0007_alter_validators_add_error_messages', '2024-10-22 20:22:19.662022+03');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (10, 'auth', '0008_alter_user_username_max_length', '2024-10-22 20:22:19.665324+03');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (11, 'auth', '0009_alter_user_last_name_max_length', '2024-10-22 20:22:19.668682+03');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (12, 'auth', '0010_alter_group_name_max_length', '2024-10-22 20:22:19.672295+03');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (13, 'auth', '0011_update_proxy_permissions', '2024-10-22 20:22:19.676202+03');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (14, 'auth', '0012_alter_user_first_name_max_length', '2024-10-22 20:22:19.679378+03');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (15, 'accounts', '0001_initial', '2024-10-22 20:22:19.700252+03');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (16, 'admin', '0001_initial', '2024-10-22 20:22:25.810082+03');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (17, 'admin', '0002_logentry_remove_auto_add', '2024-10-22 20:22:25.814624+03');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (18, 'admin', '0003_logentry_add_action_flag_choices', '2024-10-22 20:22:25.819156+03');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (19, 'sessions', '0001_initial', '2024-10-22 20:22:25.828535+03');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (20, 'fishing', '0001_initial', '2024-10-22 21:28:11.087062+03');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (21, 'fishing', '0002_remove_fisherman_first_name_and_more', '2024-10-25 18:29:23.98612+03');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (22, 'fishing', '0003_remove_captain_first_name_remove_captain_last_name_and_more', '2024-10-25 18:49:39.534338+03');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (23, 'fishing', '0004_remove_fishingreport_total_weight', '2024-10-25 18:55:13.23425+03');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (24, 'fishing', '0005_weathercondition', '2024-10-25 21:06:54.885164+03');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (25, 'fishing', '0006_alter_fishingreport_weather_conditions', '2024-10-25 21:27:41.896043+03');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (26, 'fishing', '0007_remove_fishingreport_fish_catches_and_more', '2024-10-26 02:59:35.591978+03');


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.django_session (session_key, session_data, expire_date) VALUES ('uv47c9h940rbm5j8q24nxchuynsiavb4', '.eJxVjDkOwjAUBe_iGlm2vFPScwbrLzYOIEeKkwpxd4iUAto3M-8lMmxry9soS55YnIUWp98NgR6l74Dv0G-zpLmvy4RyV-RBh7zOXJ6Xw_07aDDatzasKjICUyQfqmWtAnBwzhAaDR6rpZIwUSDjEWJRwSUTvUpWaaOseH8AFR04Kg:1t3IlK:uUUjqDVaa_I4zF098SmZ0ws7yGUqBJiZ1xaVJ8t8lx0', '2024-11-05 20:33:42.199964+03');


--
-- Data for Name: fishing_captain; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.fishing_captain (id, full_name) VALUES (1, 'cap cap cap');
INSERT INTO public.fishing_captain (id, full_name) VALUES (2, 'cap2 2 2');
INSERT INTO public.fishing_captain (id, full_name) VALUES (3, '2');


--
-- Data for Name: fishing_fish; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.fishing_fish (id, name) VALUES (1, 'fish');
INSERT INTO public.fishing_fish (id, name) VALUES (2, 'fish2');
INSERT INTO public.fishing_fish (id, name) VALUES (4, 'pizza');


--
-- Data for Name: fishing_ship; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.fishing_ship (id, name) VALUES (2, 'ship 2');
INSERT INTO public.fishing_ship (id, name) VALUES (3, '1');
INSERT INTO public.fishing_ship (id, name) VALUES (5, 'tank');
INSERT INTO public.fishing_ship (id, name) VALUES (1, 'ship99');


--
-- Data for Name: fishing_weathercondition; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.fishing_weathercondition (id, name) VALUES (1, 'Good');
INSERT INTO public.fishing_weathercondition (id, name) VALUES (2, 'Bad');
INSERT INTO public.fishing_weathercondition (id, name) VALUES (3, 'rain');


--
-- Data for Name: fishing_fishingreport; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.fishing_fishingreport (id, weather_conditions_id, start_date, end_date, captain_id, ship_id) VALUES (83, 1, '2024-10-02', '2024-10-10', 1, 1);
INSERT INTO public.fishing_fishingreport (id, weather_conditions_id, start_date, end_date, captain_id, ship_id) VALUES (85, 1, '2024-09-30', '2024-10-15', 2, 2);


--
-- Data for Name: fishing_fishcatch; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.fishing_fishcatch (id, weight, fish_id, fishing_report_id) VALUES (34, 2, 1, 83);
INSERT INTO public.fishing_fishcatch (id, weight, fish_id, fishing_report_id) VALUES (35, 12, 2, 83);
INSERT INTO public.fishing_fishcatch (id, weight, fish_id, fishing_report_id) VALUES (36, 99, 4, 85);
INSERT INTO public.fishing_fishcatch (id, weight, fish_id, fishing_report_id) VALUES (37, 1, 1, 85);


--
-- Data for Name: fishing_fisherman; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.fishing_fisherman (id, full_name) VALUES (11, 'egor egor egor');
INSERT INTO public.fishing_fisherman (id, full_name) VALUES (12, 'fio fio fio');
INSERT INTO public.fishing_fisherman (id, full_name) VALUES (15, '111');


--
-- Data for Name: fishing_fishingreport_fishermen; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.fishing_fishingreport_fishermen (id, fishingreport_id, fisherman_id) VALUES (90, 83, 12);
INSERT INTO public.fishing_fishingreport_fishermen (id, fishingreport_id, fisherman_id) VALUES (93, 85, 11);
INSERT INTO public.fishing_fishingreport_fishermen (id, fishingreport_id, fisherman_id) VALUES (94, 85, 12);
INSERT INTO public.fishing_fishingreport_fishermen (id, fishingreport_id, fisherman_id) VALUES (95, 85, 15);


--
-- Name: accounts_customuser_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.accounts_customuser_groups_id_seq', 2, true);


--
-- Name: accounts_customuser_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.accounts_customuser_id_seq', 3, true);


--
-- Name: accounts_customuser_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.accounts_customuser_user_permissions_id_seq', 104, true);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 3, true);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 52, true);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 52, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 117, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 13, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 26, true);


--
-- Name: fishing_captain_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.fishing_captain_id_seq', 3, true);


--
-- Name: fishing_fish_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.fishing_fish_id_seq', 4, true);


--
-- Name: fishing_fishcatch_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.fishing_fishcatch_id_seq', 37, true);


--
-- Name: fishing_fisherman_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.fishing_fisherman_id_seq', 16, true);


--
-- Name: fishing_fishingreport_fishermen_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.fishing_fishingreport_fishermen_id_seq', 95, true);


--
-- Name: fishing_fishingreport_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.fishing_fishingreport_id_seq', 85, true);


--
-- Name: fishing_ship_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.fishing_ship_id_seq', 5, true);


--
-- Name: fishing_weathercondition_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.fishing_weathercondition_id_seq', 3, true);


--
-- PostgreSQL database dump complete
--

