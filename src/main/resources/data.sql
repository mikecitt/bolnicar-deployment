INSERT INTO clinic_center_admin (
    id,
    email_address,
    password,
    last_password_reset_date,
    first_name,
    last_name,
    jmbg,
    address,
    city,
    country,
    contact,
    active
) VALUES
(
    1, 'ccadmin@gmail.com', '$2a$10$SHepdD5KBoQUkeVLwEJmvu90794GPxBLZ2Ps0hWttClzrM8QGcd4.',
    CURRENT_TIMESTAMP,
    'Gordan', 'Mačkić', '0210980653452', 'Petra Konjovića 10', 'Novi Sad', 'Srbija', '0611454215', TRUE
);

INSERT INTO clinic (address, description, name) VALUES
    ('Kralja Petra 42', 'Klinika se bavi urološkim problemima i sadrži 1 CT skener.', 'Urologija'),
    ('Gajeva 10', 'Infektivna klinika opremljena novom opremom iz Kine za borbu protiv COVID19 virusa.', 'Infektivna klinika'),
    ('Partizanska 72', 'Radiologija predstavlja novi objekat kliničkog centra i sadrži najnovije uređaje.', 'Radiologija');

INSERT INTO room (room_number, type, clinic_id) VALUES
    ('10001', 'EXAMINATION', 1),
    ('10002', 'EXAMINATION', 1),
    ('10003', 'OPERATION', 1),
    ('10010', 'OPERATION', 1),
    ('10011', 'OPERATION', 1),
    ('10020', 'EXAMINATION', 1),
    ('10021', 'EXAMINATION', 1),
    ('10022', 'EXAMINATION', 1),
    ('20001', 'EXAMINATION', 2),
    ('20002', 'EXAMINATION', 2),
    ('20010', 'EXAMINATION', 2),
    ('20011', 'EXAMINATION', 2),
    ('20012', 'EXAMINATION', 2),
    ('20013', 'EXAMINATION', 2),
    ('30001', 'EXAMINATION', 3),
    ('30002', 'EXAMINATION', 3),
    ('30003', 'EXAMINATION', 3),
    ('30004', 'EXAMINATION', 3),
    ('30010', 'EXAMINATION', 3),
    ('30011', 'EXAMINATION', 3),
    ('30012', 'OPERATION', 3),
    ('30013', 'OPERATION', 3);

INSERT INTO clinic_admin (
    id,
    email_address,
    password,
    last_password_reset_date,
    first_name,
    last_name,
    jmbg,
    address,
    city,
    country,
    contact,
    active,
    clinic_id
) VALUES
(
    2, 'zdugi@yandex.com', '$2a$10$SHepdD5KBoQUkeVLwEJmvu90794GPxBLZ2Ps0hWttClzrM8QGcd4.',
    CURRENT_TIMESTAMP,
    'Jovan', 'Obradović', '21129796554639', 'Bulevar Oslobođenja 24', 'Novi Sad', 'Srbija', '063546789', TRUE, 1
),
(
    20, 'mikec4n@gmail.com', '$2a$10$SHepdD5KBoQUkeVLwEJmvu90794GPxBLZ2Ps0hWttClzrM8QGcd4.',
    CURRENT_TIMESTAMP,
    'Jovan', 'Obradović', '21129796554239', 'Bulevar Oslobođenja 24', 'Novi Sad', 'Srbija', '063546789', TRUE, 2
),
(
    21, 'z.dravko.dugi@gmail.com', '$2a$10$SHepdD5KBoQUkeVLwEJmvu90794GPxBLZ2Ps0hWttClzrM8QGcd4.',
    CURRENT_TIMESTAMP,
    'Zdravko', 'Kratki', '21129796654239', 'Bulevar Oslobođenja 24', 'Novi Sad', 'Srbija', '063546789', TRUE, 3
);

INSERT INTO doctor (
    id,
    email_address,
    password,
    last_password_reset_date,
    first_name,
    last_name,
    jmbg,
    address,
    city,
    country,
    contact,
    active,
    clinic_id,
    shift_start,
    shift_end,
    working_days
) VALUES
(
    3, 'zdravko.dugi@gmail.com', '$2a$10$SHepdD5KBoQUkeVLwEJmvu90794GPxBLZ2Ps0hWttClzrM8QGcd4.',
    CURRENT_TIMESTAMP,
    'Zdravko', 'Dugonjić', '0402989200984', 'Lenjinova 26', 'Veternik', 'Srbija', '0625467890', TRUE, 1,
    to_timestamp('06:00', 'HH24:MI'), to_timestamp('18:00', 'HH24:MI'),
    85
),
(
    4, 'rodusek021@gmail.com', '$2a$10$SHepdD5KBoQUkeVLwEJmvu90794GPxBLZ2Ps0hWttClzrM8QGcd4.',
    CURRENT_TIMESTAMP,
    'Vladimir', 'Rodušek', '0511989800018', 'Svetog Save 15', 'Srbobran', 'Srbija', '0615679087', TRUE, 2,
    to_timestamp('09:00', 'HH24:MI'), to_timestamp('21:00', 'HH24:MI'),
    51
),
(
    9, 'mikecitt@gmail.com', '$2a$10$SHepdD5KBoQUkeVLwEJmvu90794GPxBLZ2Ps0hWttClzrM8QGcd4.',
    CURRENT_TIMESTAMP,
    'Milan', 'Pavlov', '2406986000120', 'Moravska 26', 'Žabalj', 'Srbija', '0694259875', TRUE, 3,
    to_timestamp('12:00', 'HH24:MI'), to_timestamp('23:00', 'HH24:MI'),
    57
),
(
    12, 'testdoca@gmail.com', '$2a$10$SHepdD5KBoQUkeVLwEJmvu90794GPxBLZ2Ps0hWttClzrM8QGcd4.',
    null,
    'Mica', 'Micic', '2401286000120', 'Moravska 20', 'Žabalj', 'Srbija', '0694259475', TRUE, 1,
    to_timestamp('12:00', 'HH24:MI'), to_timestamp('23:00', 'HH24:MI'),
    57
);

INSERT INTO nurse (
    id,
    email_address,
    password,
    last_password_reset_date,
    first_name,
    last_name,
    jmbg,
    address,
    city,
    country,
    contact,
    active,
    clinic_id,
    shift_start,
    shift_end,
    working_days
) VALUES
(
    5, 'nevena@gmail.com', '$2a$10$SHepdD5KBoQUkeVLwEJmvu90794GPxBLZ2Ps0hWttClzrM8QGcd4.',
    CURRENT_TIMESTAMP,
    'Nevena', 'Nevenić', '2506982201967', 'Bulevar Evrope 22', 'Novi Sad', 'Srbija', '065125998', TRUE, 1,
    to_timestamp('08:00', 'HH24:MI'), to_timestamp('16:00', 'HH24:MI'), 31
),
(
    6, 'petra.p@gmail.com', '$2a$10$SHepdD5KBoQUkeVLwEJmvu90794GPxBLZ2Ps0hWttClzrM8QGcd4.',
    CURRENT_TIMESTAMP,
    'Petra', 'Filipović', '2506987201967', 'Gajeva 10', 'Novi Sad', 'Srbija', '0664523345', TRUE, 1,
    to_timestamp('16:00', 'HH24:MI'), to_timestamp('00:00', 'HH24:MI'), 31
);

INSERT INTO patient (
    id,
    email_address,
    password,
    last_password_reset_date,
    first_name,
    last_name,
    jmbg,
    address,
    city,
    country,
    contact,
    active
) VALUES
(
    7, 'patient@gmail.com', '$2a$10$SHepdD5KBoQUkeVLwEJmvu90794GPxBLZ2Ps0hWttClzrM8QGcd4.',
    CURRENT_TIMESTAMP,
    'Obrad', 'Obradović', '1609965568970', 'Resavska 15', 'Kulpin', 'Srbija', '0627689098', TRUE
),
(
    8, 'crazypostman123@gmail.com', '$2a$10$SHepdD5KBoQUkeVLwEJmvu90794GPxBLZ2Ps0hWttClzrM8QGcd4.',
    CURRENT_TIMESTAMP,
    'Goran', 'Miković', '1601975000012', 'Patrijarha Pavla 52', 'Bački Petrovac', 'Srbija', '0634567789', TRUE
),
(
    10, 'rodusekvladimir@yahoo.com', '$2a$10$SHepdD5KBoQUkeVLwEJmvu90794GPxBLZ2Ps0hWttClzrM8QGcd4.',
    CURRENT_TIMESTAMP,
    'Filip', 'Marković', '3010998002512', 'Trg Mladenaca 1', 'Žabalj', 'Srbija', '065435675', TRUE
),
(
    11, 'horat2@gmail.com', '$2a$10$SHepdD5KBoQUkeVLwEJmvu90794GPxBLZ2Ps0hWttClzrM8QGcd4.',
    CURRENT_TIMESTAMP,
    'Gorana', 'Filipović', '2305990564789', 'Stepe Stepanovića 65', 'Temerin', 'Srbija', '0665678908', TRUE
);

INSERT INTO drug (name) VALUES
    ('Penicilin'),
    ('Nolpaza'),
    ('Aspirin'),
    ('Brufen'),
    ('Klometol'),
    ('Ranisan'),
    ('Humani insulin'),
    ('Bensedin'),
    ('Nafazol kapi'),
    ('Bisoprolol'),
    ('Enterofuryl'),
    ('Amoksicilin'),
    ('Ciprocinal');

INSERT INTO medical_diagnosis (name) VALUES
    ('Zapaljenje tankog creva koje uzrokuje Campylobacter'),
    ('Zapaljenje tankog creva koje uzrokuje Yersinia enterocolitica'),
    ('Trovanje hranom uzrokovano stafilokokom'),
    ('Tuberkuloza polno-mokraćnih kanala'),
    ('Urolitijaza'),
    ('Bubrežna insuficijencija'),
    ('Zapaljenje mokraćne bešike'),
    ('Živčani zastoj mokraće u bešici'),
    ('Vrećasto proširenje zida mokraćne bešike'),
    ('Deformacija prsta šake'),
    ('Patološko iščašenje i nepotpuno iščašenje zgloba'),
    ('Maligne neoplazme'),
    ('Promena zgloba, neoznačena'),
    ('Tumor'),
    ('Corona virus'),
    ('Prehlada'),
    ('Crevna infekcija uzrokovana enterohemoragijskom Escherichia coli'),
    ('Lokalizovane infekcije uzrokovane salmonelom');

INSERT INTO examination_type (name, price) VALUES
    ('Opšta praksa', 1000.0),
    ('Ultrazvuk', 2000.0),
    ('Laboratorija', 1500.0),
    ('Sistematski pregled', 1300.0),
    ('Urološki pregled', 1200.0),
    ('Urologija', 10000.0),
    ('Kardiološki pregled', 1400.0),
    ('Kardiološka hirurgija', 12400.0),
    ('Ginekološki pregled', 1700.0),
    ('Ortopedski pregled', 1000.0),
    ('Ortopedija', 8900.0),
    ('Stomatološki pregled', 1400.0),
    ('CT snimanje', 3500.0),
    ('Magnetna rezonanca', 4000.0),
    ('Maksiofacijalna hirurgija', 18000.0);

INSERT INTO time_off (start_date, end_date, active) VALUES
    (to_timestamp('2020-06-25', 'yyyy-MM-dd'), to_timestamp('2020-07-05', 'yyyy-MM-dd'), TRUE),
    (to_timestamp('2020-07-10', 'yyyy-MM-dd'), to_timestamp('2020-07-12', 'yyyy-MM-dd'), FALSE),
    (to_timestamp('2020-07-28', 'yyyy-MM-dd'), to_timestamp('2020-08-08', 'yyyy-MM-dd'), TRUE),
    (to_timestamp('2020-06-28', 'yyyy-MM-dd'), to_timestamp('2020-07-06', 'yyyy-MM-dd'), FALSE);

INSERT INTO medical_worker_calendar (medical_worker_id, calendar_id) VALUES
    (5, 3), (3, 1), (3, 2), (9, 4);

INSERT INTO doctor_specialization (doctor_id, specialization_id) VALUES
    (9, 13), (9, 14), (9, 2), (3, 5), (3, 6), (4, 3), (4, 4);

INSERT INTO appointment (
    datetime,
    discount,
    duration,
    clinic_id,
    doctor_id,
    patient_id,
    report_id,
    room_id,
    type_id,
    active,
    price,
    appointment_type
) VALUES
    -- not free
    (to_timestamp('2020-06-02 10:30', 'yyyy-MM-dd HH24:MI'), 0.2, 30, 1, 3, 7, NULL, 1, 5, TRUE, 1232.43, 'EXAMINATION'),
    (to_timestamp('2020-06-29 12:00', 'yyyy-MM-dd HH24:MI'), 0.0, 60, 3, 9, 10, NULL, 12, 14, TRUE, 13.43, 'EXAMINATION'),
    (to_timestamp('2020-07-02 16:00', 'yyyy-MM-dd HH24:MI'), 0.4, 60, 2, 4, 11, NULL, 16, 3, TRUE, 232.43, 'EXAMINATION'),
    (to_timestamp('2020-07-07 11:30', 'yyyy-MM-dd HH24:MI'), 0.2, 30, 1, 3, 10, NULL, NULL, 5, FALSE, 1632.43, 'EXAMINATION'),
    (to_timestamp('2020-07-07 17:30', 'yyyy-MM-dd HH24:MI'), 0.2, 30, 1, 3, 8, NULL, NULL, 5, FALSE, 64.43, 'EXAMINATION'),
    (to_timestamp('2020-07-07 08:00', 'yyyy-MM-dd HH24:MI'), 0.2, 30, 1, 3, 11, NULL, 8, 5, TRUE, 52434.43, 'EXAMINATION'),

    -- free
    (to_timestamp('2020-09-02 13:00', 'yyyy-MM-dd HH24:MI'), 0.4, 60, 2, 4, NULL, NULL, 16, 3, TRUE, 53245.43, 'EXAMINATION'),
    (to_timestamp('2020-09-02 17:00', 'yyyy-MM-dd HH24:MI'), 0.4, 60, 2, 4, NULL, NULL, 16, 3, TRUE, 32452.43, 'EXAMINATION'),
    (to_timestamp('2020-10-19 19:30', 'yyyy-MM-dd HH24:MI'), 0.4, 60, 2, 4, NULL, NULL, 16, 3, TRUE, 19999.43, 'EXAMINATION');

INSERT INTO medical_report (description, appointment_id) VALUES
    ('Pacijent se žalio na otežano mokrenje i bol u oblasti bešike.', 1),
    ('Pacijent se žalio na bol u oblasti levog bubrega.', 2);

INSERT INTO medical_report_diagnoses (medical_report_id, diagnoses_id) VALUES
    (1, 7), (2, 6);

INSERT INTO recipe (sealed, drug_id, nurse_id) VALUES
    (TRUE, 13, 5);

INSERT INTO medical_report_recipes (medical_report_id, recipes_id) VALUES
    (1, 1);

UPDATE appointment SET report_id = 1 where id = 1;
UPDATE appointment SET report_id = 2 where id = 2;

INSERT INTO patient_medical_record (patient_id, medical_record_id) VALUES
    (7, 1), (8, 2);