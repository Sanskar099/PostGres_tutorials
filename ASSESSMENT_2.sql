/* QUESTIONS SHEET : https://docs.google.com/document/d/1wiuYbTQslmfolQWgeVPB356csjK6yqOUBhgC7fM44o8/edit?usp=sharing
*/


SELECT name, membercost FROM cd.facilities;


SELECT facid, name, membercost, guestcost, initialoutlay FROM cd.facilities
WHERE membercost > 0;


SELECT facid, name, membercost, guestcost, initialoutlay FROM cd.facilities
WHERE membercost > 0 AND membercost < DIV(monthlymaintenance,50);


SELECT * FROM cd.facilities
WHERE name ILIKE '%tennis%'


SELECT * FROM cd.facilities 
WHERE facid in (1,5)


SELECT * from cd.members LIMIT 10
SELECT * from cd.bookings LIMIT 10;
SELECT * from cd.facilities LIMIT 10;


SELECT memid, firstname, surname, joindate from cd.members 
WHERE joindate > '2012-09-01';



SELECT DISTINCT surname FROM cd.members ORDER BY surname LIMIT 10;


SELECT * FROM cd.members ORDER BY joindate DESC LIMIT 1;

SELECT COUNT(*) FROM cd.facilities WHERE guestcost > 10;





SELECT SUM(slots) as total_slots, f.name FROM cd.bookings as b
INNER JOIN cd.facilities as f 
ON b.facid = f.facid
WHERE b.starttime BETWEEN '2012-09-01' AND '2012-10-1' 
GROUP BY f.name ORDER BY SUM(slots)


-- V IMP I had to use a HAVING clause here since aggregates can not be used with WHERE statements.
SELECT SUM(slots) as total_slots, f.name FROM cd.bookings as b
INNER JOIN cd.facilities as f 
ON b.facid = f.facid
GROUP BY f.name 
HAVING SUM(slots) > 1000
ORDER BY SUM(slots);





SELECT f.name, b.starttime FROM cd.facilities as f
INNER JOIN cd.bookings as b ON
f.facid = b.facid
WHERE b.starttime BETWEEN '2012-09-21' AND '2012-09-22'
AND f.name ILIKE '%tennis Court%'
ORDER BY b.starttime;



SELECT b.starttime from cd.bookings as b 
INNER JOIN cd.members as m
ON b.memid = m.memid
WHERE m.firstname = 'David' AND m.surname = 'Farrell'
