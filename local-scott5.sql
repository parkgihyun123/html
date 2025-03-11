--평가시험

SELECT * FROM professor;

SELECT 
    Substr(email, Instr(email, '@') + 1) AS domain,
    Count(*) As Ea,
    (Select Count(*) From professor) As Sum_domain,
    Round(Count(*) / (Select Count(*) From professor) * 100, 2) AS "%"
FROM professor
group by Substr(email, Instr(email, '@') + 1)
order by domain;