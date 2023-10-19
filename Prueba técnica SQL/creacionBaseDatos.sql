-- Crear la base de datos
CREATE DATABASE AmberCorporation;

-- Usar la base de datos
USE AmberCorporation;

-- Crear la tabla Company
CREATE TABLE Company (
    company_code VARCHAR(10) PRIMARY KEY,
    founder VARCHAR(255)
);

-- Insertar datos en la tabla Company
INSERT INTO Company (company_code, founder)
VALUES
    ('C1', 'Monica'),
    ('C2', 'Samantha');

-- Crear la tabla Lead_Manager
CREATE TABLE Lead_Manager (
    lead_manager_code VARCHAR(10) PRIMARY KEY,
    company_code VARCHAR(10),
    FOREIGN KEY (company_code) REFERENCES Company(company_code)
);

-- Insertar datos en la tabla Lead_Manager
INSERT INTO Lead_Manager (lead_manager_code, company_code)
VALUES
    ('LM1', 'C1'),
    ('LM2', 'C2');

-- Crear la tabla Senior_Manager
CREATE TABLE Senior_Manager (
    senior_manager_code VARCHAR(10) PRIMARY KEY,
    lead_manager_code VARCHAR(10),
    company_code VARCHAR(10),
    FOREIGN KEY (lead_manager_code) REFERENCES Lead_Manager(lead_manager_code),
    FOREIGN KEY (company_code) REFERENCES Company(company_code)
);

-- Insertar datos en la tabla Senior_Manager
INSERT INTO Senior_Manager (senior_manager_code, lead_manager_code, company_code)
VALUES
    ('SM1', 'LM1', 'C1'),
    ('SM2', 'LM1', 'C1'),
    ('SM3', 'LM2', 'C2');

-- Crear la tabla Manager
CREATE TABLE Manager (
    manager_code VARCHAR(10) PRIMARY KEY,
    senior_manager_code VARCHAR(10),
    lead_manager_code VARCHAR(10),
    company_code VARCHAR(10),
    FOREIGN KEY (senior_manager_code) REFERENCES Senior_Manager(senior_manager_code),
    FOREIGN KEY (lead_manager_code) REFERENCES Lead_Manager(lead_manager_code),
    FOREIGN KEY (company_code) REFERENCES Company(company_code)
);

-- Insertar datos en la tabla Manager
INSERT INTO Manager (manager_code, senior_manager_code, lead_manager_code, company_code)
VALUES
    ('M1', 'SM1', 'LM1', 'C1'),
    ('M2', 'SM3', 'LM2', 'C2'),
    ('M3', 'SM3', 'LM2', 'C2');

-- Crear la tabla Employee
CREATE TABLE Employee (
    employee_code VARCHAR(10) PRIMARY KEY,
    manager_code VARCHAR(10),
    senior_manager_code VARCHAR(10),
    lead_manager_code VARCHAR(10),
    company_code VARCHAR(10),
    FOREIGN KEY (manager_code) REFERENCES Manager(manager_code),
    FOREIGN KEY (senior_manager_code) REFERENCES Senior_Manager(senior_manager_code),
    FOREIGN KEY (lead_manager_code) REFERENCES Lead_Manager(lead_manager_code),
    FOREIGN KEY (company_code) REFERENCES Company(company_code)
);

-- Insertar datos en la tabla Employee
INSERT INTO Employee (employee_code, manager_code, senior_manager_code, lead_manager_code, company_code)
VALUES
    ('E1', 'M1', 'SM1', 'LM1', 'C1'),
    ('E2', 'M1', 'SM1', 'LM1', 'C1'),
    ('E3', 'M2', 'SM3', 'LM2', 'C2'),
    ('E4', 'M3', 'SM3', 'LM2', 'C2');