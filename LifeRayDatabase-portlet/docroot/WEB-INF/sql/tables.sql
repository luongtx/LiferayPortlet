create table SAMPLE_Student (
	studentId LONG not null primary key,
	code VARCHAR(75) null,
	fullName VARCHAR(75) null,
	birthday DATE null,
	gender BOOLEAN,
	address VARCHAR(75) null
);

create table tblStudent (
	studentId LONG not null primary key,
	code VARCHAR(75) null,
	fullName VARCHAR(75) null,
	birthday DATE null,
	gender VARCHAR(75) null,
	address VARCHAR(75) null
);