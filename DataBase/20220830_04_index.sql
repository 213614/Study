-- ���� �� ���θ���� �� �����ͺ��̽� ���� �� �����ͺ��̽� ����
-- i:\java202207\database\20220830_04_index.sql
-- ���̺��� ����Ŭ������ ����ǹǷ� ���� �̸����� �����ҰŸ� drop���� ����� �ؾ���
///////////////////////////////////////////////////////////////////////////////////////////

    �� index ���� ��        
        - �� ���� �˻��� ���� �ε���
        - �����͸� ������ ã�� �� �ִ� ����
        - ���̺� ���� ��ȸ �ӵ��� ���� �ִ� �ڷᱸ��
        - PKĮ���� �ڵ����� �ε��� ����
        
        - where�������� ���� ����ϴ� Į���� index �س��´�

        - ex. 50�ް� = ���� ������ ���� 80 + �ε��� ��� 20 (or 7:3)

    �� index ��� ��    
        �� full scan
            ó������ ������ ������ �˻��ϴ� ���. ��������        
    
        �� index range scan
            �̸��� �������� ��� ������ ã�Ƽ� �������� ã�ư�
            �ξ� ����. ������ �޸𸮰� �־�� ��.
    
        �� index unique scan
            �й��� 1���� ������. ������ ��
            
        �� index ����            
            create index �ε����� on ���̺��(Į����)
  
        �� �ε��� ����
            drop index �ε�����           
            
///////////////////////////////////////////////////////////////////////////////////////////

 �� PK�� ���� ���̺� ��
 
--���̺����
create table emp2(
  id        number(5)    
  ,name     varchar2(25)
  ,salary   number(7, 2)
  ,phone    varchar2(15)
  ,dept_id  number(7)
);
--���߰� 
insert into emp2(id,name) values (10,'kim');
insert into emp2(id,name) values (20,'park');
insert into emp2(id,name) values (30,'hong');
commit;
            
-- �ε��� ���� ��      
-- f10 ��ȹ������ �� full scan, cost 2
select*from emp2 where name='hong';     -- sql���ȿ� Ŀ�� ���� f10

-- �ε��� ���� �� (���� �������� ������ ������)
create index emp2_name_idx on emp2(name);       -- index ����
drop   index emp2_name_idx on emp2(name);       -- index ����

-- f10 ��ȹ������ �� full scan, cost 2 : ������ ���� ��� cost ����ϰ� ���� ������ �ε����� �ξ� ����
select*from emp2 where name='kim';      -- sql���ȿ� Ŀ�� ���� f10

����������������������������������������������������������������������������������������������������������������������������������

 �� PK�� �ִ� ���̺� ��
 
-- PK�� �ε����� �ڵ����� �����Ǹ鼭 ���ĵȴ�
create table emp3 (
    no      number        primary key
    ,name   varchar2(10)
    ,sal    number
);

-- f10 ��ȹ������ �� full scan, cost 1
select*from emp3 where no=3;

����������������������������������������������������������������������������������������������������������������������������������

-- 100������ ���ڵ� ������� cost ��
create table emp4(
   no     number
  ,name   varchar2(10)
  ,sal    number
);

drop table emp4;

-- ���ν����� �̿��Ͽ� 100���� �߰� =========================================================
declare -- ����
    -- ��������
    i      number       := 1;
    name   varchar(20)  := 'kim';
    sal    number       := 0;
begin
    -- T-SQL��
    while i<=1000000 loop
        if    i mod 2 = 0 then name := 'kim'  || to_char(i); 
                               sal  := 300;
        elsif i mod 3 = 0 then name := 'park' || to_char(i);
                               sal  := 400;
        elsif i mod 5 = 0 then name := 'hong' || to_char(i);
                               sal  := 500;
        else                   name := 'shin' || to_char(i);
                               sal  := 250;
        end if;
        
        insert into emp4(no, name, sal) values (i, name, sal);      -- �� �߰� �ݺ� 
        i := i+1;   -- ������ ���ѹݺ��ɸ��ϱ� �� Ȯ��
    end loop;                                        
end;
--========================================================================================

commit;

select count(*) from emp4;
select*from emp4;

rollback;


-- 1) �ε����� ������� ���� ���
select * from emp4 where name='kim466';
--�� FULL scan, cost 904

select * from emp4 where no=466;
--�� FULL scan, cost 903

select * from emp4 where sal>300;
--�� FULL scan, cost 906

-- 2) �ε����� ����� ���
--�� nameĮ�� �������� �ε��� ����
create index emp4_name_idx on emp4(name);

select * from emp4 where name='kim466';
--�� RANGE scan, cost 3

--�� name,salĮ������ �ε��� ����(�ΰ��� �ѹ��� ����)
create index emp4_name_sal_idx on emp4(name, sal);

select * from emp4 where name='kim466' and sal>200;
--�� RANGE scan, cost 3

--�� no Į�� �������� �ε��� ����
create index emp4_no_idx on emp4(no);

select * from emp4 where no=466;
--�� RANGE scan, cost 3

///////////////////////////////////////////////////////////////////////////////////////////

        �� �ε��� ������ ����
               select*from user_indexes;
            
         ex.   select*from user_indexes where index_name like 'EMP4%';








