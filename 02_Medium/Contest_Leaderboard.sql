-- CASE 1
SELECT h.hacker_id,
       h.name,
       SUM(s.score)
FROM hackers AS h JOIN (SELECT hacker_id, challenge_id, max(score) AS score
                        FROM submissions
                        GROUP BY hacker_id, challenge_id) AS s
ON h.hacker_id = s.hacker_id
GROUP BY h.hacker_id, h.name
HAVING SUM(s.score) > 0
ORDER BY SUM(s.score) DESC, h.hacker_id;

-- CASE 2
SELECT H.HACKER_ID, H.NAME, SUM(S.SCORE) AS TOTAL
FROM HACKERS AS H
JOIN (SELECT HACKER_ID, CHALLENGE_ID, MAX(SCORE) AS SCORE
      FROM SUBMISSIONS
      GROUP BY HACKER_ID, CHALLENGE_ID) AS S
ON H.HACKER_ID = S.HACKER_ID
GROUP BY H.HACKER_ID, H.NAME
HAVING TOTAL != 0
ORDER BY TOTAL DESC, H.HACKER_ID;
