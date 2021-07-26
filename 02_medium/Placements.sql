SELECT s.Name

FROM students AS s 
JOIN friends AS f
    ON s.id = f.id
JOIN packages AS p1
    ON f.id = p1.id
JOIN packages AS p2
    ON f.friend_id = p2.id

WHERE p1.salary < p2.salary
ORDER BY p2.salary;