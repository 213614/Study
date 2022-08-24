
i:\java202207\database\20220823_01emp���̺���.sql
////////////////////////////////////////////////////////////////////////////////
drop table emp;

-- ��1) emp ������̺��� �����Ͻÿ�
create table emp(
  empno       number(4)     primary key     -- ���(-9999~9999)   : ������ 4�ڸ� ���ڸ� ����
  ,ename      varchar2(50)                  -- �̸�               : ������
  ,job        varchar2(10)                  -- ����
  ,mgr        number(4)                     -- �Ŵ�������          : �μ� ����� �����ȣ
  ,hiredate   date                          -- �Ի���
  ,sal        number(7,2)                   -- �޿�(�Ҽ��� 2�ڸ�)   : 7�ڸ� ���ڸ�(�Ҽ����� 2�ڸ�������)
  ,comm       number(7,2)                   -- Ŀ�̼�(���ʽ�)
  ,deptno     number(2)                     -- �μ��ڵ�(-99~99)
);


-- ��2) emp������̺� ���� �߰��Ͻÿ�
insert into emp(empno, ename, job, mgr, hiredate, sal, deptno)
values(7369, '������', '���', 7902, '2000-12-17', 200, 20);

insert into emp(empno, ename, job, mgr, hiredate, sal, deptno)
values(7499, '���޷�', '����', 7698, '2001-12-15', 360, 20);

insert into emp(empno, ename, job, mgr, hiredate, sal, deptno)
values(7521, '���϶�', '����', 7698, '2001-02-17', 355, 30);

insert into emp(empno, ename, job, mgr, hiredate, sal, deptno)
values(7654, '�����', '����', 7839, '2002-01-11', 400, 30);

insert into emp(empno, ename, job, mgr, hiredate, sal, deptno)
values(7698, '������', '����', 7698, '2000-07-12', 325, 20);

insert into emp(empno, ename, job, mgr, hiredate, sal, deptno)
values(7782, '�迬��', '���', 7698, '2001-12-17', 225, 10);

insert into emp(empno, ename, job, mgr, hiredate, sal, deptno)
values(7778, '����ȭ', '���', 7839, '2005-11-14', 200, 10);

insert into emp(empno, ename, job, mgr, hiredate, sal, deptno)
values(7839, 'ȫ�浿', '����', 7566, '2006-06-17', 450, 20);

insert into emp(empno, ename, job, mgr, hiredate, sal, deptno)
values(7844, '�۰�ȣ', '����', 7566, '2018-09-17', 400, 30);

insert into emp(empno, ename, job, mgr, hiredate, sal, deptno)
values(7876, '���켺', '��ǥ', 7839, '2004-09-09', 500, 30);

insert into emp(empno, ename, job, mgr, hiredate, sal, deptno)
values(7900, '������', '���', 7902, '2001-12-03', 200, 20);
////////////////////////////////////////////////////////////////////////////////
select*from emp;

-- ��3) ��ü ���� ������ ��ȸ�Ͻÿ�
select count(*) cnt
from emp;

-- ��4) ���̺��� Į��(�ʵ�) ����� Ȯ���Ͻÿ�
select * from emp;

-- ��5) ����̸���(��������) �����Ͻÿ�
select ename
from emp
order by ename;

-- ��6) ����̸���(��������) �����Ͻÿ�
select ename
from emp
order by ename desc;

-- ��7) �޿� ������������ ����̸�(ename), �޿�(sal), �μ��ڵ�(deptno)�� ��ȸ�Ͻÿ�
select ename, sal, deptno
from emp
order by sal desc;

-- ��8) �μ��ڵ� ��������, �޿� ������������
--      ����̸�(ename), �޿�(sal), �μ��ڵ�(deptno)�� ��ȸ�Ͻÿ�
select ename, sal, deptno
from emp
order by deptno asc, sal desc;     
     
-- ��9) �̸�(ename)/�Ի�����(hiredate)/�μ��ڵ�(deptno)��
--       �μ��ڵ� ��������, �Ի�����(hiredate) ������������ ��ȸ�Ͻÿ�
select ename, hiredate, deptno
from emp
order by deptno, hiredate;

-- ��10) ����(job) Į���� �ߺ������͸� �ϳ����� ��ȸ�Ͻÿ�
select job
from emp
group by job;

select distinct(job) from emp;

-- ��11) emp���̺��� job ��������, sal ������������ �����ؼ�
--       ename �̸�, job ����, sal �޿� Į�������� ��Ī�� �ٲ㼭 ��ȸ�Ͻÿ�
select ename �̸�, job ����, sal �޿� 
from emp
order by job, sal desc;

-- ��12) �޿��� 100���� ���� 400���� ���� ���� ��ȸ�ϱ�(�޿� ��������)
select ename, sal
from emp
where sal>100 and sal<400
order by sal desc;

select ename, sal
from emp
where sal between 100 and 400       -- sal>=100 and sal<=400 �϶�
order by sal desc;

-- ��13) �޿��� 100���� �Ǵ� 400 �̻��� ���� �˻��ϱ�(�޿� ��������)
select ename, sal
from emp
where sal<=100 or sal>=400
order by sal desc;

-- ��14) ����(job)�� ���� �Ǵ� ������ �������� �̸������� ��ȸ�Ͻÿ�
select ename, job
from emp
where job in ('����','����')        -- where job='����' or job='����'
order by ename;

-- ��15) �μ��ڵ�(deptno)�� 30�� ������ ��ȸ�Ͻÿ�
select ename, deptno
from emp
where deptno=30;
-- deptno in (30)

-- ��16) �ߺ��� �μ��ڵ带 �Ѱ����� ��ȸ�Ͻÿ�
select deptno from emp group by deptno;

select distinct(deptno) from emp;

-- ��17) �μ��ڵ尡 10 �Ǵ� 20 �Ǵ� 30�� ������ ��ȸ�Ͻÿ�
--       (or, in������ ���� Ȱ���ؼ� ��ȸ)
select ename, deptno
from emp
where deptno in (10, 20, 30)
-- where deptno=10 or deptno=20 or deptno=30
order by deptno;

-- ��18) �޿��� 300~500�� ������ �޿������� ��ȸ�Ͻÿ�
--       (and, between������ ���� Ȱ���ؼ� ��ȸ)
select ename, sal
from emp
where sal between 300 and 500
-- where sal>=300 and sal<=500
order by sal;

-- ��19) �̸��� ����ȭ ��ȸ�Ͻÿ�
select *
from emp
where ename='����ȭ';

-- ��20) �达���� ��ȸ�Ͻÿ�
select *
from emp
where ename like '��%'

-- ��21) �̸��� 'ȭ' ���Ե� ���� ��ȸ�Ͻÿ�
select *
from emp
where ename like '%ȭ%'

-- ��22) �μ��ڵ尡 20�� ���ڵ忡 ���ؼ�
--       �޿��� 1%�� Ŀ�̼����� å���Ͻÿ�
-- 1)
update emp
set comm=sal*0.01
where deptno=20;
-- 2)
select ename, deptno, sal, comm 
from emp
where deptno=20
order by ename;
-- ���Ż��� drop table emp;

-- ����� �ڵ�
-- 1) ��ȸ
select deptno, sal, comm from emp;
-- 2)  
update emp set comm = sal*0.01 where deptno=20;

-- ��23) ������ �Ʒ��� ���� ������ �̸�, �μ�, �޿�, Ŀ�̼�, ������ ��ȸ�Ͻÿ�
--       �������ϴ� �� : �޿�(sal)*12����+���ʽ�(comm)
-- 1)
alter table emp add (year_sal number(7,2));
-- 2)
update emp set year_sal=((sal*12)+nvl(comm,0));
-- 3)
select ename, deptno, sal, comm, year_sal
from emp;
-- ���Ż��� alter table emp drop(year_sal);

-- ����� �ڵ�
-- ���������� Į���� �߰����� �ʴ��� as����ؼ� �������̺�� ���� �� ����
-- ����+������ select���� �ϴ°ű���...
select ename, deptno, sal, sal*12+comm as ����
from emp;

-- ��24) Ŀ�̼��� null�̸� 0���� �ٲ��� ������ �ٽ� ����ؼ�
--       �̸�, �޿�, Ŀ�̼�, ������ ��ȸ�Ͻÿ�
select ename, deptno, nvl(comm,0)as comm, year_sal
from emp;

-- ����� �ڵ�
-- 1) Ŀ�̼��� null���� ���� ���� ��ȸ
select ename, comm from emp where comm is null;
-- 2) commĮ���� null���� 0���� �ٲٱ�
select ename, nvl(comm,0) comm
from emp
where comm is null;
-- 3) ���� ���
select ename, deptno, sal, nvl(comm,0) comm, sal*12+nvl(comm,0) as ����
from emp

-- ��24-1) ������ �ݿø��ؼ� �Ҽ������� ��ȸ
select ename, deptno, nvl(comm,0)as comm, round(year_sal,0)
from emp;
-- ���� �ִ� ����� �ڵ�� ���� Ǯ���
select ename, deptno, sal, nvl(comm,0) comm, round(sal*12+nvl(comm,0),0) as ����
from emp;

-- ����� �ڵ�
select ename, deptno, sal, nvl(comm,0) comm, round(sal*12+nvl(comm,0),0) as ����
from emp;

-- ��25) �� ����� �޿��� �˻��ؼ� '���������� �޿��� ���Դϴ�'�� ��ȸ�Ͻÿ�
--       (|| ���տ�����) / concat ����ص� ��
select ename || '�� �޿��� ' || sal || ' �Դϴ�.' as paylist from emp order by sal;   

-- ������ �켱����
() ��ȣ : ������ �켱�������� �켱��
1���� : �񱳿�����, SQL������, ���������
2���� : not
3���� : and
4���� : or
5���� : ���տ�����   

-- ��26) emp���̺��� �Ի���(hiredate)�� 2005�� 1�� 1�� ������ ����� ����
--       ����� �̸�(ename), �Ի���, �μ���ȣ(deptno)�� �Ի��ϼ����� ��ȸ�Ͻÿ�
select ename, hiredate, deptno
from emp
where hiredate <= '2005/01/01'
order by hiredate;

-- ��27) emp���̺��� �μ���ȣ�� 20���̳� 30���� �μ��� ����
--      ����鿡 ���Ͽ� �̸�, �����ڵ�(job), �μ���ȣ�� �̸������� ��ȸ�Ͻÿ�
--      (or, in������ ���� Ȱ���ؼ� ��� ��ȸ)
select ename, job, deptno
from emp
where deptno in (20,30)
--where deptno=20 or deptno=30
order by ename;

-- ��28) ���, �̸�, �μ��� ��ȸ�Ͻÿ�
--       (��, �μ��ڵ尡 10�̸� ������
--                      20�̸� ������
--                      30�̸� �����η� �ٲ㼭 ���)
select empno, ename, case when deptno=10 then '������'         -- �����ڵ�
                          when deptno=20 then '������'
                          when deptno=30 then '������'
                     end �μ�
from emp
order by �μ�;

-- ��29) ������ SQL���� �м��Ͻÿ�
      select empno, sal 
      from emp
      where not(sal>200 and sal<300)
      order by sal;
: �޿��� 201~299 ���̰� ���ƴѣ� �������� �����ȣ�� �޿� ��ȸ�Ͽ� �޿� ������������ ��ȸ
: = �޿��� 200���� , 300 �ʰ��� ���ڵ� ��ȸ 

-- ��30) ������ SQL���� �м��Ͻÿ�c 
      select empno, sal 
      from emp
      where not sal>200 and sal<300
      order by sal;
: �޿��� 200~299 �������� �����ȣ�� �޿� ��ȸ�Ͽ� �޿� ������������ ��ȸ
: = �޿��� 200�̻�, 300�̸��� ���ڵ� ��ȸ

�� ��ȣ�� ��ġ�� �߿�. not (A and B) : A�� B��� ���� / not A and B : A�� ���� �׸��� B
//////////////////////////////////////////////////////////////////////////////////////////////////////
select*from emp;

[emp���̺� ���� ��������]


-- ��31) �μ��ڵ庰 �޿��հ踦 ���Ͻÿ�
select deptno, sum(sal) as hap
from emp 
group by deptno
order by deptno;

-- ��32) �μ��ڵ庰 �޿��հ踦 ���ؼ�  �� �հ谪�� 1500�̻� ��ȸ�Ͻÿ�
select deptno, sum(sal) as hap
from emp 
group by deptno
having sum(sal)>=1500
order by deptno;

-- ����� �ڵ�                    �������
select deptno, sum(sal)          -- 4
from emp                         -- 1
group by deptno                  -- 2
having sum(sal)>=1500;           -- 3

-- ��33) �μ��� �޿������ 300�̻� ��ȸ�Ͻÿ�
select deptno, avg(sal) as aver
from emp
group by deptno
having 300 <= avg(sal);

-- ����� �ڵ�
select deptno, avg(sal)
from emp
group by deptno
having avg(sal)>=300;

-- ��34) �޿��� 300�̻� �������߿��� �μ��ڵ庰 �޿������ ���ؼ� �޿���ռ����� ��ȸ�Ͻÿ�
select deptno, avg(sal) as aver
from emp
where sal>=300
group by deptno
order by avg(sal);

-- ��35) �޿��� 300�̻� �������߿��� �μ��ڵ庰 �޿������ 400�̻��� �޿������� ��ȸ�Ͻÿ�
select deptno, avg(sal) as aver
from emp
where sal>=300
group by deptno
having avg(sal)>=400
order by avg(sal);

-- ��36) hiredateĮ���� ����Ͽ� ������ �Ի��� �ο����� ���Ͻÿ�
select extract(month from hiredate) as month, count(*) cnt
from emp
group by extract(month from hiredate)
order by extract(month from hiredate);

-- ����� �ڵ� / ��ȯ�Լ� to_char(������¥, '���ϴ¸��')
-- 1) �Ի��� ��ȸ
select hiredate from emp;
-- 2) �Ի��Ͽ��� ���� ����
select to_char(hiredate,'mm') as month from emp;

select to_char(hiredate,'yy') as year from emp;
select to_char(hiredate,'dd') as day from emp;
-- 3) ���� �Ի��ο�
select to_char(hiredate,'mm') as month, count(*) cnt 
from emp 
group by to_char(hiredate,'mm')
order by count(*);

-- ��37) �Ŵ����� ����ο����� ��ȸ�Ͻÿ� (mgr:�μ� ����� �����ȣ)
select count(*) cnt, mgr
from emp
group by mgr
order by count(*);

-- ��38) �����ȣ 7654�� �޿����� ���� ���� ��ȸ�Ͻÿ�
-- 1)
select sal from emp where empno=7654;       -- 400
-- 2)
select empno, ename, job, mgr, hiredate, sal, deptno
from emp
where sal < (select sal from emp where empno=7654)
order by sal;

-- ��39) �μ����� �޿�+Ŀ�̼Ǹ� ��������  �ִ밪, �ּҰ�, ��հ�(�ݿø� �ؼ�)�� �μ������� ��ȸ�Ͻÿ�
select deptno, max(sal+nvl(comm,0)) as max
             , min(sal+nvl(comm,0)) as min
             , round(avg(sal+nvl(comm,0))) as aver
from emp
group by deptno
order by deptno;

-- �� DB���� ������ �� �ִ� �͵��� �ִ������� �����ϰ� JAVA�� �Űܼ� JAVA���� ���ڰ� �����ϴ°� �ӵ��� ����(�ڹٿ��� ������ �ʿ�X)

-- ��40) �� �����鿡 ���ؼ� ������ �̸��� �ټӳ���� ���Ͻÿ�
--       ��, �ټӳ���� �������� �����Ͽ� ��Ÿ���ÿ�
-- ��� 1
select ename, hiredate, extract(year from sysdate)-extract(year from hiredate) as �ټ� 
from emp
order by hiredate desc;
-- ��� 2 
select ename, hiredate, to_char(sysdate,'yy') - to_char(hiredate,'yy') as �ټ�
from emp
order by hiredate desc;

-- ����� �ڵ� : ���糯¥ - �Ի��� / 365 
select ename, hiredate, trunc((sysdate-hiredate)/365,0) as �ټ� 
from emp 
order by trunc((sysdate-hiredate)/365,0) desc ;
-- ���� ���� �ٸ� : �Ϲݱ� �Ի�� �������εǰ����� -1�� ���� �׳� ������ ������ ����� 

-- ��41) �Ʒ��� ���� ��� �Ͻÿ�
--       ��) �������� �ټӳ�� : 20��
select concat(ename,'�� �ټӳ��:') as �̸�,concat(extract(year from sysdate)-extract(year from hiredate),'��') as �ټ�
from emp;

-- ����� �ټ� �������� 
select concat(ename,'�� �ټӳ��:') as �̸�, concat(trunc((sysdate-hiredate)/365,0),'��') as �ټ�
from emp;

-- ��42) ������� �ټӳ���� ������ ���� ��ȸ(�̸�, �ټӳ��)�Ͻÿ�
-- 1) ����� �ټӳ��
select extract(year from sysdate)-extract(year from hiredate)as �ټ� from emp where ename='�����';
-- 2)
select ename, extract(year from sysdate)-extract(year from hiredate)as �ټ�
from emp
where extract(year from sysdate)-extract(year from hiredate) 
      = (select extract(year from sysdate)-extract(year from hiredate)as �ټ� from emp where ename='�����');

-- ����� �ټ� �������� 
-- 1) 
select trunc((sysdate-hiredate)/365,0) as �ټ� from emp where ename='�����';
-- 2)
select ename, trunc((sysdate-hiredate)/365,0) as �ټ�
from emp
where trunc((sysdate-hiredate)/365,0) 
      = (select trunc((sysdate-hiredate)/365,0) as �ټ� from emp where ename='�����');

-- ��43) �Ի����� ��15�� �̻�� ����� ���� ���翬������ 10% �λ������ �� 
--       ���, �̸�, �Ի���, ���翬��, �λ��Ŀ���, �λ�ȱݾ����� ��׿��������� ��ȸ�Ͻÿ�
--       �������ϴ� �� : �޿�(sal)*12����+���ʽ�(comm)
-- ��� 1 
select empno, ename, hiredate
     , sal*12+nvl(comm,0) as ���翬��
     ,(sal*12+nvl(comm,0))*0.1 as �λ�ȱݾ�  
     , sal*12+nvl(comm,0) + (sal*12+nvl(comm,0))*0.1 as �λ��Ŀ���
from emp
where extract(year from sysdate)-extract(year from hiredate)-1>=15
order by sal*12+nvl(comm,0) + (sal*12+nvl(comm,0))*0.1 desc;
-- ��� 2 (Į�� ���� �߰��ϴ°Ŷ� ������ ����)
--1)
alter table emp add (year_sal_up number(7,2));
-- 2)
update emp set year_sal_up=((sal*12+nvl(comm,0))*0.1));
-- 3)
select ename, deptno, sal, comm, year_sal as present , year_sal_up as up, year_sal+year_sal_up as finalpay
from emp;

-- ����� �ټ� �������� 
select empno, ename, hiredate
     , sal*12+nvl(comm,0) as ���翬��
     ,(sal*12+nvl(comm,0))*0.1 as �λ�ȱݾ�  
     , sal*12+nvl(comm,0) + (sal*12+nvl(comm,0))*0.1 as �λ��Ŀ���
from emp
where trunc((sysdate-hiredate)/365,0) >= 15
order by sal*12+nvl(comm,0) + (sal*12+nvl(comm,0))*0.1 desc;


-- ��44) �Ի�⵵�� ¦���� �������� �޿��� ����� job���� ����Ͻÿ�
select job, avg(sal) as pay_aver
from emp 
where mod(to_char(hiredate,'yy'),2)=0
group by job
order by avg(sal);
 

