set @numb = 0;
SELECT REPEAT('* ', @NUMB := @NUMB +1)
FROM information_schema.tables
LIMIT 20;