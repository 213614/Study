-- ���� �� ���θ���� �� �����ͺ��̽� ���� �� �����ͺ��̽� ����
-- i:java202207\database\20220819_02_SQL���� 
-- ���̺��� ����Ŭ������ ����ǹǷ� ���� �̸����� �����ҰŸ� drop���� ����� �ؾ���
//////////////////////////////////////////////////////////////////


    �� sungjuk0 ���̺� ���� ��
drop table sungjuk0;


    �� sungjuk ���̺� ���� ��
create table sungjuk(
    uname  varchar (50)  not null    -- not null : ���� �����Ѵٴ� �������� 
                                     --            �ظ��ϸ� �� �޾��� / ���� 50��, �ѱ� �� 16�� ����
    ,kor   int           not null    -- int : ���� / �Ҽ����� ǥ���Ϸ��� �ٸ� �ڷ����� ���
    ,eng   int           not null
    ,mat   int           not null
    ,tot   int           null        -- null : �� ��� �������� / �ۼ������ʾƵ� �⺻ �����Ǿ�����
    ,aver  int 
);


    �� ���� ������ �� �߰� ��
insert into sungjuk(uname,kor,eng,mat) values ('ȫ�浿',  70, 85, 100);
insert into sungjuk(uname,kor,eng,mat) values ('����ȭ',  30, 30, 40);
insert into sungjuk(uname,kor,eng,mat) values ('���޷�',  90, 90, 20);
insert into sungjuk(uname,kor,eng,mat) values ('������',  100, 60, 30);
insert into sungjuk(uname,kor,eng,mat) values ('���϶�',  30, 80, 40);
insert into sungjuk(uname,kor,eng,mat) values ('����ȭ',  80, 80, 20);
insert into sungjuk(uname,kor,eng,mat) values ('���ѹα�', 10, 65, 35);
insert into sungjuk(uname,kor,eng,mat) values ('�عٶ��', 30 ,80 ,40);
insert into sungjuk(uname,kor,eng,mat) values ('���Ȳ�',  30, 80, 20);
insert into sungjuk(uname,kor,eng,mat) values ('���ѹα�', 100, 100, 100);


//////////////////////////////////////////////////////////////////
�� �����ͺ��̽��� ������ Ű����� �Է¼���� ���ĵǴ°��� �ƴ϶� �����ڰ� �����ϴ°�! ��
//////////////////////////////////////////////////////////////////
-- select ~ from �� ¦��

    �� ��ü ���ڵ�(��) ��ȸ ��
select uname, kor, eng, mat, tot, aver 
from sungjuk;


    �� ��ü ���ڵ�(��) ����(�� �ټ�) ��ȸ ��
select count(*) from sungjuk;


    �� select  ��ȸ �� �˻� ��
select kor, eng, mat from sungjuk;  -- Ư�� Į���� ��ȸ 
select tot, aver from sungjuk;          
select * from sungjuk;              -- ��� Į�� ��ȸ (*�縸�ɹ���)


    �� select - as : Į������ �Ͻ������� ���� ���� ��
-- ���������� �������� Į������ �Ͻ������� ���� �����Ͽ� ����� �� �ִ�. 
-- run�� ��ÿ��� �����
-- �ѱ��� �����Ҷ��� ����, �ǹ����� �ȵ�! : �ѱ��� �Ͻ������� �м��ؾ��Ҷ��� ��õ
select uname as �̸�, kor as ����, eng as ����, mat as ����, tot as ����, aver as ��� 
from sungjuk; 
-- as�� ���� ���� 
select kor korea, eng englisg, mat math 
from sungjuk;


    �� count �Լ� ��Oracle���� �⺻���� �����Ǵ� �Լ�
select count(uname) from sungjuk;   
-- �� ���� ���̺� �ȿ� uname Į������ ���� �� ���� 
select count(kor) from sungjuk;
-- �� table:sungjuk > calum:kor > total recode count  
select count(eng) as cut_eng from sungjuk;
-- �� ���� ���̺� �ȿ� eng Į������ ���� �� ������ ���� 'count(uname)'��� Į������ 
--    �ӽ÷�(as���) cut_eng�� �����ؼ� ����
select count(mat) ���а��� from sungjuk;
-- �� ���� ���� / as ���� ����

select count(tot) from sungjuk;     -- 0
select count(aver) from sungjuk;    -- 0
-- null���� count������ �ʾƼ� ����� 0���� ����
-- �Լ� �� ���ڵ� �ȿ� null���� Ư�� ������ �ٲ� �� ������ִ� �Լ��� �ִ�.

select count(*) from sungjuk;
-- sungjuk ���̺��� ��ü ���� ����(null���� �ִ� ����� �� �����ؼ� �˰�ʹٸ�)
-- Į������ *(���ɹ���)�� ������ �ȴ�.
select count(*) as ��ü�హ�� from sungjuk;
select count(*) ��ü�హ�� from sungjuk;

�ﹰ���� ���� ���̺� : ���������� ���� (�����ڰ� ���� �ۼ��ؼ� ������ ���̺�)
����� ���� ���̺� : ��ɾ ���� ���� ���̺� ex.count�Լ� ����� ������ ���̺�

//////////////////////////////////////////////////////////////////

    �� ��ɾ� �Ϸ� �� ��� - sqlplus���� �ʼ����ס�
    - commit    : �Ϸ�
    - rollback  : ���
    : select�� ��ȸ�� ���ص������� insert/update/delete���� ���̺� ������ ���� 
      ��ɾ�� commit(�Ϸ�) / rollback(���) �ؾ��Ѵ�.
    �� SQL Developer������ �ڵ�Ŀ�� ������ ���� �� �ִ� 
        : ���� �� ȯ�漳�� �� �����ͺ��̽� �� ��ü��� �� �ڵ�Ŀ�Լ���
       
//////////////////////////////////////////////////////////////////
 
delete from sungjuk;
select*from sungjuk;
        
commit;          -- f11
rollback;        -- f12
        
        
        
        
        
        
        
        

      