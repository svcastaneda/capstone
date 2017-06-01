--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.6
-- Dumped by pg_dump version 9.5.6

-- Started on 2017-04-28 10:54:38

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12355)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2152 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 181 (class 1259 OID 16394)
-- Name: account; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE account (
    id integer NOT NULL,
    user_type character varying(10) NOT NULL
);


ALTER TABLE account OWNER TO postgres;

--
-- TOC entry 185 (class 1259 OID 16472)
-- Name: coursedays; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE coursedays (
    daystype character varying(5) NOT NULL,
    daysid integer NOT NULL
);


ALTER TABLE coursedays OWNER TO postgres;

--
-- TOC entry 186 (class 1259 OID 16507)
-- Name: courselist; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE courselist (
    fall_availability character varying(10) NOT NULL,
    winter_availability character varying(10) NOT NULL,
    spring_availability character varying(10) NOT NULL,
    summer_1st_half_availability character varying(10) NOT NULL,
    summer_2nd_half_availability character varying(10) NOT NULL,
    summer_full_availability character varying(10) NOT NULL,
    phase character(1) NOT NULL,
    courseid character varying(6) NOT NULL,
    prerequisites character varying(100) NOT NULL,
    description character varying(100) NOT NULL,
    peoplesoft integer NOT NULL,
    fall_times integer NOT NULL,
    winter_times integer NOT NULL,
    spring_times integer NOT NULL,
    summer_1st_half_times integer NOT NULL,
    fall_days integer NOT NULL,
    winter_days integer NOT NULL,
    spring_days integer NOT NULL,
    summer_1st_half_days integer NOT NULL,
    summer_2nd_half_times integer NOT NULL,
    summer_full_times integer NOT NULL,
    summer_2nd_half_days integer NOT NULL,
    summer_full_days integer NOT NULL
);


ALTER TABLE courselist OWNER TO postgres;

--
-- TOC entry 183 (class 1259 OID 16414)
-- Name: coursetimes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE coursetimes (
    timesid integer NOT NULL,
    timetypes integer NOT NULL
);


ALTER TABLE coursetimes OWNER TO postgres;

--
-- TOC entry 184 (class 1259 OID 16419)
-- Name: employee; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE employee (
    first_name character varying(20) NOT NULL,
    last_name character varying(20) NOT NULL,
    email_address character varying(30) NOT NULL,
    employeetype character varying(10) NOT NULL,
    employeeid integer NOT NULL
);


ALTER TABLE employee OWNER TO postgres;

--
-- TOC entry 182 (class 1259 OID 16404)
-- Name: student; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE student (
    first_name character varying(20) NOT NULL,
    last_name character varying(20) NOT NULL,
    email_address character varying(30) NOT NULL,
    graduation_year integer NOT NULL,
    degree_major character varying(2) NOT NULL,
    phone_number integer NOT NULL,
    bachelors_origin character varying(100) NOT NULL,
    student_type character varying(10) NOT NULL,
    last_path integer NOT NULL,
    student_id integer NOT NULL
);


ALTER TABLE student OWNER TO postgres;

--
-- TOC entry 2139 (class 0 OID 16394)
-- Dependencies: 181
-- Data for Name: account; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY account (id, user_type) FROM stdin;
\.


--
-- TOC entry 2143 (class 0 OID 16472)
-- Dependencies: 185
-- Data for Name: coursedays; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY coursedays (daystype, daysid) FROM stdin;
\.


--
-- TOC entry 2144 (class 0 OID 16507)
-- Dependencies: 186
-- Data for Name: courselist; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY courselist (fall_availability, winter_availability, spring_availability, summer_1st_half_availability, summer_2nd_half_availability, summer_full_availability, phase, courseid, prerequisites, description, peoplesoft, fall_times, winter_times, spring_times, summer_1st_half_times, fall_days, winter_days, spring_days, summer_1st_half_days, summer_2nd_half_times, summer_full_times, summer_2nd_half_days, summer_full_days) FROM stdin;
\.


--
-- TOC entry 2141 (class 0 OID 16414)
-- Dependencies: 183
-- Data for Name: coursetimes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY coursetimes (timesid, timetypes) FROM stdin;
\.


--
-- TOC entry 2142 (class 0 OID 16419)
-- Dependencies: 184
-- Data for Name: employee; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY employee (first_name, last_name, email_address, employeetype, employeeid) FROM stdin;
\.


--
-- TOC entry 2140 (class 0 OID 16404)
-- Dependencies: 182
-- Data for Name: student; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY student (first_name, last_name, email_address, graduation_year, degree_major, phone_number, bachelors_origin, student_type, last_path, student_id) FROM stdin;
\.


--
-- TOC entry 2010 (class 2606 OID 16511)
-- Name: courseid; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY courselist
    ADD CONSTRAINT courseid PRIMARY KEY (courseid);


--
-- TOC entry 2008 (class 2606 OID 16476)
-- Name: daysid; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY coursedays
    ADD CONSTRAINT daysid PRIMARY KEY (daysid);


--
-- TOC entry 2006 (class 2606 OID 16423)
-- Name: empoloyeeid; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY employee
    ADD CONSTRAINT empoloyeeid PRIMARY KEY (employeeid);


--
-- TOC entry 2000 (class 2606 OID 16398)
-- Name: id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY account
    ADD CONSTRAINT id PRIMARY KEY (id);


--
-- TOC entry 2002 (class 2606 OID 16408)
-- Name: student_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY student
    ADD CONSTRAINT student_id PRIMARY KEY (student_id);


--
-- TOC entry 2004 (class 2606 OID 16418)
-- Name: timesid; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY coursetimes
    ADD CONSTRAINT timesid PRIMARY KEY (timesid);


--
-- TOC entry 2017 (class 2606 OID 16532)
-- Name: courselist_fall_days_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY courselist
    ADD CONSTRAINT courselist_fall_days_fkey FOREIGN KEY (fall_days) REFERENCES coursedays(daysid);


--
-- TOC entry 2013 (class 2606 OID 16512)
-- Name: courselist_fall_times_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY courselist
    ADD CONSTRAINT courselist_fall_times_fkey FOREIGN KEY (fall_times) REFERENCES coursetimes(timesid);


--
-- TOC entry 2019 (class 2606 OID 16542)
-- Name: courselist_spring_days_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY courselist
    ADD CONSTRAINT courselist_spring_days_fkey FOREIGN KEY (spring_days) REFERENCES coursedays(daysid);


--
-- TOC entry 2015 (class 2606 OID 16522)
-- Name: courselist_spring_times_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY courselist
    ADD CONSTRAINT courselist_spring_times_fkey FOREIGN KEY (spring_times) REFERENCES coursetimes(timesid);


--
-- TOC entry 2020 (class 2606 OID 16547)
-- Name: courselist_summer_1st_half_days_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY courselist
    ADD CONSTRAINT courselist_summer_1st_half_days_fkey FOREIGN KEY (summer_1st_half_days) REFERENCES coursedays(daysid);


--
-- TOC entry 2016 (class 2606 OID 16527)
-- Name: courselist_summer_1st_half_times_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY courselist
    ADD CONSTRAINT courselist_summer_1st_half_times_fkey FOREIGN KEY (summer_1st_half_times) REFERENCES coursetimes(timesid);


--
-- TOC entry 2023 (class 2606 OID 16562)
-- Name: courselist_summer_2nd_half_days_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY courselist
    ADD CONSTRAINT courselist_summer_2nd_half_days_fkey FOREIGN KEY (summer_2nd_half_days) REFERENCES coursedays(daysid);


--
-- TOC entry 2021 (class 2606 OID 16552)
-- Name: courselist_summer_2nd_half_times_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY courselist
    ADD CONSTRAINT courselist_summer_2nd_half_times_fkey FOREIGN KEY (summer_2nd_half_times) REFERENCES coursetimes(timesid);


--
-- TOC entry 2024 (class 2606 OID 16567)
-- Name: courselist_summer_full_days_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY courselist
    ADD CONSTRAINT courselist_summer_full_days_fkey FOREIGN KEY (summer_full_days) REFERENCES coursedays(daysid);


--
-- TOC entry 2022 (class 2606 OID 16557)
-- Name: courselist_summer_full_times_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY courselist
    ADD CONSTRAINT courselist_summer_full_times_fkey FOREIGN KEY (summer_full_times) REFERENCES coursetimes(timesid);


--
-- TOC entry 2018 (class 2606 OID 16537)
-- Name: courselist_winter_days_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY courselist
    ADD CONSTRAINT courselist_winter_days_fkey FOREIGN KEY (winter_days) REFERENCES coursedays(daysid);


--
-- TOC entry 2014 (class 2606 OID 16517)
-- Name: courselist_winter_times_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY courselist
    ADD CONSTRAINT courselist_winter_times_fkey FOREIGN KEY (winter_times) REFERENCES coursetimes(timesid);


--
-- TOC entry 2012 (class 2606 OID 16424)
-- Name: employee_employeeid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY employee
    ADD CONSTRAINT employee_employeeid_fkey FOREIGN KEY (employeeid) REFERENCES account(id);


--
-- TOC entry 2011 (class 2606 OID 16409)
-- Name: student_student_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY student
    ADD CONSTRAINT student_student_id_fkey FOREIGN KEY (student_id) REFERENCES account(id);


--
-- TOC entry 2151 (class 0 OID 0)
-- Dependencies: 6
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2017-04-28 10:54:38

--
-- PostgreSQL database dump complete
--

