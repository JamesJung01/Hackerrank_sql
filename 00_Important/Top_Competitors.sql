SELECT h.hacker_id, h.name
FROM submissions AS s 
INNER JOIN hackers AS h
ON s.hacker_id = h.hacker_id
INNER JOIN challenges AS c
ON s.challenge_id = c.challenge_id
INNER JOIN difficulty AS d
ON c.difficulty_level = d.difficulty_level
WHERE d.score = s.score AND d.difficulty_level = c.difficulty_level
GROUP BY h.hacker_id, h.name
HAVING count(s.hacker_id) > 1
ORDER BY count(s.hacker_id) DESC, s.hacker_id ASC