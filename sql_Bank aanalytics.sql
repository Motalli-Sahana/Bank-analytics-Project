create database Bank_Analytics_Project;

select * from finance_1_new;
select * from finance_2_new;

select count(*) from finance_1_new;
select count(*) from finance_2_new;

#KPI 1: Year wise loan amount stats

select year(issue_d) as Year_Of_Loan_Iss, sum(loan_amnt) as Total_Loan
from finance_1_new
group by Year_Of_Loan_Iss
order by Year_Of_Loan_Iss;


# KPI 2: grade and sub grade wise revol-balance

select grade, sub_grade,sum(revol_bal) as Total_revol_bal
from finance_1_new f1 inner join finance_2_new f2 on f1.id=f2.id
group by grade, sub_grade
order by grade, sub_grade; 

# KPI 3: total payment for verified status v/s total payment for non verified status

select verification_status
,concat("$", format(sum(total_pymnt)/1000000,2),"M") as total_pymnt
from finance_1_new inner join finance_2_new
on (finance_1_new.id=finance_2_new.id)
group by verification_status;


# KPI 4: state wise and month wise loan status

select addr_State,last_Credit_pull_D,loan_Status
from bank_analytics_project.finance_1_new inner join bank_analytics_project.finance_2_new on (finance_1_new.id=finance_2_new.id)
group by addr_State,last_Credit_pull_D,loan_Status
order by last_Credit_pull_D;



