/*##Covid weekly trend data insight retrieved from countries and continents*/
/*#1.Showing the top 5 countries having the lesat death caused by covid in percent in the last 7 days*/
CREATE VIEW top5_case_death_countries AS
    SELECT 
        country_other AS 'Country and other',
        case_last7d AS ' Cases in the last 7 days',
        death_last7d AS 'Deaths in the last 7 days'
    FROM
        covid_weekly_trend
    ORDER BY case_last7d DESC
    LIMIT 5;

/*Select information from the existing view*/

SELECT 
    *
FROM
    top5_case_death_countries;
/*#2.Showing the bottom 5 countries having the lesat death caused by covid in percent in the last 7 days*/

CREATE VIEW bottom5_case_death_countries AS
    SELECT 
        country_other AS 'Country and other',
        case_last7d AS ' Cases in the last 7 days',
        death_last7d AS 'Deaths in the last 7 days'
    FROM
        covid_weekly_trend
    ORDER BY case_last7d ASC
    LIMIT 5;

/*Select information from the existing view*/

SELECT 
    *
FROM
    bottom5_case_death_countries;

/*#3.Showing the ranking of infectious cases group by continent */

SELECT 
    continent, SUM(case_last7d)
FROM
    covid_weekly_trend
GROUP BY continent
ORDER BY SUM(case_last7d) DESC;

/*#4.Showing the total number of cases and death in the latest week*/

SELECT 
    SUM(case_last7d) AS 'Total number of cases in the last 7 days',
    SUM(death_last7d) AS 'Total number of deaths in the last 7 days'
FROM
    covid_weekly_trend;

/*#5.Combining the question 1 and 2 together*/

SELECT 
    *
FROM
    top5_case_death_countries 
UNION SELECT 
    *
FROM
    bottom5_case_death_countries;

/*##Explore the relationship betwwen vaccinations and covid-19 cases and deaths*/

SELECT 
    top5_case_death_countries.*,
    people_vaccinated_per_hundred,
    people_fully_vaccinated_per_hundred
FROM
    top5_case_death_countries
        LEFT JOIN
    vaccinations ON top5_case_death_countries.`Country and other` = vaccinations.country
ORDER BY vaccinations.date DESC
LIMIT 5;

/*#7.How about latest vaccination process for the country with the least deaths and cases in the last 7 days*/

SELECT 
    bottom5_case_death_countries.*,
    people_vaccinated_per_hundred,
    people_fully_vaccinated_per_hundred
FROM
    bottom5_case_death_countries
        LEFT JOIN
    vaccinations ON bottom5_case_death_countries.`Country and other` = vaccinations.country
ORDER BY vaccinations.date DESC
LIMIT 5;
/*These countries lacked the related vaccinations data to illustrate if vaccinations relieve their epidemic spreading.*/

/*#8.As mentioned above, countries with the lowest covid-19 deaths and cases can not prove that vaccination is the reason why they have lower level cases and deaths*/
/*We may be curious about the countries ranked in the middle part*/

create view mid as 
SELECT country_other ,case_last7d
from (select country_other, row_number() over (order by case_last7d desc) case_ranking ,case_last7d
from covid_weekly_trend) as a
where a.case_ranking between 50 and 80;

SELECT 
    mid.case_last7d,
    country,
    MAX(people_fully_vaccinated_per_hundred + 0),
    MAX(people_vaccinated_per_hundred + 0)
FROM
    mid
        LEFT JOIN
    vaccinations ON mid.country_other = vaccinations.country
GROUP BY country
ORDER BY 1 DESC;

/*#9.Top 10 countries with the highest number of fully vaccinated people per 100 and their cases and deaths in the last 7 days*/

SELECT 
    country_other,
    case_last7d,
    death_last7d,
    MAX(people_fully_vaccinated_per_hundred + 0)
FROM
    covid_weekly_trend
        LEFT JOIN
    vaccinations ON covid_weekly_trend.country_other = vaccinations.country
GROUP BY country_other
ORDER BY 4 DESC
LIMIT 10;
/*#10-11.How many countries without any death last 7 days and what are they respectivly and what are their vaccinations progress?*/
CREATE VIEW no_death AS
    SELECT 
        country_other
    FROM
        covid_weekly_trend
    WHERE
        death_last7d = 0;
SELECT 
    COUNT(country_other) AS 'THE number of countries without death in the last 7 days'
FROM
    no_death;
SELECT 
    country_other,
    MAX(people_vaccinated_per_hundred),
    MAX(people_fully_vaccinated_per_hundred)
FROM
    no_death
        LEFT JOIN
    vaccinations ON country_other = country
GROUP BY country_other
ORDER BY 2 DESC;/*Some countries or area may not be provided enough information about their vaccination information.*/
CREATE VIEW latest_vax AS
    SELECT 
        country,
        MAX(total_vaccinations + 0) AS 'total_vaccinations',
        MAX(people_vaccinated_per_hundred + 0) AS 'number_vaccinated_per100',
        MAX(people_fully_vaccinated_per_hundred + 0) AS 'number_fully_vaccinated_per100'
    FROM
        vaccinations
    GROUP BY country;

SELECT 
    continent,
    ROUND(AVG(total_vaccinations), 0),
    ROUND(AVG(number_vaccinated_per100), 0),
    ROUND(AVG(number_fully_vaccinated_per100), 0)
FROM
    latest_vax
        RIGHT JOIN
    covid_weekly_trend ON country = covid_weekly_trend.country_other
GROUP BY continent;
/*##Dose the democracy index correlate to covid-19 cases and deaths in some degrees?*/

SELECT 
    country, case_last7d_per1m,  death_last7d_per1m, eiu
FROM
    demo_index
        LEFT JOIN
    covid_weekly_trend ON demo_index.country = covid_weekly_trend.country_other
WHERE
    case_last7d IS NOT NULL
        AND death_last7d IS NOT NULL
ORDER BY eiu DESC
LIMIT 20;

/*14.Bottom 20 countries with lowest democracy index and their covid-19 cases and deaths*/

SELECT 
    country, case_last7d_per1m,  death_last7d_per1m, eiu
FROM
    demo_index
        LEFT JOIN
    covid_weekly_trend ON demo_index.country = covid_weekly_trend.country_other
WHERE
    case_last7d IS NOT NULL
        AND death_last7d IS NOT NULL
ORDER BY eiu ASC
LIMIT 20;

/*15.TOP 20 countries with the highest democracy index and their vaccinations progress*/
SELECT 
    demo_index.country,
    number_vaccinated_per100,
    number_fully_vaccinated_per100,
    eiu
FROM
    demo_index
        LEFT JOIN
    latest_vax ON demo_index.country = latest_vax.country
ORDER BY eiu DESC
LIMIT 20;
/*16.Bottom 20 countries with the lowest democracy index and their vaccinations progress*/
SELECT 
    demo_index.country,
    number_vaccinated_per100,
    number_fully_vaccinated_per100,
    eiu
FROM
    demo_index
        LEFT JOIN
    latest_vax ON demo_index.country = latest_vax.country
ORDER BY eiu ASC
LIMIT 20;
/*17.Democracy index distribution group by continent*/
SELECT 
    continent, ROUND(AVG(eiu), 2) AS 'Average EIU'
FROM
    demo_index
        RIGHT JOIN
    covid_weekly_trend ON country_other = country
GROUP BY continent;

/*##How about G7 group countries in the latest week? What are their positions in the world?*/

SELECT 
    `g7 countries`.country,
    number_vaccinated_per100,
    number_fully_vaccinated_per100
FROM
    latest_vax
        RIGHT JOIN
    `g7 countries` ON `g7 countries`.country = latest_vax.country;
CREATE VIEW average AS
    SELECT 
        AVG(number_vaccinated_per100),
        AVG(number_fully_vaccinated_per100)
    FROM
        latest_vax;
SELECT 
    `g7 countries`.country,
    number_vaccinated_per100,
    IF(number_vaccinated_per100 > (SELECT 
                `AVG(number_vaccinated_per100)`
            FROM
                average),
        'Yes',
        'No') AS ' <-Above the average level of world ?',
    number_fully_vaccinated_per100,
    IF(number_fully_vaccinated_per100 > (SELECT 
                `AVG(number_fully_vaccinated_per100)`
            FROM
                average),
        'Yes',
        'No') AS ' <-Above the average level of world ?'
FROM
    latest_vax
        RIGHT JOIN
    `g7 countries` ON `g7 countries`.country = latest_vax.country;
/*19.Which country has the best vaccinations progress in G7 */

/*CREATE DEFINER=`root`@`localhost` PROCEDURE `best_vax_perform`()
BEGIN
     SELECT `g7 countries`.country,MAX(number_vaccinated_per100),MAX(number_fully_vaccinated_per100)
     FROM `g7 countries` LEFT JOIN latest_vax
     ON `g7 countries`.country=latest_vax.country
     ORDER BY 2,3;

END*/

/*Calling the existing procedure*/

CALL best_vax_perform

/*20.Which country has the smallest cases number and deaths number in G7*/

/*CREATE DEFINER=`root`@`localhost` PROCEDURE `lowest_death_case_G7`()
BEGIN
     SELECT `g7 countries`.country,MAX(number_vaccinated_per100) AS 'Smallest number of cases in G7',MAX(number_fully_vaccinated_per100)AS 'Smallest number of deaths in G7'
     FROM `g7 countries` LEFT JOIN latest_vax
     ON `g7 countries`.country=latest_vax.country
     ORDER BY 2,3;

END*/

/*Calling the existing procedure*/

CALL lowest_death_case_G7;


