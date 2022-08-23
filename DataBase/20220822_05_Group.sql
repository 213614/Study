-- ���� �� ���θ���� �� �����ͺ��̽� ���� �� �����ͺ��̽� ����
-- i:\java202207\database\20220822_05_Group
-- ���̺��� ����Ŭ������ ����ǹǷ� ���� �̸����� �����ҰŸ� drop���� ����� �ؾ���
//////////////////////////////////////////////////////////////////

    �� ������ �׷�ȭ Group ��

-- sungjuk_seq ������ ����
drop sequence sungjuk_seq;

-- sungjuk ���̺��� ����� ������ ����
create sequence sungjuk_seq;

-- sungjuk ���̺� ����
drop table sungjuk;

-- sungjuk ���̺� ����
create table sungjuk (
    snum        int             primary key                        
    ,uname      varchar(50)     not null
    ,kor        int             check(kor between 0 and 100)
    ,eng        int             check(eng between 0 and 100)
    ,mat        int             check(mat between 0 and 100)
    ,addr       varchar(20)     check(addr in ('Seoul', 'Jeju', 'Busan', 'Suwon'))
    ,tot        int             default 0
    ,aver       int             default 0
    ,wdate      date            default sysdate
);

-- sungjuk ���̺� �Է� ������
insert into sungjuk(snum, uname, kor, eng, mat, addr, wdate)
values(sungjuk_seq.nextval,'�ֵ���ũ', 90, 85, 95, 'Seoul',sysdate);

insert into sungjuk(snum,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'����ȭ',40,50,20,'Seoul',sysdate);

insert into sungjuk(snum,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'���޷�',90,50,90,'Jeju',sysdate);

insert into sungjuk(snum,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'������',20,50,20,'Jeju',sysdate);

insert into sungjuk(snum,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'����ȭ',90,90,90,'Seoul',sysdate);

insert into sungjuk(snum,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'���Ȳ�',50,50,90,'Suwon',sysdate);

insert into sungjuk(snum,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'������',70,50,20,'Seoul',sysdate);

insert into sungjuk(snum,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'�ҳ���',90,60,90,'Busan',sysdate);

insert into sungjuk(snum,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'������',20,20,20,'Jeju',sysdate);

insert into sungjuk(snum,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'ȫ�浿',90,90,90,'Suwon',sysdate);

insert into sungjuk(snum,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'����ȭ',80,80,90,'Suwon',sysdate);


commit;
select*from sungjuk;

//////////////////////////////////////////////////////////////////

    �� Distinct ��
        : Į���� �ߺ� ���� ������ ��ǥ�� 1���� ���
        : distinct Į���� 

select addr from sungjuk order by addr;         -- �����Ǹ� �⺻ asc:��������
select addr from sungjuk order by addr desc;    -- desc:��������

select distinct(addr) from sungjuk;             -- ���� �ּҸ� ������� �׷�ȭ

select distinct(uname) from sungjuk;   
-- �������� �Ӽ� �ľ� �߿� �� 'uname'�� �ߺ��� �����Ͱ� ���� �����Ƿ� �ǹ̰� ����.
    
//////////////////////////////////////////////////////////////////    
    
     �� group by ��   
        : Į���� ������ ������ ���� �����ͳ��� �׷�ȭ��Ŵ
        : group by Į��1, Į��2, Į��3 ������.
        :           1�� > 2�� > 3�� (order byó�� ����ؼ� �ұ׷�ȭ)
        : ��� �� ��������� group by�� ���� ����. (�׷�ȭ �� ��/����)

-- �ּҰ� ������ ���� �׷�ȭ ��Ű�� �ּ� ��ȸ (= distinct�� ����� ���� )
select addr      -- �׷�ȭ �� ������� �� �ϳ��� ���� �� �� �ִ°� ���´�
from sungjuk     -- = �׷��Ű�� ���� �� �ִ� ���� 1���� ������ ���� ��ȸ
group by addr;

-- !error! ORA-00979: GROUP BY ǥ������ �ƴմϴ�.
select addr, uname
from sungjuk
group by addr;
--  addr�� seoul/jeju/busan/suwonó�� �������� �����Ͱ� �ϳ��� ������ ���ü������� 
--  uname�� �ϳ��� �׷쿡�� ���� �� �ٸ����� �����Ƿ� select�� ������ �������� (group by�� Ư¡)

//////////////////////////////////////////////////////////////////   
select addr from sungjuk order by addr;     -- ���� Ȯ��

-- Q1. �ּ� �� �ο����� ��ȸ�Ͻÿ� �� Į��2 ���ڵ�4 ���� ���̺�(�����ڰ� ����Ծƴ϶� ��ȸ�ϸ鼭 �ڵ����� ������ ���̺�)
-- �� �ڵ�
select addr, count(*) as cnt    -- as �ӽø� : Į���� �ӽ� �ο� (as��������)
from sungjuk
group by addr
order by cnt desc;

-- �ּҺ� �������� ��ȸ
select addr
from sungjuk
group by addr
order by addr;

-- �ּҺ� �ο����� ������������ �����ؼ� ��ȸ (�� �ڵ�� ����)
--                                      �ؼ�����
select addr, count(*) as cnt            -- 3
from sungjuk                            -- 1
group by addr                           -- 2
order by cnt desc;                      -- 4

//////////////////////////////////////////////////////////////////   

     �� ���� �Լ� �� 

-- Q2. �ּҺ��� ���� ���������� ���� �����Ͻÿ�
             --   ����,           �ִ밪,        �ּҰ�,        �հ�,         ��� 
select addr, count(*) as cnt, max(kor) max, min(kor) min, sum(kor) sum, avg(kor) aver   
from sungjuk                           
group by addr;   

-- 2-1. �� ���̺��� �ּҺ��� �������� ���� 
select addr, count(*) as cnt, max(kor) max, min(kor) min, sum(kor) sum, avg(kor) aver   
from sungjuk                           
group by addr
order by addr;   

-- 2-2. ����� �Ҽ��� �ݿø� �� ����ó�� 
        �� round(��, 0) : �Ҽ��� ���� ������ �ݿø� �� �Ҽ����� ���ش�(0) / 0 ��� 2�� ������ �Ҽ��� �ι�°�ڸ����� ǥ���ȴ�. 3�� ����° 
--                                                                            �� ����!       
select addr, count(*) as cnt, max(kor) max, min(kor) min, sum(kor) sum, round(avg(kor),2) aver
-- select �ȿ��� round �Լ��� �ۼ��Ѵ�. round(��,0) ���⼱ round(�Լ�(Į����=��),0) 
from sungjuk                           
group by addr
order by addr;  

-- ���� ����� �Ҽ������� �ݿø� �� ������������ ����
select addr, count(*) as cnt, max(kor) max, min(kor) min, sum(kor) sum, round(avg(kor),0) aver
from sungjuk                           
group by addr
order by round(avg(kor),0) desc;  

-- Į���� ����
select addr
     , count(*) as cnt
     , max(kor) max_kor
     , min(kor) min_kor
     , sum(kor) sum_kor
     , round(avg(kor),0) avg_kor
from sungjuk                           
group by addr
order by round(avg(kor),0) desc;  

//////////////////////////////////////////////////////////////////   
select*from sungjuk;

-- Q3. ����(tot), ���(aver) ���Ͻÿ�
update sungjuk set tot=kor+eng+mat, aver=(kor+eng+mat)/3;

-- Q4. ���(aver)�� 80���̻� ���� ������� �ּҺ� �ο����� �ο��������� ��ȸ�Ͻÿ�
select addr, count(*) cnt
from sungjuk
where aver>=80
group by addr
order by count(*); 

//////////////////////////////////////////////////////////////////220823

     �� 2�� �׷� �� = 2����3�� ����ó�� 

-- 1) �ּҺ� ������ ��ȸ�Ͻÿ�
select addr, kor, eng, mat 
from sungjuk 
order by addr, kor;     --�� �ּҺ��� ���� �� �ȿ��� ���� �������� ����


-- 2) �ּҺ�(1��) �׷��� �ϰ�, �� �׷쳻���� ���� ��������(2��)�� �׷�ȭ
select addr, kor    -- �� group by�� select �� �� �׷������� ��ϸ� �� �� ����.
from sungjuk
group by addr, kor
order by addr;


-- 3) 1���� �׷������� ���� �� ��ȸ�ϱ�
-- ���ֵ��� 20�� ���� ��� �� ������, ���￡�� 90�� ���� ����� �� ������
-- = �� ���������� �����ڵ��� ���� ��ȸ�� �� �ִ�
select addr, kor, count(*) 
from sungjuk
group by addr, kor
order by addr;

-- ��,��,�� ������ ���� �� ���� ���� ( = ������ ������� üũ�� �� ����)
select kor, eng, mat, count(*) 
from sungjuk
group by kor, eng, mat          -- �������� ���� �ֵ� �׷� �׾ȿ��� �������� ���� �ֵ� �׷� �� �ȿ��� �������� ���� �ֵ� �׷� = �� ���� �� ����   
order by kor, eng, mat;         

select*from sungjuk;

////////////////////////////////////////////////////////////////////////////////

     �� having ������ �� - group by
         -- where ������ / on ������
         - where ������ ������ �����
         - having �������� group by �� ���� ����ϴ� ������
         - �׷�ȭ�� �ϰ� �� �Ŀ� �������� �߰�
         - ����: having ����
   
         -- where�� having�� ����
         -- where - group by : ���� ���� �� �� �׷�ȭ, ��ü ���̺� ��ü�� ���� ������ �� �� �ִ�.
         -- group by - having : �׷�ȭ ���� ��Ų �� ����, �׷�ȭ �Ǿ��� ���ο� ���̺� ������ �ش�.
         -- where-group by = ������ �´� �ֵ鳢�� �׷�ȭ
         -- group by-having = �׷� ������ ���ǿ� �ش�Ǵ� �ֵ��� ��ȸ 
   

-- 1) �ּҺ� �ο����� ��ȸ�Ͻÿ�
select addr, count(*)
from sungjuk
group by addr;

-- 2) �ּҺ� �ο����� 3�� ���� ��ȸ�Ͻÿ�
select addr, count(*)
from sungjuk
group by addr
having count(*)=3;

-- 2-1) �ּҺ� �ο����� 3�̻��� ���� ��ȸ�Ͻÿ�
select addr, count(*)
from sungjuk
group by addr
having count(*)>=3;

////////////////////////////////////////////////////////////////////////////////

-- Q5. �ּҺ� ������հ��� 50�̻� ���� ������������ ��ȸ�Ͻÿ� 
--    (��, ��հ��� �Ҽ������� �ݿø�)
-- Ǯ�̼���: �ּҺ��� �׷�ȭ(group by) �� �׷쳻���� ��հ� 50�̻� ����(having) �� �������� ��ȸ(order by)
select addr, round(avg(kor),0) avg_kor
from sungjuk
group by addr 
having round(avg(kor),0)>=50
order by round(avg(kor),0) desc;

-- ����� Ǯ��
1) �ּҺ� ���� ��հ� ���ϱ�
select addr, avg(kor)
from sungjuk
group by addr;
-- �Ҽ����� �������� �ʴ´�.


2) ���� ��հ� �Ҽ��� �ݿø��ϰ� �Ҽ����� ���ֱ�
select addr, round(avg(kor), 0)
from sungjuk
group by addr;
-- group by�� ���� ����� ���̺��� ������ �߰��Ѵ�.


3) 2�� ������� ������հ��� 50�� �̻���(�ŷ�ƮX) ���� �߰��ϱ� (��������.sql)
select addr, round(avg(kor), 0)
from sungjuk
group by addr
having round(avg(kor), 0)>=50;
---> �� ���� �ڹٷ� �ű�� ���̴�.


4) 3�� ������� ������հ� �������� �����ϱ� (��¥_����������.sql)
select addr, round(avg(kor), 0)
from sungjuk
group by addr
having round(avg(kor), 0)>=50
order by round(avg(kor), 0) desc;

5) 4�� ������� ���� ��հ� Į������ avg_kor�� ����      ��������
select addr, round(avg(kor), 0) avg_kor
from sungjuk
group by addr
having round(avg(kor), 0)>=50
order by round(avg(kor), 0) desc;

////////////////////////////////////////////////////////////////////////////////

-- Q6. ���(aver)�� 70�̻� ���� ������� �ּҺ� �ο����� ���� ��,
--     �� �ο����� 2�̸� ���� �ο��� ������ ��ȸ�Ͻÿ�
-- Ǯ�̼���: ��� 70�̻� �� ���� ���� (where��) �� �ּҺ� �ο��� �׷�ȭ(group by + count)
--          �� �ش� �ο����� 2 �̸� (having) �� �ο��� ������ ��ȸ (order by)

-- ��5�� ��ü ������� ����, �׷�ȭ / ��6�� �׷� ������ ������ �ް� �� �ش� �׷츸 ��ȸ 
select addr, count(*) cnt
from sungjuk
where aver>=70
group by addr
having count(*)<2
order by count(*);

-- ����� Ǯ�� 
1) ��ü �� ��ȸ
select*from sungjuk;

2) ���(aver)���� 70�̻� �� ��ȸ
select*
from sungjuk
where aver>=70;

3) 2�� ������� �ּҺ� �ο����� ���Ͻÿ�
select addr, count(*)       -- select�� �ڵ� �ۼ��� �׻� �������� ���´�.
from sungjuk
where aver>=70
group by addr;

4) 3�� ������� �ش� �ο����� 2 �̸��� ���� ���Ͻÿ�
select addr, count(*)      
from sungjuk
where aver>=70
group by addr
having count(*)<2;      -- count�� as�� �ٲ� �̸��� ������ ������ �ȴ� �׳� �״�� �������(having�̴� where�� group��) 

5) 4�� ������� �ο��� ������ ��ȸ�Ͻÿ� ��������
select addr, count(*) 
from sungjuk
where aver>=70
group by addr
having count(*)<2
order by count(*); 

////////////////////////////////////////////////////////////////////////////////

     �� case when ~ then end ���� ��= (JS������) if�� + case��
            - select �ȿ� �ۼ��Ѵ�. 
            - ����:
                    CASE WHEN ����1 THEN ���Ǹ����� ��1
                         WHEN ����2 THEN ���Ǹ����� ��2
                         WHEN ����3 THEN ���Ǹ����� ��3
                                    ...
                         ELSE ��  (�� ���ǿ� �������� ������ ������������ �Էµ� �� / ��������)
                     END ����÷��� (then ���� �� Į��)
                     
-- �̸��� �ּ� ��ȸ
select uname, addr
from sungjuk;

-- DB���� �����͸� �����Ҷ��� ���� �״�κ��ٴ� �ڵ�ȭ�ؼ� �����ϴ� ��찡 ����
-- ex.  ����/���� ���� �����ص� ������ f/m���� �����Ѵ� = ���� �� ����Ҷ��� ����/�������� 
--      ����ڰ� ���Բ� �Ѵ� = �ս� �����Ͱ� ������ : f/m���� �� �����ڵ�� �Ѵ�. 
-- ex2. ��ȭ ���� ����Ʈ���� ��ȭ �帣�� �׼�/�ڹ�/�ִϸ��̼��� �����ڵ�� �ڵ�ȭ���� �����Ѵ�. act/com/ani
-- ex3. �Ƿ� ���θ����� ������/������ or ����/���� �̷��� �����ڵ�� �ڵ�ȭ�ؼ� ���� 

-- �̸��� �ּ� ��ȸ (��, �ּҴ� �ѱ۷� �ٲ㼭 �����ְ�ʹ�)
--                                     �� ���⼱ �̰� �����ڵ� (f/m or act/com/ani)
select uname, addr, case when addr = 'Seoul' then '����'  -- addr�� 'Seoul'�̸� '����'�� ��µȴ�
                         when addr = 'Jeju'  then '����'
                         when addr = 'Busan' then '�λ�'
                         when addr = 'Suwon' then '����'
                         -- else�� �������� 
                     end as juso    -- case���� �ݰ� '����', '����', '�λ�', '����'�� juso��� Į���� ����ּ���
                                    -- as ���� ����
from sungjuk
order by juso;

////////////////////////////////////////////////////////////////////////////////

-- Q7. �̸�, ����, ������ ��ȸ�Ͻÿ�. 
--       ���� : �������� 90�̻� 'A����'
--                      80�̻� 'B����'
--                      70�̻� 'C����'
--                      60�̻� 'D����'
--                      ������ 'F����'

select uname, kor, case when kor>=90 then 'A'
                        when kor>=80 then 'B'
                        when kor>=70 then 'C'
                        when kor>=60 then 'D'
                        else 'F'
                    end grade         -- as ���� ���� / �ѱ۰���(����ǥ ����)      
from sungjuk
order by kor desc;


-- between�����ڷε� ����!                          ������ and ū�� �����Ѵ� (90~100 ���̴� A) 
select uname �̸�, kor ��������, case when kor between 90 and 100 then 'A'       
                                     when kor between 80 and 89  then 'B'
                                     when kor between 70 and 79  then 'C'
                                     when kor between 60 and 69  then 'D'
                                     else 'F'
                                end ��������        
from sungjuk
order by kor desc;

-- ��ȥ�� ���� : ���� �������� �׷�ȭ�ϰ� �� ������ �ο��� ��ȸ + ���� ���������� ��������
select kor, case when kor>=90 then 'A'
                 when kor>=80 then 'B'
                 when kor>=70 then 'C'
                 when kor>=60 then 'D'
                 else 'F'
            end as grade
    ,count(*) cnt    
from sungjuk
group by  kor
order by kor desc;





