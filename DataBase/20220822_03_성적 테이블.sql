-- ���� �� ���θ���� �� �����ͺ��̽� ���� �� �����ͺ��̽� ����
-- i:\java202207\database\20220822_03_���� ���̺�
-- ���̺��� ����Ŭ������ ����ǹǷ� ���� �̸����� �����ҰŸ� drop���� ����� �ؾ���
//////////////////////////////////////////////////////////////////

-- ���� sungjuk ���̺� ����
drop table sungjuk;
commit;

-- sungjuk ���̺� ����
create table sungjuk(
    snum    int           not null       -- �Ϸù�ȣ
    ,uname  varchar (50)  not null   
    ,kor    int           not null    
    ,eng    int           not null
    ,mat    int           not null
    ,tot    int           null      
    ,aver   int         
    ,addr   varchar (50)                  -- �ּ�
    ,wdate  date                          -- �����:����Ͻú���(��¥�� ������Ÿ���� ��������:date)
);                                        -- '��/��/��' (or '��-��-') '��:��:��' �� ��¥�� �����ʹ� ���ڿ� ���·� ǥ��

select*from sungjuk;

-- 'sungjuk' ���̺� �Է� ������ 
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
select count(*)from sungjuk;
select*from sungjuk;

//////////////////////////////////////////////////////////////////

-- Q1. ��ü�࿡ ���ؼ� ����(tot), ���(aver)�� ���Ͻÿ�
update sungjuk set tot=kor+eng+mat, aver=(kor+eng+mat)/3;

-- Q2. �̸��� '��' ���ڰ� �ִ� ���� ��ȸ�Ͻÿ�
select uname
from sungjuk
where uname like '%��%';

-- Q3. �ּҰ� ����, ���� ���� ��ȸ�Ͻÿ�
select uname, addr
from sungjuk
where addr like 'Seoul' or addr like 'Jeju'
order by addr;          -- �ּҸ� �������� ���� 

--�� ����� �ڵ� 
select uname, addr
from sungjuk
where addr='Seoul' or addr='Jeju';

select uname, addr
from sungjuk
where addr in ('Seoul','Jeju');

-- Q4. ������ ������ ��� 90���̻� ���� ����� ��ȸ�Ͻÿ�
select count(*)
from sungjuk
where kor>=90 and eng>=90 and mat>=90;

--�� ����� �ڵ� 
select count(*) as cnt����      -- Į���� ����(as��������/�ѱ۵�����)
from sungjuk
where kor>=90 and eng>=90 and mat>=90;

-- Q5. �ּҺ��� �����ؼ� ��ȸ�Ͻÿ�. �ּҰ� ���ٸ� �Ϸù�ȣ ������ �ٽ� �����ؼ� ��ȸ�Ͻÿ�
select snum, uname, addr
from sungjuk
order by addr asc, snum;












