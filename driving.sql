
-- INSURANCE INFO

CREATE TABLE InsuranceCo (name TEXT, phone INT, PRIMARY KEY(name));




-- PEOPLE INFO

CREATE TABLE Person (name TEXT, ssn INT, PRIMARY KEY(ssn));

CREATE TABLE Driver (ssn INT REFERENCES Person(ssn), driverID INT, PRIMARY KEY(ssn));

CREATE TABLE NonProfessionalDriver (ssn INT REFERENCES Driver(ssn), PRIMARY KEY(ssn));

CREATE TABLE ProfessionalDriver (ssn INT REFERENCES Driver(ssn), medicalHistory VARCHAR, PRIMARY KEY(ssn));

CREATE TABLE Drives (name TEXT REFERENCES NonProfessionalDriver(name), licensePlate VARCHAR REFERENCES Car(licensePlate));




-- VEHICLES INFO

CREATE TABLE Vehicle (licensePlate VARCHAR, year INT, insurance TEXT REFERENCES InsuranceCo(name), maxLiability FLOAT, owner INT REFERENCES Driver(ssn), PRIMARY KEY(licensePlate));

CREATE TABLE Car (licensePlate VARCHAR REFERENCES Vehicle(licensePlate), make TEXT, PRIMARY KEY(licensePlate));

CREATE TABLE Truck (licensePlate VARCHAR REFERENCES Vehicle(licensePlate), capacity INT, operator INT REFERENCES ProfessionalDriver(ssn), PRIMARY KEY(licensePlate));







/* b. "Insures" is represented by the "insurance" attribute in the Vehicle table. Since a vehicle can be insured by at most one company (depicted by the filled arrow in the ER diagram), there can be an attribute in the vehicle table that says which insurance company it is insured by. Generally, in the case of a many-to-one relationship, (ie. where an insurance company could insure many cars but a car can only be insured by one company), the number of tables can be reduced by adding an attribute to the table that references another. */


/* c. Drives and Operates are two relations that depict who drives a vehicle. Operates is represented by an attribute in Truck, whereas Drives is a table that joins attributes from Car and NonProfessionalDriver. While there is an unconstrained Drives relationship, there is a many-to-one relationship between professional drivers and trucks: a truck can be operated by at most one professional driver. As in question b, the number of tables can be reduced by adding an attribute to the table that references another in many-to-one scenarios. Therefore, I added an attribute "operator" in the Truck table to indicate the professional driver that operates that truck. In contrast, I made a table called "drives" that includes the ssn of non professional drivers and the car that is driven by that person. Therefore, there can be multiple drivers listed for the same car and multiple cars listed for the same driver in that relationship table. */






