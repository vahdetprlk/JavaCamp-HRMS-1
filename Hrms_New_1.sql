--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2
-- Dumped by pg_dump version 13.2

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: email_verifications; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.email_verifications (
    id integer NOT NULL,
    user_id integer NOT NULL,
    is_verified boolean NOT NULL
);


ALTER TABLE public.email_verifications OWNER TO postgres;

--
-- Name: EmailVerifications_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.email_verifications ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."EmailVerifications_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: job_positions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.job_positions (
    id integer NOT NULL,
    position_name character varying NOT NULL
);


ALTER TABLE public.job_positions OWNER TO postgres;

--
-- Name: JobPositions_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.job_positions ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."JobPositions_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: system_employee_validations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.system_employee_validations (
    id integer NOT NULL,
    employer_id integer NOT NULL,
    system_employee_id integer NOT NULL,
    is_valid boolean NOT NULL
);


ALTER TABLE public.system_employee_validations OWNER TO postgres;

--
-- Name: SystemEmployeeValidations_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.system_employee_validations ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."SystemEmployeeValidations_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    email character varying(50) NOT NULL,
    password character varying(32) NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: Users_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.users ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Users_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: employers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employers (
    id integer NOT NULL,
    company_name character varying(50) NOT NULL,
    web_site character varying(50) NOT NULL,
    phone_number character(10) NOT NULL
);


ALTER TABLE public.employers OWNER TO postgres;

--
-- Name: job_seekers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.job_seekers (
    user_id integer NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    date_of_birth date NOT NULL,
    national_id character(11) NOT NULL
);


ALTER TABLE public.job_seekers OWNER TO postgres;

--
-- Name: system_employees; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.system_employees (
    user_id integer NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL
);


ALTER TABLE public.system_employees OWNER TO postgres;

--
-- Data for Name: email_verifications; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: employers; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: job_positions; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: job_seekers; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: system_employee_validations; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: system_employees; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: EmailVerifications_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."EmailVerifications_Id_seq"', 1, false);


--
-- Name: JobPositions_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."JobPositions_Id_seq"', 1, false);


--
-- Name: SystemEmployeeValidations_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SystemEmployeeValidations_Id_seq"', 1, false);


--
-- Name: Users_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Users_Id_seq"', 1, false);


--
-- Name: email_verifications EmailVerifications_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.email_verifications
    ADD CONSTRAINT "EmailVerifications_pkey" PRIMARY KEY (id);


--
-- Name: employers Employers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employers
    ADD CONSTRAINT "Employers_pkey" PRIMARY KEY (id);


--
-- Name: job_positions JobPositions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_positions
    ADD CONSTRAINT "JobPositions_pkey" PRIMARY KEY (id);


--
-- Name: job_seekers JobSeekers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_seekers
    ADD CONSTRAINT "JobSeekers_pkey" PRIMARY KEY (user_id);


--
-- Name: system_employee_validations SystemEmployeeValidations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.system_employee_validations
    ADD CONSTRAINT "SystemEmployeeValidations_pkey" PRIMARY KEY (id);


--
-- Name: system_employees SystemEmployees_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.system_employees
    ADD CONSTRAINT "SystemEmployees_pkey" PRIMARY KEY (user_id);


--
-- Name: users Users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT "Users_pkey" PRIMARY KEY (id);


--
-- Name: job_positions uk_job_positions_position_name; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_positions
    ADD CONSTRAINT uk_job_positions_position_name UNIQUE (position_name);


--
-- Name: job_seekers uk_job_seeker_national_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_seekers
    ADD CONSTRAINT uk_job_seeker_national_id UNIQUE (national_id);


--
-- Name: users uk_users_email; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT uk_users_email UNIQUE (email);


--
-- Name: email_verifications EmailVerifications_UserId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.email_verifications
    ADD CONSTRAINT "EmailVerifications_UserId_fkey" FOREIGN KEY (user_id) REFERENCES public.job_seekers(user_id) NOT VALID;


--
-- Name: email_verifications EmailVerifications_UserId_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.email_verifications
    ADD CONSTRAINT "EmailVerifications_UserId_fkey1" FOREIGN KEY (user_id) REFERENCES public.employers(id) NOT VALID;


--
-- Name: employers Employers_UserId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employers
    ADD CONSTRAINT "Employers_UserId_fkey" FOREIGN KEY (id) REFERENCES public.users(id) NOT VALID;


--
-- Name: job_seekers JobSeekers_UserId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_seekers
    ADD CONSTRAINT "JobSeekers_UserId_fkey" FOREIGN KEY (user_id) REFERENCES public.users(id) NOT VALID;


--
-- Name: system_employee_validations SystemEmployeeValidations_EmployerId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.system_employee_validations
    ADD CONSTRAINT "SystemEmployeeValidations_EmployerId_fkey" FOREIGN KEY (employer_id) REFERENCES public.employers(id) NOT VALID;


--
-- Name: system_employee_validations SystemEmployeeValidations_SystemEmployeeId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.system_employee_validations
    ADD CONSTRAINT "SystemEmployeeValidations_SystemEmployeeId_fkey" FOREIGN KEY (system_employee_id) REFERENCES public.system_employees(user_id) NOT VALID;


--
-- Name: system_employees SystemEmployees_UserId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.system_employees
    ADD CONSTRAINT "SystemEmployees_UserId_fkey" FOREIGN KEY (user_id) REFERENCES public.users(id) NOT VALID;


--
-- PostgreSQL database dump complete
--

