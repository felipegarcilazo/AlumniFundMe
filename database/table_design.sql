/*Strong Entities*/
CREATE TABLE user (
userID INT(10) AUTO_INCREMENT,
firstName VARCHAR(64) NOT NULL,
lastName VARCHAR(64) NOT NULL,
studentAlumni VARCHAR(16) NOT NULL,
dateOfBirth DATE NOT NULL,
streetAddress VARCHAR(128) NOT NULL,
zipAddress INT(5) NOT NULL,
stateAddress VARCHAR(32) NOT NULL,
accountPayPal VARCHAR(1024),
accountPayPalAuthentication VARCHAR(1024),
accountGoogle VARCHAR(1024) NOT NULL,
gender VARCHAR(16) NOT NULL,
email VARCHAR(64) NOT NULL,
PRIMARY KEY (userID)
)
ENGINE=InnoDB;

CREATE TABLE userCollege (
userID INT(10) NOT NULL,
collegeName INT(11) NOT NULL,
degree VARCHAR(128) NOT NULL,
degreeType VARCHAR(128) NOT NULL,
yearBegin INT(4) NOT NULL,
yearEnd INT(4),
transcriptProof VARCHAR(1024) NOT NULL,
FOREIGN KEY (userID) REFERENCES user(userID)
)
ENGINE=InnoDB;

CREATE TABLE userPhone (
userID INT(10) NOT NULL,
phone INT(11) NOT NULL,
FOREIGN KEY (userID) REFERENCES user(userID)
)
ENGINE=InnoDB;

CREATE TABLE review (
reviewID INT(10) AUTO_INCREMENT,
userReviewing INT(10) NOT NULL,
userReviewer INT(10) NOT NULL,
reviewTime TIME NOT NULL,
reviewDate DATE NOT NULL,
starRating INT(1) NOT NUll,
comment VARCHAR(256),
FOREIGN KEY (userReviewing) REFERENCES user(userID),
FOREIGN KEY (userReviewer) REFERENCES user(userID),
PRIMARY KEY (reviewID)
)
ENGINE=InnoDB;

CREATE TABLE message (
messageID INT(10) AUTO_INCREMENT,
messageSentTime TIME NOT NULL,
messageSentDate DATE NOT NULL,
messageReadTime TIME NOT NULL,
messageReadDate DATE NOT NULL,
userSent INT(10) NOT NULL,
userRecieve INT(10) NOT NULL,
messageContent VARCHAR(1024) NOT NULL,
FOREIGN KEY (userSent) REFERENCES user(userID),
FOREIGN KEY (userRecieve) REFERENCES user(userID),
PRIMARY KEY (messageID)
)
ENGINE=InnoDB;

CREATE TABLE report (
reportID INT(10) AUTO_INCREMENT,
reportTime TIME NOT NULL,
reportDate DATE NOT NULL,
reportType VARCHAR(128) NOT NULL,
reportAction VARCHAR(128) NOT NULL,
reportReasoning VARCHAR(128) NOT NULL,
reportInformation VARCHAR(1024) NOT NULL,
userReporting INT(10) NOT NULL,
userReported INT(10) NOT NULL,
FOREIGN KEY (userReporting) REFERENCES user(userID),
FOREIGN KEY (userReported) REFERENCES user(userID),
PRIMARY KEY (reportID)
)
ENGINE=InnoDB;

CREATE TABLE scholarship (
scholarshipID INT(10) AUTO_INCREMENT,
scholarshipName Varchar(256),
paymentTime TIME NOT NULL,
paymentDate DATE NOT NULL,
scholarshipAmount INT(6) NOT NULL,
paymentStatus VARCHAR(16),
PRIMARY KEY (scholarshipID)
)
ENGINE=InnoDB;

/*Connections linking strong Entities*/
CREATE TABLE userPayment (
userTo INT(10) NOT NULL,
userFrom INT(10) NOT NULL,
paymentID INT(10) NOT NULL,
FOREIGN KEY (userTo) REFERENCES user(userID),
FOREIGN KEY (userFrom) REFERENCES user(userID),
FOREIGN KEY (scholarshipID) REFERENCES payment(scholarshipID)
)
ENGINE=InnoDB;
