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


