-- Retrieve information about the Ram Mandir?
select * from temple;

-- List all construction phases for the Ram Mandir?
select phase_id, phasename from constructionphase;

-- Find the total amount of donations received for the Ram Mandir?
select * from donation;
select sum(amount)"Total Amount" from donation;

-- Get details about the architecture of the Ram Mandir?
select * from architecture;

-- Retrieve events associated with the Ram Mandir?
select * from event;

-- Find donors who contributed more than 50000 towards the Ram Mandir?
select * from donation;
select doonor_name from donation where amount>50000;

-- Retrieve details about a specific deity (e.g., Rama)?
select * from deity where name = 'Rama';

-- Find the start and end dates of the construction phases for the Ram Mandir?
select phasename, startdate, completiondate from constructionphase;

-- Count the number of events associated with each temple?
select count(event_id)"number of events" from event;

-- Find the donors who made contributions on or after 2021-06-01'?
select doonor_name,amount,donated_date from donation where donated_date >= '01-06-2021';