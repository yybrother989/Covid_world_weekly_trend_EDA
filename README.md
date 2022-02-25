# Covid-19 cases world weekly trend EDA

## Covid-19  cases data:
Stored in covid_world_weekly_trend.csv



This dataset contains data of weekly trend of Covid-19 in World (**February 07 - February 22, 2022**)

### Attribute Information  (*The project selected partial attributes*)

  1. *country_other*:  **Country, Other ( contain areas and regions )**<br />
    2.  *case_last7d*  :**Cases in the last 7 days**<br />
~~3. *case_prece7d* : **Cases in the preceding 7 days**~~<br />
     4.  *weekly_case_change_percent*: **Weekly Case % Change**<br />
     5. *case_last7d_per1m*:  **Cases in the last 7 days/1M pop**<br />
     6. *death_last7d* :**Deaths in the last 7 days**<br />
     ~~7.  *death_prece7d*:**Deaths in the preceding 7 days**~~<br />
     8.  *weekly_death_change_percent*: **Weekly Death % Change**<br />
     9.  *death_last7d_per1m*: **Deaths in the last 7 days/1M pop**<br />
     10.  *population*:  **Population**<br />
### Data source: [Covid-19 Weekly Trends In World-Kaggle](https://www.kaggle.com/anandhuh/covid19-weekly-trends-in-world-latest-data?select=covid_world_weekly_trend.csv)

# Vaccinations data:

Stored in country_vaccinations.csv



### Attribute Information  (*The project selected partial attributes*)
The data (country vaccinations) contains the following information:


 1. . **Country**- this is the country for which the vaccination<br />
    information is provided;
            2.  **Country ISO Code**  - ISO code for the country;<br />
            3.   **Date**  - date for the data entry; for some of the dates we have only the daily vaccinations, for others, only the
        (cumulative)
            total;<br />
            4.   **Total number of vaccinations**  - this is the absolute number of total immunizations in the country;<br />
            5.   **Total number of people vaccinated**  - a person, depending on the immunization scheme, will receive one or more
        (typically 2)
            vaccines; at a certain moment, the number of vaccination might be
            larger than the number of people;<br />
            6.  **Total number of people fully vaccinated**  - this is the number of people that received the entire set of immunization
            according to the immunization scheme (typically 2); at a certain
            moment in time, there might be a certain number of people that
            received one vaccine and another number (smaller) of people that
            received all vaccines in the scheme;<br />
              ~~**Daily vaccinations (raw)**  - for a certain data entry, the number of vaccination for that date/country;~~<br />
            -~~**Daily vaccinations**  - for a certain data entry, the number of vaccination for that date/country;~~<br />
           7.   **Total vaccinations per hundred**  - ratio (in percent) between vaccination number and total population up to the date in
        the
            country;<br />
          8..   **Total number of people vaccinated per hundred**  - ratio (in percent) between population immunized and total population
    up to
        the
            date in the country;<br />
           9..   **Total number of people fully vaccinated per hundred**  - ratio (in percent) between population fully immunized and total
        population
            up to the date in the country;<br />
               ~~**Number of vaccinations per day**  - number of daily vaccination for that day and country;~~<br />
                ~~**Daily vaccinations per million**  - ratio (in ppm) between vaccination number and total population for the current date
        in the
            country;~~<br />
              ~~**Vaccines used in the country**  - total number of vaccines used in the country (up to date);~~<br />
              ~~**Source name**  - source of the information (national authority, international organization, local organization etc.);~~
              ~~**Source website**  - website of the source of information;~~<br />

   

## Democracy index by countries data:
**Context:** 
The  _**Democracy Index**_  is an index compiled by the  [Economist Intelligence Unit](https://en.wikipedia.org/wiki/Economist_Intelligence_Unit "Economist Intelligence Unit")  (EIU), the research division of the  [Economist Group](https://en.wikipedia.org/wiki/Economist_Group "Economist Group"), a  [UK](https://en.wikipedia.org/wiki/United_Kingdom "United Kingdom")-based  [private company](https://en.wikipedia.org/wiki/Private_company "Private company")  which publishes the weekly newspaper  _[The Economist](https://en.wikipedia.org/wiki/The_Economist "The Economist")_. Akin to a  [Human Development Index](https://en.wikipedia.org/wiki/Human_Development_Index "Human Development Index")  but centrally concerned with political institutions and freedoms, the index attempts to measure the state of  [democracy](https://en.wikipedia.org/wiki/Democracy "Democracy")  in 167 countries and territories, of which 166 are  [sovereign states](https://en.wikipedia.org/wiki/Sovereign_state "Sovereign state")  and 164 are  [UN member states](https://en.wikipedia.org/wiki/Member_states_of_the_United_Nations "Member states of the United Nations").

The index is based on 60 indicators grouped in five different categories, measuring  [pluralism](https://en.wikipedia.org/wiki/Pluralism_(political_philosophy) "Pluralism (political philosophy)"),  [civil liberties](https://en.wikipedia.org/wiki/Civil_liberties "Civil liberties")  and  [political culture](https://en.wikipedia.org/wiki/Political_culture "Political culture"). In addition to a numeric score and a ranking, the index categorises each country into one of four regime types:  [full democracies](https://en.wikipedia.org/wiki/Liberal_democracy "Liberal democracy"),  [flawed democracies](https://en.wikipedia.org/wiki/Illiberal_democracy "Illiberal democracy"),  [hybrid regimes](https://en.wikipedia.org/wiki/Hybrid_regime "Hybrid regime")  and  [authoritarian regimes](https://en.wikipedia.org/wiki/Authoritarian_regime "Authoritarian regime").
### Attribute Information：
**Year**<br />
**Country**<br />
**EIU**： [Economist Intelligence Unit](https://en.wikipedia.org/wiki/Economist_Intelligence_Unit "Economist Intelligence Unit")

### Data source<br />

: [Github](https://github.com/xmarquez/democracyData/blob/master/data-raw/EIU%20Democracy%20Index.csv)

## G7 Country Data
### Attribute Information：
Country<br />
GDP： value in trillion<br />
Population： value in million<br />

### Data Source：[NationMaster](https://www.nationmaster.com/country-info/groups/Group-of-7-countries-%28G7%29)


