# Pewlett-Hackard-Analysis
CSV files for the challenge: retirement_title.csv, recent_title.csv, title_count.csv, mentor_ready.csv (located in Data folder)
PNG files for the challenge: EmployeeDB.png, retirement_title_table_output.png(sorry I made it weirdly long), partition_output.png, title_frequency.png, mentor_ready_output.png
SQL files for the challenge: challenge.sql (located in Queries folder)

Project Summary:
I performed a seriers of queries to get the titles of those of retirement age, the most recent title of those ready for retirement, the number of employees with certian titles, and those who are ready for mentorship within the companty. 
In the first query, I joined three tables with an inner join in order to generate those who are ready for retirement at PH. I started with data from current_emp table because it already includes to proper age and hire ranges as well as inclding current employees. I joined it with titles and salaries, taking the title column from the title table and the from_date and salary columns from the salaries table. 

My next query filtered through the table and selected only the most recent title for each employee. Many employees were duplicated because they had changed positions or salaries within the company, I wanted to make sure that each employee was only counted once and only for their most recent position. 

The third query counted the number of employees who had the same title. This shows how many people with certain titles will be retiring soon. There are only 4 Mangers of retirement age; however, there are 8,326 Senior Engineers retiring soon. I would suggest to perform further analysis on this data to determine which departments will be losing the employees with these titles. Losing a large number of Senior Engineers in one department could be devastating. 

The final query determined those in the company of mentorship age. I joined columns from Employees, Dept_emp, and Titles to gather data on employees born in 1965 who currently work at PH. 

There are 32,859 people nearing retirement age.
There are 2,382 people available for mentorship. 
I'm not sure how many people will be hired as that depends on how many people are promoted and if they decide to restructure any departments with the mentorship program. 
My reccomendation for further analysis, as stated in the section describing the third query, is to examine the titles retiring further. We should know which departments these titles are retiring from. 
