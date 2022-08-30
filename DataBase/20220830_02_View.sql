-- ���� �� ���θ���� �� �����ͺ��̽� ���� �� �����ͺ��̽� ����
-- i:\java202207\database\20220830_02_View.sql
-- ���̺��� ����Ŭ������ ����ǹǷ� ���� �̸����� �����ҰŸ� drop���� ����� �ؾ���
///////////////////////////////////////////////////////////////////////////////////////////

    �� �� View ��
        - ���̺�ó�� ����ϴ� ��
        - ���̺� ���� ������ ���̺�ν� ���̺�ó�� ���� �����͸� �������� �ʰ�
          �˻��ÿ� �̿��� �� �ֵ��� ������ ��� �ִ� ��ü ���̺� ������ �κ�����
          
        - SQL������ �߻��� ���� ���̺��� ������ ���� �� �ִ�.(�ʿ��Ҷ����� ����ٰ� ��밡��)
        - ���� ������ �ս� ������ ���� ī���ؼ� view�θ� SQL���� �ۼ��ϴ� ��쵵 �ִ�
        
        �� ������
            �����̺� ���� ���ȱ���� �����ؾ� �ϴ� ���
            �������ϰ�, ���� ����ϴ� ���� SQL���� ���� ���� �����ϰ� ����ؾ� �ϴ� ���
            
        �� ������ ���ؼ� �� ���� ���� �ο� �ʿ�
               grant create view to ���̵�
                 
         ex.   grant create view to java202207            
         
        �� �� ���� �� ���� ����
               create or replace view ���̸� (������ ���� create �� ���ķ� replace�� ������Ʈ��)   
               �� replace : �̹� �����ϴ� ���� ������ ������
               as [SQL��]
              
        �� �� ���� 
               drop view ���̸�
              
        �� ���̺�, �� ��� Ȯ��
               select*from tab;                              -- ��� ��ü ���� Ȯ��
               select*from tab where tabtype = 'TABLE';      -- ���̺� ��� Ȯ��
               select*from tab where tabtype = 'VIEW';       -- �� ��� Ȯ��
               
///////////////////////////////////////////////////////////////////////////////////////////

-- ���� ���̺� ��� Ȯ��
select * from sungjuk;

-- �ּҰ� ����, ���� ������ �̸�,������,�ּ� ��ȸ
select uname,kor,mat,eng,addr
from sungjuk
where addr in ('Seoul','Jeju');

-- �� �����̺�� �� ����(�ι�°���ʹ� ����)
-- create or replace view ���̸� as SQL��
create or replace view test1_view 
as 
    select uname,kor,mat,eng,addr
    from sungjuk
    where addr in ('Seoul','Jeju');

-- ������ ��� ���̺�ó�� ��� ����
select * from test1_view;

-- �����ͻ���(user_views���̺�)���� ���� ���� ���� Ȯ�� ����
select * from user_views;

select text 
from user_views
where view_name = 'TEST1_VIEW';         -- �� �̸� �빮�ڷ� �����
-- SQL���� �Ϸķ� ��ȸ��

-- test2_view (alias ��Ī)
create or replace view test2_view 
as 
    select uname as �̸�,kor ����,mat ����,eng ����,addr �ּ�
    from sungjuk
    where addr in ('Seoul','Jeju');

select * from test2_view;

///////////////////////////////////////////////////////////////////////////////////////////

-- Q1. ������û�� �л����� �й�, �� ������ ��� �����Ͻÿ�(test3_view)
create or replace view test3_view 
as 
    select SU.hakno, sum(GW.ghakjum) || '����' as tot
    from tb_sugang SU join tb_gwamok GW
                      on SU.gcode = GW.gcode
    group by SU.hakno;
    
select * from test3_view;

-- test3��� �л����̺� �����ؼ� �й�, �̸�, ������ ��ȸ
select ST.uname, T3.*
from tb_student ST join test3_view T3
                   on ST.hakno = T3.hakno
order by ST.hakno;




