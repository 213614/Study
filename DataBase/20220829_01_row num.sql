-- ���� �� ���θ���� �� �����ͺ��̽� ���� �� �����ͺ��̽� ����
-- i:\java202207\database\20220829_01_row num.sql
-- ���̺��� ����Ŭ������ ����ǹǷ� ���� �̸����� �����ҰŸ� drop���� ����� �ؾ���
///////////////////////////////////////////////////////////////////////////////////////////

    �� ���� Į�� ��
        - Oracle DBMS���� �⺻ ���� 
        - ���ϼ��� ������. (�ߺ�����X)
        - ����¡(paging) : �� ȭ�鿡�� �����ִ� �������� ������ �����ϴ� �Ϸ��� ���
                           (��� ������ �ѹ��� �������� ����)
            ex. ��Ʃ�ꡤ���̹� ��� : �������ư�� ���� �����͸� �������� �����ش�. (15��-������-30�� �̷���)
            
            ������,�ֽż�,���ż�������. : order by key��;
                �� Į���� �־���� ex. �ֽż� - ���� ��¥���� ����� Į�� desc 
        
        �� rownum �� ��ȣ�� (����¡ �۾��� Ȱ����)
            select uname, address, rownum from tb_student;

        �� rowid �� �ּҰ� 
            select uname, address, rowid from tb_student;

///////////////////////////////////////////////////////////////////////////////////////////

    �� rownum ��
        - ���� Į�������� ���������� ��� ����
        
-- �� ��ȣ
select hakno, uname, rownum from tb_student;

-- �� ��ȣ�� ��Ī �ο��ϱ�
select hakno, uname, rownum as rnum from tb_student;

-- �����ϸ� ���� �������ִ� �� ��ȣ���� ���� ���ĵ� (���� �� ���ȣ�� �ο��Ǵ°��� �ƴ�)
select hakno, uname, rownum as rnum from tb_student order by uname;

-- �� ��ȣ 1~3�� ���̸� ��ȸ (rownum + where������)
select hakno, uname, rownum from tb_student where rownum between 1 and 3;
                                            -- rownum>=1 and rownum<=3;
                                            
-- �� ��ȣ 4~6�� ��ȸ : ��ȸ �ȵ� (rownum�� ��� ��ġ�� �߿�) : �̷��ɷ� ����¡�ϸ� ��ȸ �ȵ�
select hakno, uname, rownum from tb_student where rownum between 4 and 6;
                                            -- rownum>=4 and rownum<=6;
                                            
///////////////////////////////////////////////////////////////////////////////////////////

    �� Oracle DB rownum paging ��
        - rownum�� ���� Į���̱� ������ �������� ���� ������� ����, ������ Į������ �ν��� ���� ��Ų �ģ� 
          �� ������ ����� ���� ��õ�Ѵ�. 
        �� rownum Į���� ���� join�Ŀ� �� ��ȣ�� �߰��ϰ� �������� Ȱ���Ѵ�.
          
-- ����1. �� ��ȣ(rownum)�� �̿��Ͽ� �� ��ȣ 4~6�� ��ȸ
-- 1) �̸� �� ��ȸ   : �� ��ȣ���� �Բ� ���� : ���׹���
select hakno, uname, rownum as rnum 
from tb_student 
order by uname;
-- 2) �ٸ� Į�� ���� �� AA �����̺� ���� �� �� ��ȣ(rownum) ���̱� : 1�� ���(rownum����)�� �������� �� �ٹ�ȣ �߰�
select hakno, uname, address
from tb_student 
order by uname;

select hakno, uname, address, rownum as rnum
from (
        select hakno, uname, address
        from tb_student 
        order by uname
)AA;
-- 3) 2�� ����� BB �����̺� ���� ��(self join) where ������ �ٿ��� 4~6�� ��ȸ�ϱ�
select *
from (
        select hakno, uname, address, rownum as rnum
        from (
                select hakno, uname, address
                from tb_student 
                order by uname
        )AA
)BB
where rnum between 4 and 6;              -- = rnum>=4 and rnum<=6;
-- 4) ���̺� ��Ī ����
select *
from (
        select hakno, uname, address, rownum as rnum
        from (
                select hakno, uname, address
                from tb_student 
                order by uname
        )
)
where rnum between 4 and 6;   
