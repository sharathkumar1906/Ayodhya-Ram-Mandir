--Deity Data
create table Deity (Deity_id number primary key, 
            Name varchar2(225) not null, Description varchar2(300));
            
insert into Deity values(1, 'Rama', 'An incarnation of Vishnu, a principal deity of Hinduism born in Ayodhya.');
insert into Deity values(2, 'Ram Lalla Virajman', 'The infant form of Rama, the presiding deity of the Ram Mandir temple.');
                                                                           
--Temple Data
create table Temple(Temple_ID number(2) primary key, Name varchar2(255) not null,
            Location varchar2(300), Construction_StartDate date, Expexted_CompletionDate DATE);
            drop table Temple;
INSERT INTO Temple values (1, 'Ram Mandir', 'Ayodhya, Uttar Pradesh, India', '01-03-2020', '22-01-2024');
            
--Construction Phase Data
create table constructionPhase(Phase_id number(2)PRIMARY key, Temple_ID number(2), PhaseName varchar2(300) not null,
            StartDate date, CompletionDate date, 
            FOREIGN key (Temple_ID) references Temple(Temple_ID));
drop table constructionPhase;
insert into constructionphase values (1, 1, 'Phase 1', '01-03-2020', '15-05-2023');
insert into constructionphase values (2, 1, 'Phase 2', '01-06-2020', '30-08-2020');
insert into constructionphase values (3, 1, 'Phase 3', '10-01-2021', '25-03-2021');
insert into constructionphase values (4, 1, 'Phase 4', '15-06-2021', '28-02-2022');
select * from constructionphase;
update constructionphase set  CompletionDate = '15-05-2020' where Phase_id=1;

-- Temple Architecture Data
create table architecture(architect_id number(4) primary key, Temple_ID NUMBER(2), architect_name varchar2(300),
            Description varchar2(300), 
            FOREIGN key (Temple_ID) references Temple(Temple_ID));

insert into architecture values (1, 1, 'Chandrakant Sompura', 'Chief architect of the temple');
insert into architecture values (1002 , 1, 'Nikhil Sompura', 'Assistant architect');
insert into architecture values (1003, 1, 'Ashish Sompura', 'Assistant architect');
insert into architecture values (1004, 1, 'Varun chakravathi', 'Jr.architect');
update architecture set architect_id = 1001 where architect_name = 'Chandrakant Sompura';
select * from architecture;

-- Temple donation data
create table donation (Donation_id number(5) primary key, Doonor_name varchar2(50) not null,
                        Amount DECIMAL(10,2) not null, Donated_Date date, Temple_ID number(2), foreign key (Temple_ID) references Temple(Temple_ID)); 
            select*from donation;
insert into donation values (0001, 'Ram Nath Kovind', 501000.00, '15-01-2021', 1);-- Assuming TempleID 1 corresponds to the Ram Mandir
insert into donation values (0002, 'Narendhra Modi', 45000, '15-02-2021',1);
insert into donation values (3, 'Anonymous Donor', 100.00, '2021-02-01', 1);
insert into donation VALUES (4, 'Leadership Council', 1000000.00, '10-03-2021', 1);
insert into donation values (5, 'H.D. Kumaraswamy', 5000.00, '01-05-2021', 1);
insert into donation values (6, 'Siddaramaiah', 20000.00, '15-05-2021', 1);
insert into donation values (7, 'VHP Activist 1', 50.00, '01-06-2021', 1);
insert into donation values (8, 'VHP Activist 2', 75.00, '15-06-2021', 1);
insert into donation values (9, 'Relience Groups', 15000000.00, '03-05-2021',1);                           
insert into donation values (10, 'Indina Cements', 75900000.00, '01-07-2021', 1);
insert into donation values (11, 'TATA Groups', 50000000.00, '15-07-2021', 1);
insert into donation values (12, 'Anonymous Supporter', 2000000.00, '01-08-2021', 1);

-- Events data
CREATE TABLE event ( Event_ID number(4) PRIMARY KEY, EventName VARCHAR(255) NOT NULL,
                                EventDate DATE, Desciption varchar2(400));
insert into event values (1, 'Commencement Ceremony', '05-08-2020', 'Ceremony celebrating the commencement of Ram Mandir construction by PM Narendra Modi');
insert into event values (2, 'Bhoomi Pujan Ceremony', '05-08-2020', 'Ground-breaking ceremony with Vedic rituals and foundation stone laying by PM Narendra Modi');
insert into event values (3, 'Vijay Mahamantra Jaap Anushthan', '06-04-2020', 'Chanting of Vijay Mahamantra for victory over hurdles in temple construction');
insert into event values (4, 'Pran Pratishtha Ceremony', '22-01-2024', 'Consecration ceremony scheduled for the installation of Lord Ram idol in the garbhagriha');
                                
--Temple Event Data
create table TempleEvents( Temple_ID number(2), Event_ID number(4),
                                FOREIGN KEY (Temple_ID) REFERENCES Temple(Temple_ID),
                                FOREIGN KEY (Event_ID) REFERENCES event(Event_ID),
                                PRIMARY KEY (Temple_ID, Event_ID));
insert into templeevents values (1, 1); -- Assuming TempleID 1 and EventID 1 are associated
insert into templeevents values (1, 2);
insert into templeevents values (1, 3);
insert into templeevents values (1, 4); 
                            