Create table names(
    name varchar2(10),
    primary key(name)
);

Insert into names values('rohan');
Insert into names values('sanju');
Insert into names values('rakshita');
Insert into names values('nischita');

Create table rollnumber(
    rollno number(4),
    name varchar2(10),
    primary key(name)
);