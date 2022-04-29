CREATE DATABASE statistc;
 
CREATE Table statistc.requestInfo (
    requestID numeric NOT NULL primary key,
    requestCode varchar(5) NOT NULL,
    userID varchar(5),
    createDate varchar(10)
);
 
CREATE table statistc.requestCode (
    requestCode varchar(5) NOT NULL primary key,
    code_explain varchar(50) NOT NULL
);
 
CREATE table statistc.user (
    userID varchar(5) NOT NULL primary key,
    HR_ORGAN varchar(5) NOT NULL,
    USERNAME varchar(5) NOT NULL
);
 

INSERT INTO statistc.requestInfo(requestID, requestCode, userID, createDate)
VALUES(1, 'L', 'AAA', '2008180520'),
(2, 'O', 'DDD', '2004040404'),
(3, 'L', 'BBB', '2006220920'),
(4, 'L', 'CCC', '1906220920');

CREATE table statistc.login (
    userID varchar(5)  NOT NULL,
    loginDate varchar(10)NOT NULL
);

INSERT INTO statistc.login(userID, loginDate)
VALUES(1, '2008180520'), (1, '2010201620'), (1, '2012220920'), (1, '2101040630'), (1, '2108170821'), 
(2, '2004040404'),(2, '2011050505'),(2, '2012121212'),(2, '2101040630'),(2, '2104040404'),
(3, '2006220920'), (3, '2007220704'),(3,'2108170808'),
(4, '1906220920'), (4, '1907231020'), (4, '2007231020');

select * from statistc.login;
INSERT INTO statistc.user(userID, HR_ORGAN, USERNAME)
VALUES(1, '인사팀', '홍길동'),
(2, '개발팀', '강감찬'),
(3, '인사팀', '박수진'),
(4, '홍보팀', '강감찬');

select * from statistc.user;

select * from statistc.requestInfo;

select count(*) as totCnt from statistc.login ri where left(ri.loginDate, 2) = 20;

select count(*) as totCnt from statistc.login ri where  SUBSTRING(ri.loginDate, 3,2) = 1;

select count(*) as totCnt from statistc.login ri LEFT JOIN statistc.user le ON ri.userID = le.userID where SUBSTRING(ri.loginDate, 3,2) = 4 and le.HR_ORGAN = "Dev";

select count(*) as BusinessDay from statistc.login ri where weekday(left(ri.loginDate, 6)) >= 0 and weekday(left(ri.loginDate, 6)) <= 4;






  