-- ���� �� ���θ���� �� �����ͺ��̽� ���� �� �����ͺ��̽� ����
-- i:\java202207\database\20220823_01_���� ����
-- ���̺��� ����Ŭ������ ����ǹǷ� ���� �̸����� �����ҰŸ� drop���� ����� �ؾ���
//////////////////////////////////////////////////////////////////

    �� ���� ���� ��   
        - SQL�� �� �� �ٸ� SQL��
        - ���̺� ������ �ٽ� �ѹ� �������� ���� ���ڵ� ��ȸ �� �˻�
        - ��ȣ�� �� �����
    
-- ���� ������ ��� ��ȸ
select avg(kor) from sungjuk;
-- �� ���� ���� ��� �Ҽ��� ���� ��ȸ
select round(avg(kor),0) from sungjuk;      -- 66 
-- ���� ���� ��� �Ҽ��� ���� ��ȸ + Į����
select round(avg(kor),0) as kor_aver from sungjuk;

--����1. ���� �������(66)���� ���� �������� ��ȸ�Ͻÿ�
select uname,kor
from sungjuk
where kor >= 66 ;      -- where kor >= round(avg(kor),0)�� �ϸ� ������!
                       -- 66�� ���밪�̴ϱ� ��� ���� �� �޸� ������ ��ü�� ������ �ȴ�
                       -- ���� ��� ������ ���ϴ� �������̴ϱ�! �װ� ��������! 
-- ���������� �����Ű�� 
select uname,kor
from sungjuk
where kor >=(select round(avg(kor),0) from sungjuk);  -- �ڼ�������! : ��ȣ �ȿ� �����ݷ� ���� ����

-- Q1. ���� ������ �������� ����� ���� �� �� ��պ��� ���� ������ ���� 
--     �࿡ ���� ����, �̸�, ���������� ��ȸ�Ͻÿ�

-- 1) ���� ������ �������� ��� (+ �ݿø�, �Ҽ�������)
select round(avg(kor),0)
from sungjuk
where addr='Seoul';             -- 73

-- 2)
select addr, uname, kor
from sungjuk
where kor >= ( select round(avg(kor),0)
               from sungjuk
               where addr='Seoul' )
order by addr;

-- Q2. ���������� �������� ��պ��� ���� ���������� �ٸ� ������ �ִ��� ��ȸ�Ͻÿ� 
--      = Q1 �信�� ���������� ���� ��ȸ

-- ���� ������ �ߴµ� ���߿� �ּҵ� ������ ���� ����� �߻��ϸ� ���ļ� ��µɰŰ��� �����ó�� and����ϱ�
select addr, kor
from sungjuk
where kor >= ( select round(avg(kor),0)
               from sungjuk
               where addr='Seoul' )
group by addr, kor
having   addr in ('Busan','Jeju','Suwon')       -- �����ó�� �ϴ°� �� ����
order by kor desc;

-- ����� �ڵ�
select addr, uname, kor
from sungjuk
where kor >= ( select round(avg(kor),0)
               from sungjuk
               where addr='Seoul' )
      and addr <> 'Seoul';    -- addr != 'Seoul'�� ����


-- Q3. ���������� �ּҰ����� ���� ������ ���� �Ǵ� ���������� �ִ��� ��ȸ�Ͻÿ�
-- 1)
select min(kor) from sungjuk; 
-- 2)
select uname, mat, eng
from sungjuk
where mat<=(select min(kor) from sungjuk) 
      or eng<=(select min(kor) from sungjuk);

-- ����� �ڵ�
-- 1) ���� ���� �ּҰ�
select min(kor) from sungjuk; 
-- 2) 
select uname,kor, mat, eng
from sungjuk
where mat<=(select min(kor) from sungjuk) 
      or eng<=(select min(kor) from sungjuk);


select*from sungjuk;
commit;