--code for query challenge 7, part 1, task 1- create table for titles retiring, output example saved as retirement_title_table_output.png
SELECT ce.emp_no,
	   ce.first_name,
	   ce.last_name,
	   ti.title,
	   s.from_date,
	   s.salary
-- INTO retirement_title
FROM current_emp as ce
INNER JOIN titles as ti
ON (ce.emp_no = ti.emp_no)
INNER JOIN salaries as s
ON (ti.emp_no = s.emp_no);


-- code for query challenge 7, part 1, task 2- exclude rows containing duplicate names, only the most recent titles, output example saved as partition_output.png
SELECT emp_no, first_name, last_name, from_date, title INTO recent_title FROM
  (SELECT emp_no, first_name, last_name, from_date, title,
     ROW_NUMBER() OVER 
(PARTITION BY (first_name, last_name) ORDER BY from_date DESC) rn
   FROM retirement_title
  ) tmp WHERE rn = 1;

  -- code for query challenge 7, part 1, task 2- list frequency count of employee titles , output saved as title_frequency.png
SELECT COUNT (emp_no), recent_title.title
INTO title_count
FROM recent_title
GROUP BY title
ORDER BY count;

-- code for query challenge 7, part 1, task 3- create a table for employees ready to be mentored, ouput saved as mentor_ready_output.png
SELECT e.emp_no,
		e.first_name,
		e.last_name,
		de.from_date,
		de.to_date,
		ti.title
INTO mentor_ready
FROM employees as e 
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
INNER JOIN titles as ti
ON (de.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
	AND (de.to_date = '9999-01-01');