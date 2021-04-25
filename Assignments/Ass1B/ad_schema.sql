-- Generated by Oracle SQL Developer Data Modeler 20.4.0.374.0801
--   at:        2021-04-26 01:16:02 EET
--   site:      Oracle Database 11g
--   type:      Oracle Database 11g


set echo on
spool ad_schema_output.txt

DROP TABLE clinic CASCADE CONSTRAINTS;

DROP TABLE clinic_vets CASCADE CONSTRAINTS;

DROP TABLE drug CASCADE CONSTRAINTS;

DROP TABLE invoice CASCADE CONSTRAINTS;

DROP TABLE invoice_drugs CASCADE CONSTRAINTS;

DROP TABLE invoice_services CASCADE CONSTRAINTS;

DROP TABLE owner CASCADE CONSTRAINTS;

DROP TABLE pet CASCADE CONSTRAINTS;

DROP TABLE pet_type CASCADE CONSTRAINTS;

DROP TABLE prescription CASCADE CONSTRAINTS;

DROP TABLE service CASCADE CONSTRAINTS;

DROP TABLE vet CASCADE CONSTRAINTS;

DROP TABLE vet_specialisations CASCADE CONSTRAINTS;

DROP TABLE visit CASCADE CONSTRAINTS;

DROP TABLE visit_visits CASCADE CONSTRAINTS;

-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE clinic (
    clinic_id       NUMBER(7) NOT NULL,
    clinic_name     VARCHAR2(50) NOT NULL,
    clinic_address  VARCHAR2(50) NOT NULL,
    clinic_no       CHAR(10)
);

COMMENT ON COLUMN clinic.clinic_id IS
    'clinic id';

COMMENT ON COLUMN clinic.clinic_name IS
    'clinic name';

COMMENT ON COLUMN clinic.clinic_address IS
    'clinic address';

COMMENT ON COLUMN clinic.clinic_no IS
    'clinic phone number';

ALTER TABLE clinic ADD CONSTRAINT clinic_pk PRIMARY KEY ( clinic_id );

CREATE TABLE clinic_vets (
    clinic_id  NUMBER(7) NOT NULL,
    vet_id     NUMBER(7) NOT NULL
);

ALTER TABLE clinic_vets ADD CONSTRAINT clinic_vets_pk PRIMARY KEY ( clinic_id,
                                                                    vet_id );

CREATE TABLE drug (
    drug_id            NUMBER(7) NOT NULL,
    drug_name          VARCHAR2(50) NOT NULL,
    drug_instructions  VARCHAR2(50) NOT NULL,
    drug_qty_supplied  NUMBER(7) NOT NULL,
    drug_cost          NUMBER(7, 2) NOT NULL
);

COMMENT ON COLUMN drug.drug_name IS
    'drug name';

COMMENT ON COLUMN drug.drug_instructions IS
    'drug instructions';

COMMENT ON COLUMN drug.drug_qty_supplied IS
    'drug_quantity supplied';

COMMENT ON COLUMN drug.drug_cost IS
    'drug cost';

ALTER TABLE drug ADD CONSTRAINT drug_pk PRIMARY KEY ( drug_id );

CREATE TABLE invoice (
    pet_id                  NUMBER(7) NOT NULL,
    vet_id                  NUMBER(7) NOT NULL,
    invoice_serv_time       VARCHAR2(5) NOT NULL,
    invoice_serv_date       DATE NOT NULL,
    invoice_amount_due      NUMBER(10, 2) NOT NULL,
    invoice_payment_method  VARCHAR2(15) NOT NULL
);

COMMENT ON COLUMN invoice.pet_id IS
    'pet id';

COMMENT ON COLUMN invoice.vet_id IS
    'vet id';

COMMENT ON COLUMN invoice.invoice_serv_time IS
    'invoice_service time';

COMMENT ON COLUMN invoice.invoice_serv_date IS
    'invoice_service date';

COMMENT ON COLUMN invoice.invoice_amount_due IS
    'invoice_amount due';

COMMENT ON COLUMN invoice.invoice_payment_method IS
    'invoice_payment method';

ALTER TABLE invoice
    ADD CONSTRAINT invoice_pk PRIMARY KEY ( pet_id,
                                            vet_id,
                                            invoice_serv_time,
                                            invoice_serv_date );

CREATE TABLE invoice_drugs (
    pet_id             NUMBER(7) NOT NULL,
    vet_id             NUMBER(7) NOT NULL,
    invoice_serv_time  VARCHAR2(5) NOT NULL,
    invoice_serv_date  DATE NOT NULL,
    drug_id            NUMBER(7) NOT NULL
);

ALTER TABLE invoice_drugs
    ADD CONSTRAINT invoice_drugs_pk PRIMARY KEY ( pet_id,
                                                  vet_id,
                                                  invoice_serv_time,
                                                  invoice_serv_date,
                                                  drug_id );

CREATE TABLE invoice_services (
    pet_id             NUMBER(7) NOT NULL,
    vet_id             NUMBER(7) NOT NULL,
    invoice_serv_time  VARCHAR2(5) NOT NULL,
    invoice_serv_date  DATE NOT NULL,
    serv_code          VARCHAR2(10) NOT NULL
);

ALTER TABLE invoice_services
    ADD CONSTRAINT invoice_services_pk PRIMARY KEY ( pet_id,
                                                     vet_id,
                                                     invoice_serv_time,
                                                     invoice_serv_date,
                                                     serv_code );

CREATE TABLE owner (
    owner_id          NUMBER(7) NOT NULL,
    owner_gname       VARCHAR2(50) NOT NULL,
    owner_fname       VARCHAR2(50) NOT NULL,
    owner_prefvet_id  NUMBER(7) NOT NULL,
    owner_address     VARCHAR2(50) NOT NULL,
    owner_no          CHAR(10)
);

COMMENT ON COLUMN owner.owner_id IS
    'owner id';

COMMENT ON COLUMN owner.owner_gname IS
    'owner given name';

COMMENT ON COLUMN owner.owner_fname IS
    'owner family name';

COMMENT ON COLUMN owner.owner_prefvet_id IS
    'owner preferred vet id';

COMMENT ON COLUMN owner.owner_address IS
    'owner address';

COMMENT ON COLUMN owner.owner_no IS
    'owner phone number';

ALTER TABLE owner ADD CONSTRAINT owner_pk PRIMARY KEY ( owner_id );

CREATE TABLE pet (
    pet_id         NUMBER(7) NOT NULL,
    owner_id       NUMBER(7) NOT NULL,
    pet_name       VARCHAR2(50) NOT NULL,
    pet_gender     CHAR(1) NOT NULL,
    pet_dob        DATE NOT NULL,
    pet_status     CHAR(1) NOT NULL,
    pet_type_code  VARCHAR2(50) NOT NULL
);

ALTER TABLE pet
    ADD CONSTRAINT gender CHECK ( pet_gender IN ( 'F', 'M' ) );

COMMENT ON COLUMN pet.pet_id IS
    'pet id';

COMMENT ON COLUMN pet.owner_id IS
    'owner id';

COMMENT ON COLUMN pet.pet_name IS
    'pet name';

COMMENT ON COLUMN pet.pet_gender IS
    'pet gender';

COMMENT ON COLUMN pet.pet_dob IS
    'pet date of birth';

COMMENT ON COLUMN pet.pet_status IS
    'pet status (deceased or alive)';

COMMENT ON COLUMN pet.pet_type_code IS
    'pet type code';

ALTER TABLE pet ADD CONSTRAINT pet_pk PRIMARY KEY ( pet_id );

CREATE TABLE pet_type (
    pet_type_code  VARCHAR2(50) NOT NULL,
    pet_type_name  VARCHAR2(50) NOT NULL
);

COMMENT ON COLUMN pet_type.pet_type_code IS
    'pet type code';

COMMENT ON COLUMN pet_type.pet_type_name IS
    'pet type name';

ALTER TABLE pet_type ADD CONSTRAINT pet_type_pk PRIMARY KEY ( pet_type_code );

ALTER TABLE pet_type ADD CONSTRAINT un_pettype_name UNIQUE ( pet_type_name );

CREATE TABLE prescription (
    prescription_id               NUMBER(7) NOT NULL,
    visit_date                    DATE NOT NULL,
    pet_id                        NUMBER(7) NOT NULL,
    drug_id                       NUMBER(7) NOT NULL,
    prescription_drug_dose        VARCHAR2(20) NOT NULL,
    prescription_drug_freq_admin  VARCHAR2(20) NOT NULL
);

COMMENT ON COLUMN prescription.prescription_id IS
    'surrogate key';

COMMENT ON COLUMN prescription.visit_date IS
    'visit_date';

COMMENT ON COLUMN prescription.pet_id IS
    'pet_id';

COMMENT ON COLUMN prescription.prescription_drug_dose IS
    'prescription drug dose';

COMMENT ON COLUMN prescription.prescription_drug_freq_admin IS
    'prescription drug frequency of adminstration';

ALTER TABLE prescription ADD CONSTRAINT prescription_pk PRIMARY KEY ( prescription_id );

ALTER TABLE prescription
    ADD CONSTRAINT prescription_nk UNIQUE ( visit_date,
                                            pet_id,
                                            drug_id );

CREATE TABLE service (
    serv_code  VARCHAR2(10) NOT NULL,
    serv_desc  VARCHAR2(50) NOT NULL,
    serv_cost  NUMBER(10, 2) NOT NULL
);

COMMENT ON COLUMN service.serv_code IS
    'service code';

COMMENT ON COLUMN service.serv_desc IS
    'service description';

COMMENT ON COLUMN service.serv_cost IS
    'service cost';

ALTER TABLE service ADD CONSTRAINT service_pk PRIMARY KEY ( serv_code );

CREATE TABLE vet (
    vet_id                   NUMBER(7) NOT NULL,
    vet_spec_code            VARCHAR2(20) NOT NULL,
    vet_gname                VARCHAR2(50) NOT NULL,
    vet_fname                VARCHAR2(50) NOT NULL,
    vet_no                   CHAR(10),
    vet_empdate              DATE NOT NULL,
    vet_homeclinic           VARCHAR2(50) NOT NULL,
    vet_foreignvisits_count  NUMBER(7) NOT NULL
);

COMMENT ON COLUMN vet.vet_spec_code IS
    'vet specialisation code';

COMMENT ON COLUMN vet.vet_gname IS
    'vet  given name';

COMMENT ON COLUMN vet.vet_fname IS
    'vet family name';

COMMENT ON COLUMN vet.vet_no IS
    'vet phone number';

COMMENT ON COLUMN vet.vet_empdate IS
    'vet employment date';

COMMENT ON COLUMN vet.vet_homeclinic IS
    'vet home clinic';

COMMENT ON COLUMN vet.vet_foreignvisits_count IS
    'number of vet visits in clincs which aren''t their home clinic';

ALTER TABLE vet ADD CONSTRAINT vet_pk PRIMARY KEY ( vet_id );

CREATE TABLE vet_specialisations (
    vet_spec_code  VARCHAR2(20) NOT NULL,
    vet_spec_name  VARCHAR2(50) NOT NULL
);

COMMENT ON COLUMN vet_specialisations.vet_spec_code IS
    'vet specialisation code';

COMMENT ON COLUMN vet_specialisations.vet_spec_name IS
    'vet specialisation name';

ALTER TABLE vet_specialisations ADD CONSTRAINT vet_specialisations_pk PRIMARY KEY (
vet_spec_code );

ALTER TABLE vet_specialisations ADD CONSTRAINT un_spec_name UNIQUE ( vet_spec_name );

CREATE TABLE visit (
    visit_date    DATE NOT NULL,
    pet_id        NUMBER(7) NOT NULL,
    owner_id      NUMBER(7) NOT NULL,
    clinic_id     NUMBER(7) NOT NULL,
    visit_length  VARCHAR2(10) NOT NULL,
    visit_notes   VARCHAR2(50)
);

COMMENT ON COLUMN visit.visit_date IS
    'visit_date';

COMMENT ON COLUMN visit.pet_id IS
    'pet_id';

COMMENT ON COLUMN visit.owner_id IS
    'owner id';

COMMENT ON COLUMN visit.clinic_id IS
    'clinic id';

COMMENT ON COLUMN visit.visit_length IS
    'visit length';

COMMENT ON COLUMN visit.visit_notes IS
    'visit notes';

ALTER TABLE visit ADD CONSTRAINT visit_pk PRIMARY KEY ( visit_date,
                                                        pet_id );

CREATE TABLE visit_visits (
    visit_date   DATE NOT NULL,
    pet_id       NUMBER(7) NOT NULL,
    visit_date1  DATE NOT NULL,
    pet_id1      NUMBER(7) NOT NULL
);

ALTER TABLE visit_visits
    ADD CONSTRAINT visit_visits_pk PRIMARY KEY ( visit_date,
                                                 pet_id,
                                                 visit_date1,
                                                 pet_id1 );

ALTER TABLE visit
    ADD CONSTRAINT clinc_visits FOREIGN KEY ( clinic_id )
        REFERENCES clinic ( clinic_id );

ALTER TABLE clinic_vets
    ADD CONSTRAINT clinic_vets_clinic_fk FOREIGN KEY ( clinic_id )
        REFERENCES clinic ( clinic_id );

ALTER TABLE clinic_vets
    ADD CONSTRAINT clinic_vets_vet_fk FOREIGN KEY ( vet_id )
        REFERENCES vet ( vet_id );

ALTER TABLE prescription
    ADD CONSTRAINT drug_prescriptions FOREIGN KEY ( drug_id )
        REFERENCES drug ( drug_id );

ALTER TABLE invoice_drugs
    ADD CONSTRAINT invoice_drugs_drug_fk FOREIGN KEY ( drug_id )
        REFERENCES drug ( drug_id );

ALTER TABLE invoice_drugs
    ADD CONSTRAINT invoice_drugs_invoice_fk FOREIGN KEY ( pet_id,
                                                          vet_id,
                                                          invoice_serv_time,
                                                          invoice_serv_date )
        REFERENCES invoice ( pet_id,
                             vet_id,
                             invoice_serv_time,
                             invoice_serv_date );

ALTER TABLE invoice_services
    ADD CONSTRAINT invoice_services_invoice_fk FOREIGN KEY ( pet_id,
                                                             vet_id,
                                                             invoice_serv_time,
                                                             invoice_serv_date )
        REFERENCES invoice ( pet_id,
                             vet_id,
                             invoice_serv_time,
                             invoice_serv_date );

ALTER TABLE invoice_services
    ADD CONSTRAINT invoice_services_service_fk FOREIGN KEY ( serv_code )
        REFERENCES service ( serv_code );

ALTER TABLE pet
    ADD CONSTRAINT owner_pets FOREIGN KEY ( owner_id )
        REFERENCES owner ( owner_id );

ALTER TABLE visit
    ADD CONSTRAINT owner_visits FOREIGN KEY ( owner_id )
        REFERENCES owner ( owner_id );

ALTER TABLE pet
    ADD CONSTRAINT pettype_pets FOREIGN KEY ( pet_type_code )
        REFERENCES pet_type ( pet_type_code );

ALTER TABLE vet
    ADD CONSTRAINT vetspecialisations_vets FOREIGN KEY ( vet_spec_code )
        REFERENCES vet_specialisations ( vet_spec_code );

ALTER TABLE prescription
    ADD CONSTRAINT visit_prescriptions FOREIGN KEY ( visit_date,
                                                     pet_id )
        REFERENCES visit ( visit_date,
                           pet_id );

ALTER TABLE visit_visits
    ADD CONSTRAINT visit_visits_visit_fk FOREIGN KEY ( visit_date,
                                                       pet_id )
        REFERENCES visit ( visit_date,
                           pet_id );

ALTER TABLE visit_visits
    ADD CONSTRAINT visit_visits_visit_fkv1 FOREIGN KEY ( visit_date1,
                                                         pet_id1 )
        REFERENCES visit ( visit_date,
                           pet_id );


spool off
set echo off

-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                            15
-- CREATE INDEX                             0
-- ALTER TABLE                             34
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
