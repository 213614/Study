-- ���� �� ���θ���� �� �����ͺ��̽� ���� �� �����ͺ��̽� ����
-- i:\java202207\database\20220826_02_left join.sql
-- ���̺��� ����Ŭ������ ����ǹǷ� ���� �̸����� �����ҰŸ� drop���� ����� �ؾ���
///////////////////////////////////////////////////////////////////////////////////////////

    �� ���̺� ������ ���� ��
        �� inner join
            �� �� ���̺� �������� �����ϴ� Į���� �̿��ϴ� ���
            �� inner ��������
            �� �⺻

        �� left outer join
            �� ���� ���̺��� ��� �����Ϳ� ������ ���̺��� ���� �����͸� ����
            �� outer ��������

        �� right outer join
           �� ������ ���̺��� ��� �����Ϳ� ���� ���̺��� ���� �����͸� ����
           �� outer ��������
           
///////////////////////////////////////////////////////////////////////////////////////////

    �� left join / right join ������
    
        ex. �л� ���̺��� ��� ���� ��������, ���� ���̺��� �й��� ��ġ�ϴ� �ุ ��������(null������ ��)
                select ST.*, SU.*
                from tb_student ST left join tb_sugang SU
                                   on ST.hakno = SU.hakno;

-- Q1. left join�� �̿��ؼ� ������û�� ���� ���� �й�, �̸�, �����ڵ� ��ȸ�Ͻÿ�
select ST.hakno, uname
from tb_student ST left outer join tb_sugang SU      
                   on ST.hakno = SU.hakno
where ST.hakno not in (select hakno from tb_sugang)  
order by ST.hakno;

-- ����� �ڵ�
select SU.hakno, uname, SU.hakno, SU.gcode
from tb_student ST left join tb_sugang SU    
                   on ST.hakno = SU.hakno
where SU.hakno is null;

����������������������������������������������������������������������������������������������������������������������������������

-- Q2. right join�� �̿��ؼ� ������û�� ���� ���� �й�, �̸�, �����ڵ� ��ȸ�Ͻÿ�
select ST.hakno, uname
from tb_sugang SU  right outer join tb_student ST     
                   on ST.hakno = SU.hakno
where ST.hakno not in (select hakno from tb_sugang)  
order by ST.hakno;

-- ����� �ڵ�
select SU.hakno, uname, SU.hakno, SU.gcode
from tb_sugang SU  right outer join tb_student ST     
                   on ST.hakno = SU.hakno
where SU.hakno is null;

///////////////////////////////////////////////////////////////////////////////////////////

       �� (+)��ȣ�� �̿��� ���̺� ���� ��
                : (+)��ȣ�� ��ġ���� �ʴ� ���� �����ϴ� ���� �ʿ� ���δ�
                : join��� �޸� ��� 
                
select ST.hakno, ST.uname, SU.gcode, SU.hakno
from tb_student ST, tb_sugang SU
where ST.hakno = SU.hakno(+);       -- left join

select ST.hakno, ST.uname, SU.gcode, SU.hakno
from tb_sugang SU, tb_student ST
where SU.hakno(+) = ST.hakno;       -- right join
                

                
                
                
                
                
                