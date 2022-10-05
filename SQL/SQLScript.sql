-- Creating a Database -----------------------------------------------------------------------------------------------------------------------

USE sgoswam;
DROP TABLE IF EXISTS `sgoswam`.`Building`, `sgoswam`.`Department`, `sgoswam`.`Employee`, `sgoswam`.`EmployeeEmail`, `sgoswam`.`Measurement`, `sgoswam`.`Room`, `sgoswam`.`RoomAllocation`, `sgoswam`.`RoomPhone`, `sgoswam`.`WorksFor`;

-- Creating Tables with appropriate relationships and constraints ----------------------------------------------------------------------------


CREATE TABLE Department (
    DeptName VARCHAR(64),
    DeptPhone CHAR(10) UNIQUE,
    DeptWebAdd VARCHAR(128) UNIQUE,
    DeptEmail VARCHAR(64) UNIQUE,
    DeptAddStreet VARCHAR(128),
    DeptAddCity VARCHAR(128),
    DeptAddState VARCHAR(64),
    DeptAddZip VARCHAR(5),
    PRIMARY KEY (DeptName)
);
  
  
CREATE TABLE Employee (
    EmpID INT AUTO_INCREMENT,
    EmpName VARCHAR(64) NOT NULL,
    EmpYOB YEAR,
    PRIMARY KEY (EmpID)
);


CREATE TABLE EmployeeEmail (
    EmpID INT,
    EmpEmail VARCHAR(64) UNIQUE,
    PRIMARY KEY (EmpID , EmpEmail),
    FOREIGN KEY (EmpID)
        REFERENCES Employee (EmpID)
);


CREATE TABLE WorksFor (
    DeptName VARCHAR(64),
    EmpID INT,
    PRIMARY KEY (DeptName , EmpID),
    FOREIGN KEY (DeptName)
        REFERENCES Department (DeptName),
    FOREIGN KEY (EmpID)
        REFERENCES Employee (EmpID)
);


CREATE TABLE Building (
    BldgName VARCHAR(64),
    BldgFloors INT,
    BldgRooms INT,
    PRIMARY KEY (BldgName)
);


CREATE TABLE Room (
    BldgName VARCHAR(64),
    RoomNo INT,
    RoomArea INT,
    RoomOfficeFlag BOOLEAN,
    RoomConferenceFlag BOOLEAN,
    RoomLabFlag BOOLEAN,
    PRIMARY KEY (BldgName , RoomNo),
    FOREIGN KEY (BldgName)
        REFERENCES Building (BldgName)
);

CREATE TABLE RoomPhone (
    BldgName VARCHAR(64),
    RoomNo INT,
    RoomPhone CHAR(10) UNIQUE,
    PRIMARY KEY (BldgName , RoomNo , RoomPhone),
    FOREIGN KEY (BldgName , RoomNo)
        REFERENCES Room (BldgName , RoomNo)
);


CREATE TABLE RoomAllocation (
    EmpID INT,
    BldgName VARCHAR(64),
    RoomNo INT,
    PRIMARY KEY (EmpID , BldgName , RoomNo),
    FOREIGN KEY (EmpID)
        REFERENCES Employee (EmpID),
    FOREIGN KEY (BldgName , RoomNo)
        REFERENCES Room (BldgName , RoomNo)
);


CREATE TABLE Measurement (
    BldgName VARCHAR(64),
    RoomNo INT,
    MeasTimeStamp TIMESTAMP,
    MeasLight INT,
    MeasTemperature INT,
    MeasSound INT,
    PRIMARY KEY (BldgName , RoomNo , MeasTimeStamp),
    FOREIGN KEY (BldgName , RoomNo)
        REFERENCES Room (BldgName , RoomNo)
);





-- Populating Data inside the tables --------------------------------------------------------------------------------------------------------


INSERT INTO	Department
		(DeptName, DeptPhone, DeptWebAdd, DeptEmail, DeptAddStreet, DeptAddCity, DeptAddState, DeptAddZip)
	VALUES
		('Atmospheric, Oceanic and Earth Sciences', '1234560000', 'www.aoe.organization.com', 'aoe@organization.com', '82483 Schamberger Turnpike', 'Nicolastad', 'North Carolina', '47811'),
		('Biology', '1234560001', 'www.bio.organization.com', 'bio@organization.com', '548 West Walks', 'Arvelville', 'West Virginia', '09057'),
		('Chemistry', '1234560002', 'www.chem.organization.com', 'chem@organization.com', '24837 Zoe Shoal', 'Croninton', 'Arkansas', '09646'),
		('Computational and Data Sciences', '1234560003', 'www.cds.organization.com', 'cds@organization.com', '45734 Francis Glen', 'Leoside', 'Mississippi', '81420'),
		('Environmental Sciences', '1234560004', 'www.env.organization.com', 'env@organization.com', '97842 Eveline Vista', 'Rileyfort', 'Oregon', '08319'),
		('Forensic Sciences', '1234560005', 'www.for.organization.com', 'for@organization.com', '7118 Ellis Mill', 'West Kaelyn', 'Indiana', '84310'),
		('Geology', '1234560006', 'www.geo.organization.com', 'geo@organization.com', '4973 Bella Unions', 'New Lesleyhaven', 'Alaska', '37709'),
        ('Mathematics', '1234560007', 'www.math.organization.com', 'math@organization.com', '4780 Reichel Prairie', 'Heidenreichburgh', 'California', '24598'),
		('Neuroscience', '1234560008', 'www.neu.organization.com', 'neu@organization.com', '4718 Jacobi Summit', 'Kelliview', 'Louisiana', '46753'),
		('Physics and Astronomy', '1234560009', 'www.phy.organization.com', 'phy@organization.com', '4780 Reichel Prairie', 'Heidenreichburgh', 'California', '24598') ;

INSERT INTO Employee
		(EmpName, EmpYOB)
	VALUES
		('Kristian Douglas', 1976),
        ('Chloe Sullivan', 1989),
        ('Maria Bennett', 1981),
        ('Amelia Mitchell', 1974),
        ('James Mason', 1998),
        ('Charlotte Wells', 1971),
        ('Edward Phillips', 1999),
        ('Arianna Russell', 1973),
        ('Sam Mason', 1973),
        ('Jared Adams', 1976),
        ('Ashton Fowler', 1971),
        ('Wilson Richardson', 1993),
        ('Albert Lloyd', 1968),
        ('Adrianna Cole', 1963),
        ('Naomi Brooks', 1984),
        ('Adrian Hunt', 1972),
        ('Kellan Morrison', 1983),
        ('Darcy Morgan', 1996),
        ('Steven Carter', 1998),
        ('Daryl Williams', 1986),
        ('Ryan Evans', 1971),
        ('Rafael Carroll', 1968),
        ('Kristian Mason', 1993),
        ('Jared Sullivan', 1977),
        ('Dexter Cameron', 1970),
        ('Brooke Hawkins', 1970),
        ('Elian Hall', 1985),
        ('Albert Barrett', 1994),
        ('Audrey Campbell', 1996),
        ('Haris Richards', 1982),
        ('Lucy Clark', 1988),
        ('Adam Robinson', 1987),
        ('Ted Phillips', 1974),
        ('Ryan Edwards', 1993),
        ('Preston Rogers', 1987),
        ('Kimberly Perkins', 1975),
        ('Michael Montgomery', 1962),
        ('Ellia Armstrong', 1980),
        ('David Howard', 1978),
        ('Ada Stevens', 1963),
        ('Reid Taylor', 1982),
        ('Maximilian Ryan', 1983),
        ('Deanna Sullivan', 1964),
        ('Nicholas Montgomery', 1972),
        ('Harold Ellis', 1990),
        ('Derek Kelly', 1990),
        ('Rubie Cunningham', 1961),
        ('Cherry Henderson', 1964),
        ('Jasmine Williams', 1978),
        ('Alan Allen', 1991) ;


INSERT INTO EmployeeEmail
		(EmpID, EmpEmail)
	VALUES
		(1, 'k.douglas@organization.org'),
        (1, 'KristianDouglas14@yahoo.com'),
        (2, 'c.sullivan@organization.org'),
        (3, 'm.bennett@organization.org'),
        (4, 'a.mitchell@organization.org'),
        (5, 'j.mason@organization.org'),
        (5, 'JamesMason79@icloud.com'),
        (6, 'c.wells@organization.org'),
        (6, 'CharlotteWells34@yahoo.com'),
        (7, 'e.phillips@organization.org'),
        (7, 'EdwardPhillips68@icloud.com'),
        (8, 'a.russell@organization.org'),
        (8, 'AriannaRussell23@icloud.com'),
        (9, 's.mason@organization.org'),
        (10, 'j.adams@organization.org'),
        (10, 'JaredAdams19@yahoo.com'),
        (11, 'a.fowler@organization.org'),
        (12, 'w.richardson@organization.org'),
        (12, 'WilsonRichardson68@orkut.com'),
        (13, 'a.lloyd@organization.org'),
        (13, 'AlbertLloyd49@gmail.com'),
        (14, 'a.cole@organization.org'),
        (15, 'n.brooks@organization.org'),
        (15, 'NaomiBrooks85@gmail.com'),
        (16, 'a.hunt@organization.org'),
        (17, 'k.morrison@organization.org'),
        (18, 'd.morgan@organization.org'),
        (18, 'DarcyMorgan56@gmail.com'),
        (19, 's.carter@organization.org'),
        (19, 'StevenCarter36@outlook.com'),
        (20, 'd.williams@organization.org'),
        (21, 'r.evans@organization.org'),
        (21, 'RyanEvans98@gmail.com'),
        (22, 'r.carroll@organization.org'),
        (22, 'RafaelCarroll86@orkut.com'),
        (23, 'k.mason@organization.org'),
        (24, 'j.sullivan@organization.org'),
        (24, 'JaredSullivan82@icloud.com'),
        (25, 'd.cameron@organization.org'),
        (26, 'b.hawkins@organization.org'),
        (26, 'BrookeHawkins97@icloud.com'),
        (27, 'e.hall@organization.org'),
        (28, 'a.barrett@organization.org'),
        (28, 'AlbertBarrett19@icloud.com'),
        (29, 'a.campbell@organization.org'),
        (30, 'h.richards@organization.org'),
        (30, 'HarisRichards72@gmail.com'),
        (31, 'l.clark@organization.org'),
        (32, 'a.robinson@organization.org'),
        (32, 'AdamRobinson98@orkut.com'),
        (33, 't.phillips@organization.org'),
        (33, 'TedPhillips95@yahoo.com'),
        (34, 'r.edwards@organization.org'),
        (35, 'p.rogers@organization.org'),
        (36, 'k.perkins@organization.org'),
        (36, 'KimberlyPerkins51@gmail.com'),
        (37, 'm.montgomery@organization.org'),
        (37, 'MichaelMontgomery76@gmail.com'),
        (38, 'e.armstrong@organization.org'),
        (38, 'ElliaArmstrong73@gmail.com'),
        (39, 'd.howard@organization.org'),
        (39, 'DavidHoward84@outlook.com'),
        (40, 'a.stevens@organization.org'),
        (41, 'r.taylor@organization.org'),
        (41, 'ReidTaylor87@outlook.com'),
        (42, 'm.ryan@organization.org'),
        (43, 'd.sullivan@organization.org'),
        (43, 'DeannaSullivan75@gmail.com'),
        (44, 'n.montgomery@organization.org'),
        (45, 'h.ellis@organization.org'),
        (46, 'd.kelly@organization.org'),
        (47, 'r.cunningham@organization.org'),
        (48, 'c.henderson@organization.org'),
        (49, 'j.williams@organization.org'),
        (49, 'JasmineWilliams73@orkut.com'),
        (50, 'a.allen@organization.org') ;

INSERT INTO WorksFor
		(DeptName, EmpID)
	VALUES
		('Chemistry', 1),
        ('Mathematics', 2),
        ('Environmental Sciences', 3),
        ('Forensic Sciences', 4),
        ('Computational and Data Sciences', 5),
        ('Neuroscience', 6),
        ('Biology', 7),
        ('Physics and Astronomy', 8),
        ('Geology', 9),
        ('Environmental Sciences', 10),
        ('Physics and Astronomy', 11),
        ('Atmospheric, Oceanic and Earth Sciences', 12),
        ('Neuroscience', 13),
        ('Mathematics', 14),
        ('Mathematics', 15),
        ('Forensic Sciences', 16),
        ('Biology', 17),
        ('Computational and Data Sciences', 18),
        ('Biology', 19),
        ('Forensic Sciences', 20),
        ('Computational and Data Sciences', 21),
        ('Atmospheric, Oceanic and Earth Sciences', 22),
        ('Atmospheric, Oceanic and Earth Sciences', 23),
        ('Forensic Sciences', 24),
        ('Biology', 25),
        ('Biology', 26),
        ('Computational and Data Sciences', 27),
        ('Geology', 28),
        ('Neuroscience', 29),
        ('Geology', 30),
        ('Chemistry', 31),
        ('Chemistry', 32),
        ('Physics and Astronomy', 33),
        ('Chemistry', 34),
        ('Environmental Sciences', 35),
        ('Forensic Sciences', 36),
        ('Environmental Sciences', 37),
        ('Mathematics', 38),
        ('Environmental Sciences', 39),
        ('Atmospheric, Oceanic and Earth Sciences', 40),
        ('Physics and Astronomy', 41),
        ('Atmospheric, Oceanic and Earth Sciences', 42),
        ('Neuroscience', 43),
        ('Environmental Sciences', 44),
        ('Geology', 45),
        ('Biology', 46),
        ('Physics and Astronomy', 47),
        ('Geology', 48),
        ('Neuroscience', 49),
        ('Neuroscience', 50) ;

INSERT INTO Building
		(BldgName, BldgFloors, BldgRooms)
	VALUES
		('Aquia Building', 3, 7),
        ('Art and Design Building', 2, 3),
        ('Entreprise Hall', 2, 8),
        ('Exploration Hall', 4, 8),
        ('Fenwick Building', 6, 11),
        ('Horizon Hall', 5, 5),
        ('Innovation Hall', 2, 1),
        ('Nguyen Engineering Building', 3, 4),
        ('Research Hall', 8, 4) ;

INSERT INTO Room
		(BldgName, RoomNo, RoomArea, RoomOfficeFlag, RoomConferenceFlag, RoomLabFlag)
	VALUES
		('Nguyen Engineering Building', 1, 4360, false, false, true),
		('Horizon Hall', 1, 3130, false, true, true),
		('Fenwick Building', 1, 1390, false, false, true),
		('Exploration Hall', 1, 2645, true, false, false),
		('Entreprise Hall', 1, 3850, true, false, false),
		('Exploration Hall', 2, 2955, false, true, false),
		('Horizon Hall', 2, 3990, false, false, true),
		('Aquia Building', 1, 1545, true, false, false),
		('Exploration Hall', 3, 3740, false, true, false),
		('Aquia Building', 2, 3580, true, false, true),
		('Fenwick Building', 2, 5280, false, true, false),
		('Entreprise Hall', 2, 4185, false, false, true),
		('Horizon Hall', 3, 3865, true, false, true),
		('Exploration Hall', 4, 1875, true, false, false),
		('Exploration Hall', 5, 1445, false, false, true),
		('Entreprise Hall', 3, 4090, false, false, true),
		('Research Hall', 1, 5955, false, false, true),
		('Nguyen Engineering Building', 2, 3675, false, true, false),
		('Exploration Hall', 6, 3825, false, false, true),
		('Fenwick Building', 3, 3625, false, false, true),
		('Art and Design Building', 1, 3815, false, true, false),
		('Nguyen Engineering Building', 3, 5580, false, true, false),
		('Aquia Building', 3, 4785, true, false, true),
		('Fenwick Building', 4, 5795, false, false, true),
		('Exploration Hall', 7, 2345, false, true, false),
		('Fenwick Building', 5, 3875, false, false, true),
		('Fenwick Building', 6, 3885, false, false, true),
		('Research Hall', 2, 1370, false, true, false),
		('Art and Design Building', 2, 2260, true, false, false),
		('Fenwick Building', 7, 4945, false, false, true),
		('Exploration Hall', 8, 5465, true, false, false),
		('Entreprise Hall', 4, 3315, false, false, true),
		('Entreprise Hall', 5, 3430, false, true, false),
		('Aquia Building', 4, 2050, true, false, false),
		('Fenwick Building', 8, 1630, false, false, true),
		('Entreprise Hall', 6, 3435, true, false, false),
		('Fenwick Building', 9, 3545, false, false, true),
		('Aquia Building', 5, 3715, true, false, true),
		('Aquia Building', 6, 3275, true, false, true),
		('Horizon Hall', 4, 5965, false, false, true),
		('Research Hall', 3, 1875, false, true, false),
		('Aquia Building', 7, 5855, false, true, false),
		('Fenwick Building', 10, 1295, true, false, true),
		('Fenwick Building', 11, 5585, true, false, true),
		('Entreprise Hall', 7, 5685, true, false, true),
		('Art and Design Building', 3, 5160, true, true, true),
		('Horizon Hall', 5, 2000, true, false, false),
		('Entreprise Hall', 8, 3110, false, true, false),
		('Research Hall', 4, 2765, true, false, false),
		('Nguyen Engineering Building', 4, 4200, true, false, true) ;

INSERT INTO RoomPhone
		(BldgName, RoomNo, RoomPhone)
	VALUES
		('Nguyen Engineering Building', 1, '2825718422'),
		('Nguyen Engineering Building', 1, '6969811916'),
		('Horizon Hall', 1, '3044347392'),
		('Fenwick Building', 1, '4465416164'),
		('Fenwick Building', 1, '6999644459'),
		('Exploration Hall', 1, '7458450079'),
		('Exploration Hall', 1, '9652316805'),
		('Entreprise Hall', 1, '2711589491'),
		('Entreprise Hall', 1, '7268528545'),
		('Exploration Hall', 2, '9355839532'),
		('Exploration Hall', 2, '9630249778'),
		('Horizon Hall', 2, '5353093509'),
		('Horizon Hall', 2, '9842970260'),
		('Aquia Building', 1, '7165709244'),
		('Aquia Building', 1, '7828112749'),
		('Aquia Building', 1, '8955903013'),
		('Exploration Hall', 3, '1406521764'),
		('Exploration Hall', 3, '4896114450'),
		('Aquia Building', 2, '5172635048'),
		('Aquia Building', 2, '7074746994'),
		('Aquia Building', 2, '8905845470'),
		('Fenwick Building', 2, '1039089557'),
		('Fenwick Building', 2, '4057877819'),
		('Fenwick Building', 2, '8879259444'),
		('Entreprise Hall', 2, '8236280205'),
		('Horizon Hall', 3, '4165523167'),
		('Horizon Hall', 3, '9888756904'),
		('Exploration Hall', 4, '3648076446'),
		('Exploration Hall', 4, '3755610943'),
		('Exploration Hall', 4, '7231624851'),
		('Exploration Hall', 5, '2363661920'),
		('Exploration Hall', 5, '8834074534'),
		('Entreprise Hall', 3, '3694062790'),
		('Entreprise Hall', 3, '3911809544'),
		('Entreprise Hall', 3, '7250877296'),
		('Research Hall', 1, '1481756127'),
		('Research Hall', 1, '6037776889'),
		('Research Hall', 1, '7146997176'),
		('Nguyen Engineering Building', 2, '1737005146'),
		('Nguyen Engineering Building', 2, '9328273902'),
		('Exploration Hall', 6, '1114830968'),
		('Exploration Hall', 6, '5231579510'),
		('Exploration Hall', 6, '8131298659'),
		('Fenwick Building', 3, '3633114903'),
		('Fenwick Building', 3, '8819014561'),
		('Art and Design Building', 1, '2161682994'),
		('Art and Design Building', 1, '8579412096'),
		('Nguyen Engineering Building', 3, '1813070124'),
		('Aquia Building', 3, '2869781083'),
		('Aquia Building', 3, '6257468006'),
		('Fenwick Building', 4, '6213134676'),
		('Fenwick Building', 4, '6229863409'),
		('Exploration Hall', 7, '9426609883'),
		('Exploration Hall', 7, '9537360431'),
		('Fenwick Building', 5, '5545670455'),
		('Fenwick Building', 5, '6267496129'),
		('Fenwick Building', 6, '6000305987'),
		('Fenwick Building', 6, '8011472204'),
		('Research Hall', 2, '1178566403'),
		('Research Hall', 2, '6242244778'),
		('Art and Design Building', 2, '8481873658'),
		('Fenwick Building', 7, '1925447290'),
		('Fenwick Building', 7, '4701439268'),
		('Fenwick Building', 7, '7896268962'),
		('Exploration Hall', 8, '2647180655'),
		('Exploration Hall', 8, '5996162290'),
		('Exploration Hall', 8, '7998712982'),
		('Entreprise Hall', 4, '7695374259'),
		('Entreprise Hall', 4, '9236005830'),
		('Entreprise Hall', 5, '2018479829'),
		('Entreprise Hall', 5, '3338972150'),
		('Entreprise Hall', 5, '3343098326'),
		('Aquia Building', 4, '4371337082'),
		('Aquia Building', 4, '9003000512'),
		('Fenwick Building', 8, '2723331660'),
		('Fenwick Building', 8, '7296248538'),
		('Fenwick Building', 8, '8194058157'),
		('Entreprise Hall', 6, '1954317650'),
		('Entreprise Hall', 6, '4567139392'),
		('Fenwick Building', 9, '6117384177'),
		('Fenwick Building', 9, '6690880605'),
		('Aquia Building', 5, '7354507989'),
		('Aquia Building', 5, '9341654131'),
		('Aquia Building', 6, '1067530090'),
		('Aquia Building', 6, '5285169939'),
		('Aquia Building', 6, '9573060878'),
		('Horizon Hall', 4, '9917178979'),
		('Research Hall', 3, '3663335566'),
		('Research Hall', 3, '9060310356'),
		('Aquia Building', 7, '3676380804'),
		('Aquia Building', 7, '7848431184'),
		('Fenwick Building', 10, '5205485744'),
		('Fenwick Building', 10, '6505590472'),
		('Fenwick Building', 10, '7681630929'),
		('Fenwick Building', 11, '3504020370'),
		('Fenwick Building', 11, '7536834325'),
		('Entreprise Hall', 7, '1058169042'),
		('Art and Design Building', 3, '8127810375'),
		('Art and Design Building', 3, '9397818608'),
		('Horizon Hall', 5, '3029429095'),
		('Horizon Hall', 5, '5101494010'),
		('Entreprise Hall', 8, '5647475495'),
		('Research Hall', 4, '2066263682'),
		('Research Hall', 4, '3948927466'),
		('Research Hall', 4, '5084149410'),
		('Nguyen Engineering Building', 4, '2066467682'),
		('Nguyen Engineering Building', 4, '3946827466'),
		('Nguyen Engineering Building', 4, '5084154410') ;

INSERT INTO RoomAllocation
		(EmpID, BldgName, RoomNo)
	VALUES
		(1, 'Art and Design Building', 1),
		(2, 'Fenwick Building', 2),
		(3, 'Nguyen Engineering Building', 1),
		(4, 'Research Hall', 4),
		(5, 'Entreprise Hall', 7),
		(6, 'Fenwick Building', 3),
		(7, 'Horizon Hall', 4),
		(8, 'Research Hall', 2),
		(9, 'Aquia Building', 2),
		(10, 'Aquia Building', 6),
		(11, 'Fenwick Building', 10),
		(12, 'Nguyen Engineering Building', 3),
		(13, 'Nguyen Engineering Building', 3),
		(14, 'Fenwick Building', 1),
		(15, 'Fenwick Building', 10),
		(16, 'Research Hall', 3),
		(17, 'Aquia Building', 2),
		(18, 'Horizon Hall', 3),
		(19, 'Entreprise Hall', 5),
		(20, 'Exploration Hall', 4),
		(21, 'Fenwick Building', 1),
		(22, 'Horizon Hall', 2),
		(23, 'Research Hall', 3),
		(24, 'Art and Design Building', 2),
		(25, 'Art and Design Building', 3),
		(26, 'Fenwick Building', 4),
		(27, 'Nguyen Engineering Building', 4),
		(28, 'Exploration Hall', 2),
		(29, 'Entreprise Hall', 6),
		(30, 'Exploration Hall', 6),
		(31, 'Fenwick Building', 3),
		(32, 'Fenwick Building', 3),
		(33, 'Fenwick Building', 7),
		(34, 'Fenwick Building', 4),
		(35, 'Fenwick Building', 9),
		(36, 'Fenwick Building', 5),
		(37, 'Art and Design Building', 2),
		(38, 'Research Hall', 1),
		(39, 'Fenwick Building', 6),
		(40, 'Aquia Building', 5),
		(41, 'Entreprise Hall', 6),
		(42, 'Nguyen Engineering Building', 3),
		(43, 'Entreprise Hall', 5),
		(44, 'Art and Design Building', 3),
		(45, 'Fenwick Building', 10),
		(46, 'Fenwick Building', 8),
		(47, 'Fenwick Building', 7),
		(48, 'Fenwick Building', 5),
		(49, 'Exploration Hall', 3),
		(50, 'Nguyen Engineering Building', 1),
		(42, 'Fenwick Building', 2),
		(4, 'Horizon Hall', 1),
		(18, 'Exploration Hall', 6),
		(37, 'Aquia Building', 1),
		(39, 'Exploration Hall', 7),
		(27, 'Nguyen Engineering Building', 2),
		(1, 'Art and Design Building', 2),
		(23, 'Research Hall', 2),
		(34, 'Entreprise Hall', 8),
		(27, 'Fenwick Building', 2),
		(26, 'Fenwick Building', 3),
		(46, 'Horizon Hall', 1),
		(47, 'Entreprise Hall', 4),
		(14, 'Fenwick Building', 11),
		(27, 'Aquia Building', 4),
		(12, 'Art and Design Building', 3),
		(13, 'Research Hall', 4),
		(21, 'Exploration Hall', 7),
		(6, 'Exploration Hall', 7),
		(30, 'Art and Design Building', 2),
		(1, 'Fenwick Building', 6),
		(12, 'Research Hall', 1),
		(7, 'Exploration Hall', 8),
		(19, 'Art and Design Building', 2),
		(17, 'Fenwick Building', 5),
		(9, 'Art and Design Building', 3),
		(28, 'Horizon Hall', 1),
		(41, 'Fenwick Building', 3),
		(2, 'Entreprise Hall', 5),
		(17, 'Entreprise Hall', 5),
		(37, 'Fenwick Building', 3),
		(13, 'Fenwick Building', 1),
		(17, 'Exploration Hall', 4),
		(24, 'Exploration Hall', 8),
		(19, 'Nguyen Engineering Building', 2),
		(29, 'Research Hall', 2),
		(43, 'Exploration Hall', 4),
		(26, 'Fenwick Building', 7),
		(6, 'Horizon Hall', 5),
		(43, 'Art and Design Building', 1),
		(36, 'Aquia Building', 2),
		(40, 'Exploration Hall', 4),
		(11, 'Nguyen Engineering Building', 4),
		(16, 'Fenwick Building', 7),
		(9, 'Fenwick Building', 3),
		(34, 'Horizon Hall', 1),
		(1, 'Entreprise Hall', 5),
		(13, 'Fenwick Building', 6),
		(38, 'Research Hall', 2),
		(13, 'Aquia Building', 2),
		(23, 'Exploration Hall', 1),
		(11, 'Aquia Building', 4),
		(40, 'Entreprise Hall', 6),
		(32, 'Art and Design Building', 1),
		(46, 'Entreprise Hall', 6),
		(7, 'Horizon Hall', 3),
		(33, 'Nguyen Engineering Building', 1),
		(39, 'Aquia Building', 1),
		(15, 'Entreprise Hall', 5),
		(46, 'Aquia Building', 1),
		(23, 'Fenwick Building', 7),
		(47, 'Nguyen Engineering Building', 1),
		(10, 'Entreprise Hall', 5),
		(22, 'Art and Design Building', 2),
		(35, 'Exploration Hall', 7),
		(4, 'Aquia Building', 2),
		(18, 'Nguyen Engineering Building', 4),
		(16, 'Horizon Hall', 1),
		(13, 'Entreprise Hall', 3),
		(29, 'Fenwick Building', 4),
		(9, 'Fenwick Building', 5),
		(24, 'Aquia Building', 5),
		(8, 'Exploration Hall', 8),
		(34, 'Horizon Hall', 2),
		(45, 'Research Hall', 1),
		(29, 'Aquia Building', 7),
		(17, 'Fenwick Building', 10),
		(34, 'Research Hall', 3),
		(23, 'Aquia Building', 6),
		(23, 'Exploration Hall', 4),
		(31, 'Fenwick Building', 7),
		(29, 'Art and Design Building', 1) ;

INSERT INTO Measurement
		(BldgName, RoomNo, MeasTimeStamp, MeasLight, MeasTemperature, MeasSound)
    VALUES
		('Nguyen Engineering Building', 3, '2022-03-12 14:36:57', 96, 93, 57),
		('Fenwick Building', 11, '2020-04-20 09:00:50', 58, 84, 75),
		('Entreprise Hall', 6, '2021-04-06 15:23:37', 41, 93, 92),
		('Aquia Building', 5, '2022-07-11 12:28:06', 37, 54, 87),
		('Fenwick Building', 2, '2020-12-02 11:17:34', 67, 93, 62),
		('Research Hall', 3, '2021-01-10 09:23:46', 49, 57, 78),
		('Aquia Building', 4, '2022-09-23 12:14:17', 75, 77, 76),
		('Fenwick Building', 5, '2020-09-04 13:43:21', 67, 90, 58),
		('Exploration Hall', 4, '2022-03-20 14:49:44', 78, 76, 76),
		('Aquia Building', 5, '2021-09-25 11:04:35', 40, 58, 81),
		('Fenwick Building', 11, '2022-08-03 10:41:54', 61, 57, 53),
		('Art and Design Building', 3, '2020-07-07 10:20:23', 31, 71, 100),
		('Exploration Hall', 4, '2021-06-30 15:54:21', 44, 60, 65),
		('Entreprise Hall', 6, '2021-12-10 15:37:49', 42, 58, 99),
		('Art and Design Building', 3, '2021-03-05 17:44:46', 63, 60, 85),
		('Entreprise Hall', 5, '2022-12-21 17:23:15', 72, 79, 96),
		('Fenwick Building', 7, '2020-06-12 16:54:26', 33, 98, 40),
		('Horizon Hall', 1, '2021-05-11 09:14:52', 38, 85, 97),
		('Exploration Hall', 6, '2020-10-30 14:13:15', 79, 59, 50),
		('Aquia Building', 1, '2020-07-02 17:02:28', 71, 69, 41),
		('Entreprise Hall', 1, '2022-10-08 13:48:13', 95, 100, 58),
		('Research Hall', 4, '2022-11-14 10:45:10', 90, 59, 91),
		('Fenwick Building', 8, '2020-08-13 14:30:01', 72, 82, 64),
		('Research Hall', 2, '2022-07-30 12:35:00', 44, 57, 70),
		('Fenwick Building', 6, '2021-06-08 09:58:29', 76, 98, 41),
		('Nguyen Engineering Building', 2, '2022-06-05 16:09:59', 34, 97, 81),
		('Fenwick Building', 2, '2022-06-23 13:38:31', 69, 98, 84),
		('Aquia Building', 4, '2021-02-28 13:50:51', 55, 89, 92),
		('Horizon Hall', 3, '2022-07-03 17:24:01', 59, 69, 43),
		('Aquia Building', 5, '2022-02-23 10:35:40', 68, 52, 63),
		('Fenwick Building', 11, '2021-07-01 14:13:09', 81, 70, 93),
		('Fenwick Building', 7, '2020-02-29 10:52:20', 57, 89, 62),
		('Entreprise Hall', 2, '2020-03-09 16:31:14', 96, 52, 44),
		('Nguyen Engineering Building', 1, '2020-01-23 17:25:09', 76, 83, 60),
		('Entreprise Hall', 2, '2020-06-28 18:03:35', 72, 53, 100),
		('Exploration Hall', 8, '2021-05-03 14:41:38', 99, 61, 49),
		('Research Hall', 1, '2020-08-09 12:22:11', 78, 80, 78),
		('Entreprise Hall', 2, '2020-10-24 18:17:22', 37, 74, 88),
		('Entreprise Hall', 2, '2022-07-24 14:20:03', 79, 50, 60),
		('Research Hall', 1, '2021-04-25 18:07:16', 26, 55, 96),
		('Aquia Building', 1, '2021-12-05 17:31:04', 86, 68, 92),
		('Research Hall', 2, '2021-09-19 13:30:28', 53, 76, 83),
		('Entreprise Hall', 4, '2020-11-12 12:10:54', 61, 87, 85),
		('Art and Design Building', 1, '2022-10-24 09:28:40', 87, 93, 76),
		('Nguyen Engineering Building', 1, '2022-10-09 10:05:57', 44, 69, 91),
		('Entreprise Hall', 2, '2020-12-13 11:20:26', 58, 68, 40),
		('Aquia Building', 5, '2020-04-24 18:06:18', 61, 91, 90),
		('Nguyen Engineering Building', 3, '2020-06-26 18:44:53', 77, 65, 87),
		('Fenwick Building', 9, '2020-12-02 14:12:55', 48, 74, 59),
		('Aquia Building', 7, '2020-05-07 15:08:32', 35, 98, 71),
		('Entreprise Hall', 1, '2022-09-02 14:01:24', 56, 78, 49),
		('Entreprise Hall', 2, '2020-10-01 16:19:15', 49, 89, 67),
		('Art and Design Building', 3, '2020-08-04 18:27:54', 99, 59, 66),
		('Fenwick Building', 11, '2022-09-23 13:56:10', 85, 87, 86),
		('Fenwick Building', 7, '2021-12-29 10:26:26', 89, 97, 99),
		('Entreprise Hall', 8, '2022-06-14 14:38:48', 59, 84, 44),
		('Fenwick Building', 4, '2021-04-11 15:54:52', 86, 84, 54),
		('Fenwick Building', 2, '2021-07-16 15:16:09', 73, 100, 91),
		('Nguyen Engineering Building', 4, '2021-01-15 15:29:24', 55, 81, 59),
		('Exploration Hall', 5, '2022-08-12 16:41:18', 96, 60, 66),
		('Nguyen Engineering Building', 2, '2021-11-09 15:39:19', 70, 84, 60),
		('Horizon Hall', 4, '2020-04-22 17:04:26', 87, 86, 65),
		('Horizon Hall', 2, '2020-11-02 10:34:02', 35, 90, 64),
		('Research Hall', 2, '2022-03-19 10:25:27', 30, 54, 76),
		('Horizon Hall', 2, '2020-11-18 16:44:49', 85, 76, 96),
		('Fenwick Building', 10, '2020-07-19 17:53:41', 47, 100, 50),
		('Fenwick Building', 11, '2021-10-23 14:51:26', 28, 70, 90),
		('Exploration Hall', 7, '2021-11-22 10:24:39', 28, 90, 74),
		('Horizon Hall', 1, '2020-12-12 10:33:36', 63, 70, 40),
		('Fenwick Building', 8, '2022-10-21 14:48:32', 95, 75, 75),
		('Aquia Building', 2, '2020-09-10 11:51:24', 61, 53, 44),
		('Exploration Hall', 6, '2022-03-01 12:02:08', 67, 73, 75),
		('Exploration Hall', 1, '2021-08-09 10:31:20', 72, 90, 86),
		('Entreprise Hall', 7, '2021-02-28 11:18:56', 58, 79, 45),
		('Nguyen Engineering Building', 1, '2022-07-12 15:17:09', 62, 69, 63),
		('Horizon Hall', 1, '2021-08-22 17:23:49', 65, 88, 96),
		('Entreprise Hall', 5, '2022-09-18 11:11:18', 50, 73, 61),
		('Entreprise Hall', 1, '2021-11-05 17:27:54', 98, 99, 53),
		('Research Hall', 4, '2022-05-09 18:00:50', 27, 60, 62),
		('Aquia Building', 7, '2022-02-19 10:11:17', 73, 63, 41),
		('Exploration Hall', 5, '2022-12-07 14:49:26', 98, 59, 42),
		('Nguyen Engineering Building', 1, '2021-03-18 09:31:03', 83, 74, 91),
		('Exploration Hall', 4, '2022-05-04 11:46:54', 84, 100, 54),
		('Research Hall', 4, '2022-06-14 12:27:53', 34, 73, 89),
		('Entreprise Hall', 3, '2020-12-29 13:08:04', 97, 86, 42),
		('Exploration Hall', 4, '2021-12-25 10:53:10', 50, 90, 80),
		('Exploration Hall', 5, '2020-02-02 10:39:10', 59, 83, 69),
		('Research Hall', 1, '2020-10-16 13:52:23', 86, 78, 43),
		('Exploration Hall', 7, '2022-12-18 15:52:34', 57, 85, 40),
		('Entreprise Hall', 4, '2022-12-24 17:58:16', 74, 82, 87),
		('Fenwick Building', 11, '2021-10-07 10:47:49', 61, 92, 88),
		('Fenwick Building', 3, '2021-12-27 15:19:47', 30, 70, 76),
		('Fenwick Building', 7, '2021-03-09 10:09:43', 55, 100, 75),
		('Aquia Building', 6, '2021-04-30 10:58:19', 48, 65, 73),
		('Entreprise Hall', 3, '2020-03-29 15:32:22', 76, 68, 78),
		('Entreprise Hall', 2, '2020-11-17 17:01:18', 71, 56, 50),
		('Research Hall', 3, '2020-09-03 18:20:12', 33, 74, 63),
		('Entreprise Hall', 2, '2022-06-17 18:52:04', 46, 99, 75),
		('Exploration Hall', 8, '2020-09-23 12:57:18', 45, 56, 70),
		('Exploration Hall', 8, '2021-11-04 18:21:07', 54, 56, 58),
		('Aquia Building', 7, '2022-05-20 09:50:33', 55, 59, 88),
		('Entreprise Hall', 2, '2020-02-28 18:18:10', 52, 93, 99),
		('Fenwick Building', 9, '2020-07-15 17:38:06', 40, 75, 59),
		('Horizon Hall', 2, '2020-02-26 18:10:11', 33, 87, 67),
		('Entreprise Hall', 4, '2022-10-15 13:27:21', 83, 56, 61),
		('Entreprise Hall', 2, '2020-06-16 13:31:23', 27, 84, 96),
		('Nguyen Engineering Building', 3, '2021-10-09 14:44:34', 82, 84, 87),
		('Entreprise Hall', 7, '2021-06-16 10:59:20', 37, 80, 96),
		('Entreprise Hall', 8, '2020-03-26 16:11:17', 43, 58, 71),
		('Fenwick Building', 8, '2020-08-04 14:24:31', 48, 56, 81),
		('Aquia Building', 1, '2021-04-09 14:48:41', 73, 66, 53),
		('Aquia Building', 6, '2022-03-14 13:15:11', 97, 96, 97),
		('Aquia Building', 1, '2020-10-07 14:42:55', 79, 61, 41),
		('Fenwick Building', 5, '2021-01-10 13:11:43', 82, 83, 96),
		('Art and Design Building', 1, '2021-01-26 09:46:34', 29, 82, 91),
		('Art and Design Building', 3, '2022-09-01 16:00:41', 99, 67, 88),
		('Fenwick Building', 1, '2022-02-28 16:33:34', 71, 59, 74),
		('Fenwick Building', 11, '2021-12-23 17:12:54', 60, 97, 71),
		('Entreprise Hall', 3, '2021-06-11 18:06:49', 77, 61, 42),
		('Exploration Hall', 1, '2021-02-23 17:31:20', 31, 97, 55),
		('Entreprise Hall', 5, '2020-08-01 17:07:45', 80, 53, 86),
		('Horizon Hall', 4, '2020-10-02 12:30:47', 77, 100, 72),
		('Fenwick Building', 5, '2021-09-03 18:37:37', 94, 78, 41),
		('Nguyen Engineering Building', 1, '2022-11-24 18:59:41', 72, 79, 64),
		('Nguyen Engineering Building', 4, '2020-11-09 12:51:38', 80, 69, 84),
		('Research Hall', 4, '2020-12-25 11:19:47', 45, 66, 45),
		('Fenwick Building', 4, '2020-09-20 12:01:39', 80, 83, 43),
		('Aquia Building', 7, '2022-08-28 12:58:58', 25, 78, 74),
		('Nguyen Engineering Building', 1, '2022-10-30 09:39:17', 32, 76, 48),
		('Art and Design Building', 1, '2022-10-06 17:18:33', 86, 89, 68),
		('Nguyen Engineering Building', 2, '2022-04-26 15:05:19', 95, 90, 46),
		('Nguyen Engineering Building', 4, '2020-02-15 18:27:04', 52, 74, 69),
		('Horizon Hall', 2, '2021-06-06 13:43:51', 77, 85, 69),
		('Research Hall', 2, '2022-10-12 13:28:08', 50, 51, 45),
		('Research Hall', 2, '2022-06-14 16:10:04', 74, 92, 48),
		('Fenwick Building', 1, '2022-06-22 11:29:35', 53, 68, 85),
		('Entreprise Hall', 6, '2022-03-27 12:35:50', 47, 60, 60),
		('Art and Design Building', 1, '2021-02-19 18:28:35', 82, 64, 93),
		('Art and Design Building', 2, '2021-11-10 17:34:32', 82, 57, 74),
		('Entreprise Hall', 6, '2020-08-02 12:39:00', 31, 72, 54),
		('Fenwick Building', 4, '2021-11-20 14:15:51', 53, 95, 84),
		('Fenwick Building', 10, '2020-06-22 13:14:26', 67, 70, 74),
		('Exploration Hall', 4, '2022-05-07 16:03:19', 54, 98, 64),
		('Fenwick Building', 6, '2021-05-30 09:19:50', 87, 98, 58),
		('Entreprise Hall', 3, '2022-10-08 15:46:40', 73, 53, 68),
		('Art and Design Building', 1, '2020-03-16 14:08:56', 34, 89, 54),
		('Entreprise Hall', 3, '2022-01-06 17:03:29', 68, 63, 93),
		('Entreprise Hall', 3, '2020-01-17 17:10:44', 93, 98, 58),
		('Entreprise Hall', 8, '2020-01-07 12:20:35', 85, 78, 67),
		('Art and Design Building', 1, '2022-05-20 10:25:51', 25, 57, 75),
		('Horizon Hall', 2, '2022-05-22 11:58:39', 89, 85, 67),
		('Entreprise Hall', 2, '2021-07-24 12:43:37', 67, 65, 46),
		('Horizon Hall', 2, '2020-07-08 10:50:56', 98, 96, 88),
		('Nguyen Engineering Building', 4, '2021-10-14 16:45:27', 95, 90, 49),
		('Entreprise Hall', 2, '2020-03-14 18:09:52', 57, 56, 45),
		('Fenwick Building', 8, '2020-01-20 14:57:21', 56, 58, 100),
		('Exploration Hall', 5, '2022-12-24 15:42:14', 55, 52, 60),
		('Fenwick Building', 9, '2020-12-05 13:21:31', 96, 54, 84),
		('Aquia Building', 1, '2020-01-17 15:04:38', 83, 84, 95),
		('Fenwick Building', 3, '2020-01-20 15:00:13', 89, 94, 52),
		('Fenwick Building', 10, '2020-01-03 09:00:45', 89, 57, 58),
		('Entreprise Hall', 4, '2021-03-28 13:19:00', 51, 98, 82),
		('Research Hall', 3, '2022-03-08 10:37:03', 71, 81, 59),
		('Exploration Hall', 1, '2021-01-12 18:58:07', 85, 90, 92),
		('Entreprise Hall', 8, '2021-02-28 18:59:06', 83, 92, 59),
		('Entreprise Hall', 2, '2020-10-18 18:30:18', 34, 86, 50),
		('Art and Design Building', 2, '2022-04-27 09:16:59', 65, 54, 42),
		('Research Hall', 4, '2020-05-28 13:54:18', 45, 92, 92),
		('Entreprise Hall', 6, '2022-07-29 11:27:58', 81, 66, 92),
		('Research Hall', 3, '2021-09-28 17:55:43', 58, 90, 74),
		('Art and Design Building', 1, '2022-09-17 11:31:45', 30, 91, 72),
		('Entreprise Hall', 5, '2020-04-29 12:03:34', 77, 79, 99),
		('Exploration Hall', 7, '2020-01-15 09:03:49', 40, 99, 53),
		('Aquia Building', 4, '2022-03-28 13:06:55', 58, 100, 53),
		('Aquia Building', 7, '2022-06-02 11:42:38', 60, 97, 99),
		('Fenwick Building', 1, '2022-06-15 18:31:31', 84, 79, 84),
		('Aquia Building', 2, '2021-10-25 18:44:15', 56, 81, 54),
		('Fenwick Building', 11, '2020-09-22 13:11:47', 84, 77, 47),
		('Exploration Hall', 1, '2020-04-25 14:42:18', 61, 90, 58),
		('Nguyen Engineering Building', 1, '2022-01-15 18:28:52', 51, 53, 51),
		('Nguyen Engineering Building', 4, '2022-04-14 13:04:06', 42, 89, 87),
		('Aquia Building', 7, '2022-12-12 10:28:12', 82, 57, 40),
		('Nguyen Engineering Building', 1, '2022-05-04 17:12:49', 25, 99, 45),
		('Entreprise Hall', 5, '2021-09-11 13:42:41', 59, 96, 69),
		('Exploration Hall', 8, '2022-10-02 13:17:53', 67, 79, 46),
		('Nguyen Engineering Building', 2, '2022-03-26 17:12:48', 81, 55, 62),
		('Fenwick Building', 6, '2020-05-16 13:03:15', 62, 77, 42),
		('Aquia Building', 7, '2022-07-03 13:52:27', 41, 53, 60),
		('Fenwick Building', 8, '2021-04-30 14:52:31', 69, 85, 67),
		('Exploration Hall', 7, '2022-05-06 15:23:28', 91, 54, 89),
		('Nguyen Engineering Building', 3, '2022-10-09 10:26:50', 71, 65, 54),
		('Horizon Hall', 1, '2022-08-23 09:03:36', 66, 88, 54),
		('Horizon Hall', 3, '2020-04-19 16:21:56', 33, 61, 61),
		('Horizon Hall', 4, '2020-04-15 17:41:26', 64, 54, 74),
		('Aquia Building', 6, '2022-03-05 16:28:41', 82, 74, 49),
		('Exploration Hall', 6, '2022-09-03 13:24:02', 97, 100, 95),
		('Exploration Hall', 8, '2021-08-03 11:02:48', 48, 74, 63),
		('Entreprise Hall', 4, '2021-01-12 17:57:14', 52, 55, 95),
		('Fenwick Building', 3, '2020-05-17 11:52:04', 26, 67, 49),
		('Art and Design Building', 2, '2020-10-05 18:26:30', 60, 74, 58) ;





-- SQL QUERIES -----------------------------------------------------------------------------------------------------------------------------


-- 1. List the phone number and department name and street address for each department. 
SELECT DeptPhone, DeptName, DeptAddStreet, DeptAddCity, DeptAddState, DeptAddZip FROM sgoswam.Department;

-- 2. Count the number of rooms for each building.
SELECT Bldgname, COUNT(RoomNo) FROM sgoswam.Room GROUP BY BldgName;

-- 3. Find the building name and the room number of each lab that is also used as office.
SELECT BldgName, RoomNo, RoomLabFlag, RoomConferenceFlag FROM sgoswam.Room WHERE RoomLabFlag = 1 AND RoomConferenceFlag =1;

-- 4. Find the average temperature for each room.
SELECT BldgName, RoomNo, AVG(MeasTemperature) FROM sgoswam.Measurement GROUP BY BldgName, RoomNo;

-- 5. Find the area of each conference room that hasn’t had any temperature recorded yet.
SELECT R.BldgName, R.RoomNo, R.RoomArea, M.MeasTemperature FROM sgoswam.Room R 
	LEFT JOIN sgoswam.Measurement M ON R.bldgname = M.bldgname AND R.RoomNo = M.RoomNo
    WHERE M.measTemperature IS NULL;

-- 6. Find the id of each employee who has exactly two email addresses.
SELECT EmpID, COUNT(EmpEmail) NoOfEmailIDs FROM sgoswam.EmployeeEmail GROUP BY EmpID HAVING NoOfEmailIDs = 2;