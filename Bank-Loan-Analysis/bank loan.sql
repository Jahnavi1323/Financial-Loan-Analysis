create database bank;
use bank;
select * from financial_loan;
--SUMMARY
--1.Previous Month TO Date Total Loan Applications--
select count(id) as PMTD_Total_Lon_Applications from financial_loan 
where MONTH(issue_date)=11 and year(issue_date)=2021;

--2.Previous Month TO Date Total funded amount--
select sum(loan_amount) as PMTD_Total_Funded_Amount from financial_loan
where MONTH(issue_date)=11 and year(issue_date)=2021;

--3.Previous Month TO Date Total Amount Received Amount--
select sum(total_payment) as PMTD_Total_Received_Amount from financial_loan
where MONTH(issue_date)=11 and year(issue_date)=2021;

--4.Previous Month TO Date Average Interest Rate
select ROUND(avg(int_rate)*100,2) as PMTD_Average_Interest_Rate from financial_loan
where MONTH(issue_date)=11 and year(issue_date)=2021;

--5.Previous_Month TO Date Average Debt-to-Income Ratio (DTI)
select Round(avg(dti)*100,2) as PMTD_Average_debt_to_Income_Ratio from financial_loan
where MONTH(issue_date)=11 and year(issue_date)=2021;

--Good Loan KPI's
--1.Good Loan Application Percentage
select (count(CASE WHEN loan_status='Fully Paid' or loan_status='Current' then id end)*100.0)
/
count(id) as good_loan_application_percentage from financial_loan;

--2.Good Loan Applications:
select count(id) as good_loan_applications from financial_loan
where loan_status='Fully Paid' or loan_status='Current';

--3.Good Loan Funded Amount
select sum(loan_amount) as good_loan_funded_amount from financial_loan
where loan_status='Fully Paid' or loan_status='Current';

--4.Good Loan Total Received Amount
select sum(total_payment) as good_loan_received_amount from financial_loan
where loan_status='Fully Paid' or loan_status='Current';

--Bad Loan KPI's
--1.Bad Loan Application Percentage
select (count(CASE WHEN loan_status='Charged Off'  then id end)*100.0)
/
count(id) as bad_loan_application_percentage from financial_loan;

--2.Bad Loan Applications:
select count(id) as bad_loan_applications from financial_loan
where loan_status='Charged Off' ;

--3.Bad Loan Funded Amount
select sum(loan_amount) as bad_loan_funded_amount from financial_loan
where loan_status='Charged Off';

--4.Bad Loan Total Received Amount
select sum(total_payment) as bad_loan_received_amount from financial_loan
where loan_status='Charged Off';

--OVERVIEW
--1.Monthly Trends
select loan_status,
count(id) as Total_Loan_Applications,
sum(loan_amount) as Total_Funded_Amount,
sum(total_payment) as Total_Received_Amount,
(avg(int_rate)*100) as Interest_Rate,
(avg(dti)*100) as Debt_to_income_Ratio
from
financial_loan
group by loan_status;

--Month To Date Trends
select loan_status,
sum(loan_amount) as MTD_Total_Funded_Amount,
sum(total_payment) as MTD_Total_Received_Amount
from financial_loan where month(issue_date)=12 and year(issue_date)=2021
group by loan_status;


--Month wise Trends
select
month(issue_date) as Month_Number, datename(month,issue_date) as Month_Name,
count(id) as Total_Loan_Applications,
sum(loan_amount) as Total_Funded_Amount,
sum(total_payment) as Total_Received_Amount,
(avg(int_rate)*100) as Interest_Rate,
(avg(dti)*100) as Debt_to_income_Ratio
from
financial_loan
group by month(issue_date),datename(month,issue_date)
order by month(issue_date),datename(month,issue_date);

--2.STATE TRENDS
select address_state as State,
count(id) as Total_Loan_Applications,
sum(loan_amount) as Total_Funded_Amount,
sum(total_payment) as Total_Received_Amount,
(avg(int_rate)*100) as Interest_Rate,
(avg(dti)*100) as Debt_to_income_Ratio
from
financial_loan
group by address_state
order by address_state;

--3.Term Analysis
select term as loan_term,
count(id) as Total_Loan_Applications,
sum(loan_amount) as Total_Funded_Amount,
sum(total_payment) as Total_Received_Amount,
(avg(int_rate)*100) as Interest_Rate,
(avg(dti)*100) as Debt_to_income_Ratio
from
financial_loan
group by term
order by term;

--4.Employee Length Analysis
select emp_length as Employee_length,
count(id) as Total_Loan_Applications,
sum(loan_amount) as Total_Funded_Amount,
sum(total_payment) as Total_Received_Amount,
(avg(int_rate)*100) as Interest_Rate,
(avg(dti)*100) as Debt_to_income_Ratio
from
financial_loan
group by emp_length
order by emp_length;

--5.Loan Purpose Breakdown
select purpose as loan_purpose,
count(id) as Total_Loan_Applications,
sum(loan_amount) as Total_Funded_Amount,
sum(total_payment) as Total_Received_Amount,
(avg(int_rate)*100) as Interest_Rate,
(avg(dti)*100) as Debt_to_income_Ratio
from
financial_loan
group by purpose
order by purpose;

--6.Home Ownership Analysis
select home_ownership as Home_Ownership,
count(id) as Total_Loan_Applications,
sum(loan_amount) as Total_Funded_Amount,
sum(total_payment) as Total_Received_Amount,
(avg(int_rate)*100) as Interest_Rate,
(avg(dti)*100) as Debt_to_income_Ratio
from
financial_loan
group by home_ownership
order by home_ownership;

--Month to Date Total Loan Applications--
select count(id) as MTD_Total_Loan_Applications from financial_loan 
where month(issue_date)=12 ;
