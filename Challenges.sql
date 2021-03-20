SELECT h.hacker_id,
       h.name,
       COUNT(c.challenge_id) AS cnt

FROM hackers AS h JOIN challenges AS c
ON h.hacker_id = c.hacker_id

GROUP BY h.hacker_id
HAVING 
        c_count = 
            (SELECT MAX(tmp.cnt)
             FROM (SELECT COUNT(hacker_id) AS tmp_cnt
                FROM challenges
                GROUP BY hacker_id
                ORDER BY hacker_id) tmp)
        or c_count in
            (SELECT t.cnt
             FROM (SELECT COUNT(*) AS cnt
                  FROM challenges
                  GROUP BY hacker_id) t
             GROUP BY t.cnt
             HAVING COUNT(t.cnt)=1)

ORDER BY c_count DESC, h.hacker_id