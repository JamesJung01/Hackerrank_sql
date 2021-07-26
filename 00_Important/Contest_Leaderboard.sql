SELECT h.hacker_id,
       h.NAME,
       SUM(s.score)

FROM hackers AS h
INNER JOIN (SELECT hacker_id, NAME, max(score) as score
            FROM submissions
            group by hacker_id, challenge_id) AS s
ON h.hacker_id = s.hacker_id


GROUP BY h.hacker_id, h.name
HAVING sum(s.score) > 0
ORDER BY sum(s.score) DESC, h.hacker_id ASC

