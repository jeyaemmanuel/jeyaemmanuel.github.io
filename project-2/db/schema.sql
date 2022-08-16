DROP TABLE mass_shootings;
DROP TABLE accidental_deaths;
DROP TABLE accidental_injuries;
DROP TABLE overdoses;

CREATE TABLE overdoses (
  ID INT NOT NULL,
  state TEXT NOT NULL,
  population INT NOT NULL,
  deaths INT NOT NULL,
  PRIMARY KEY (state)
);

CREATE TABLE mass_shootings (
  ID INT NOT NULL,
  incident_id INT NOT NULL,
  incident_date DATE NOT NULL,
  state TEXT NOT NULL,
  city_county TEXT NOT NULL,
  no_injured int NOT NULL,
  no_killed int NOT NULL,
  PRIMARY KEY (ID),
  FOREIGN KEY (state) REFERENCES overdoses(state)
);

CREATE TABLE accidental_deaths (
  ID INT NOT NULL,
  incident_id INT NOT NULL,
  incident_date DATE NOT NULL,
  state TEXT NOT NULL,
  city_county TEXT NOT NULL,
  no_injured int NOT NULL,
  no_killed int NOT NULL,
  PRIMARY KEY (ID),
  FOREIGN KEY (state) REFERENCES overdoses(state)
);

CREATE TABLE accidental_injuries (
  ID INT NOT NULL,
  incident_id INT NOT NULL,
  incident_date DATE NOT NULL,
  state TEXT NOT NULL,
  city_county TEXT NOT NULL,
  no_injured int NOT NULL,
  no_killed int NOT NULL,
  PRIMARY KEY (ID),
  FOREIGN KEY (state) REFERENCES overdoses(state)
);