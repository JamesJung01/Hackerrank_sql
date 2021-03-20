SELECT h.hacker_id,
       h.name,
       SUM(s.score)

FROM hackers AS h JOIN (SELECT hacker_id, challenge_id, max(score) AS score
                        FROM submissions
                        GROUP BY hacker_id, challenge_id) AS s
ON h.hacker_id = s.hacker_id

GROUP BY h.hacker_id, h.name
HAVING SUM(s.score) > 0
ORDER BY SUM(s.score) DESC, h.hacker_id