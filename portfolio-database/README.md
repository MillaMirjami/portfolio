# SQL Database - Portfolio

This project has a SQL-database, which is designed for a portfolio website. 
Database contains tables for projects, feedback, stack and user. There are indexes for the foreign key columns to improve query performance. 
With this database it's possible to manage projects and all the information about them, 
such as categories, the technologies that were used and the feedback about the projects.

## The structure of the database

Database portfolio has the following tables:
- category: For storing categories such as Web App Project, Mobile App Project...
- project: For storing projects, including name, description, link, dates.
- stack: The technologies that were used in the projects.
- project_category: Connects projects and categories.
- project_stack: Connects projects and technologies used.
- user: Information about the user such as name, email and bio.
- feedback: Feedback about the projects from teachers, professionals and colleagues.

## How to use the database

You can make changes to the database or do searches by committing SQL-commands.

###Example 1: How to insert data:

INSERT INTO project (name, start_date, end_date, description, link)
VALUES
('Free Fall', '2023-08-22', '2025-10-01', 'Mobile Game', 'https://example.com');

###Example 2: Searching projects and their technologies:

SELECT name, stack.technology 
FROM project
JOIN project_stack ON (project.id = project_stack.project_id)
JOIN stack ON (stack.id = project_stack.stack_id)
WHERE project.id = 1;

