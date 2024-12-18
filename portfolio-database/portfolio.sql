DROP TABLE IF EXISTS feedback CASCADE;
DROP TYPE IF EXISTS feedback_type CASCADE;
DROP TABLE IF EXISTS person CASCADE;
DROP TABLE IF EXISTS project_stack CASCADE;
DROP TABLE IF EXISTS project_category CASCADE;
DROP TABLE IF EXISTS stack CASCADE;
DROP TABLE IF EXISTS project CASCADE;
DROP TABLE IF EXISTS category CASCADE;

CREATE TABLE category(
    id BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY,
    category_name VARCHAR(255) NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE project(
    id BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(255) NOT NULL,
    start_date DATE NULL,
    end_date DATE NULL,
    description TEXT NULL,
    link VARCHAR(255) NULL,
    PRIMARY KEY(id)
);

CREATE TABLE stack(
    id BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY,
    technology VARCHAR(255),
    PRIMARY KEY(id)
);

CREATE TABLE project_category(
    project_id BIGINT NOT NULL REFERENCES project(id) ON DELETE CASCADE ON UPDATE CASCADE,
    category_id BIGINT NOT NULL REFERENCES category(id) ON DELETE CASCADE ON UPDATE CASCADE,
    PRIMARY KEY(project_id, category_id)
);

CREATE TABLE project_stack(
    project_id BIGINT NOT NULL REFERENCES project(id) ON DELETE CASCADE ON UPDATE CASCADE,
    stack_id BIGINT NOT NULL REFERENCES stack(id) ON DELETE CASCADE ON UPDATE CASCADE,
    PRIMARY KEY(project_id, stack_id)
);

CREATE TABLE person(
    id BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NULL,
    image_url VARCHAR(255) NULL,
    bio TEXT NULL,
    PRIMARY KEY(id)
);

CREATE TYPE feedback_type AS ENUM ('Teacher', 'Professional', 'Collegue');

CREATE TABLE feedback(
    id BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY,
    feedback_text TEXT NULL,
    feedback_type feedback_type NULL,
    project_id BIGINT NOT NULL REFERENCES project(id) ON DELETE CASCADE ON UPDATE CASCADE,
    PRIMARY KEY(id)
);

INSERT INTO category (category_name)
VALUES
('Web App Project'),
('Mobile App Project'),
('API');

INSERT INTO project (name, start_date, end_date, description, link)
VALUES
('School Portfolio', '2024-10-21', NULL, 'Portfolio that displays projects done throughout the school year', 'https://intra.bc.fi/s2401576/portfolio/'),
('Christmas Calendar', '2024-11-01', NULL, 'Spare time project to learn the use of grid element and the use of animations', NULL),
('Blackjack', '2024-12-01', NULL, 'School project that displays the rich use of objects IN C#', NULL);

INSERT INTO stack (technology)
VALUES
('HTML5'),
('CSS3'),
('SQL'),
('JavaScript'),
('C#');

INSERT INTO project_category (project_id, category_id)
VALUES
(1, 1),
(1, 3),
(2, 1),
(2, 3),
(3, 2);

INSERT INTO project_stack (project_id, stack_id)
VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(2, 1),
(2, 2),
(2, 4),
(3, 5);

INSERT INTO person (first_name, last_name, email, image_url, bio)
VALUES
('Milla', 'Sukki', 'milla.sukki@gmail.com', 'https://www.tampereenfreet.net/uploads/1/0/1/4/101444816/published/img-5261.jpg?1713450981', 'Enthusiastic Web developer from Finland ready to take on new challenges!');

INSERT INTO feedback (feedback_text, feedback_type, project_id)
VALUES
('Excellent use of objects in C#, code could be shorter - Ms Apple', 'Teacher', 1),
('Use of grid in the Calendar is outstanding! - Amy Diamond', 'Professional', 2);


CREATE INDEX idx_project_category_project_id ON project_category(project_id);
CREATE INDEX idx_project_category_category_id ON project_category(category_id);

CREATE INDEX idx_project_stack_project_id ON project_stack(project_id);
CREATE INDEX idx_project_stack_stack_id ON project_stack(stack_id);

CREATE INDEX idx_feedback_project_id ON feedback(project_id);
