SELECT o.state, o.deaths, ai.sum_accidental_injuries,
ad.sum_accidental_deaths, ms.sum_mass_shootings
FROM overdoses o
LEFT JOIN
(
    SELECT state, SUM(no_killed) as sum_accidental_injuries
    FROM accidental_injuries
    GROUP BY state
) ai on ai.state = o.state
LEFT JOIN
(
    SELECT state, SUM(no_killed) as sum_accidental_deaths
    FROM accidental_deaths
    GROUP BY state
) ad ON ad.state = o.state
LEFT JOIN
    (
    SELECT state, SUM(no_killed) as sum_mass_shootings
    FROM mass_shootings
    GROUP BY state
    ) ms ON ms.state = o.state;