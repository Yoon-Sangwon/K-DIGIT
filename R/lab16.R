library(dplyr)
emp <- read.csv(file = "data/emp.csv")
head(emp)
str(emp)

# 문제 1
emp %>% filter(job == "MANAGER")

# 문제 2
head(emp %>% select(empno, ename, sal))

# 문제 3
head(emp %>% select(!empno))

# 문제 4
head(emp %>% select(ename, sal))

# 문제 5
emp %>% count(job)

# 문제 6
emp %>% filter(sal >= 1000, sal <= 3000) %>%
  select(ename, sal, deptno)

# 문제 7
emp %>% filter(job != "ANALYST") %>%
  select(ename, job, sal)

# 문제 8
emp %>% filter(job == "SALESMAN" | job == "ANALYST") %>%
  select(ename, job)

# 문제 9
emp %>%
  group_by(job) %>% summarise(mean = mean(sal))

# 문제 10
emp %>% arrange(sal)

# 문제 11
emp %>% filter(sal == max(sal))

# 문제 12
empnew <- emp %>% select(empno, ename, job, mgr, hiredate, salary = sal, commrate = comm, deptno)
head(empnew)

# 문제 13
emp_count <- emp %>% count(job)
emp %>% filter(job == emp_count$job[emp_count$n == max(emp_count$n)]) %>%
  select(job, deptno)

# 문제 14
emp %>% mutate(enamelength = nchar(ename)) %>%
  arrange(enamelength, ename) %>% select(ename)

# 문제 15
emp %>% filter(!is.na(comm)) %>% count()
