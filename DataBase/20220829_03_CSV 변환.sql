-- ���� �� ���θ���� �� �����ͺ��̽� ���� �� �����ͺ��̽� ����
-- i:\java202207\database\20220829_03_CSV ��ȯ.sql
-- ���̺��� ����Ŭ������ ����ǹǷ� ���� �̸����� �����ҰŸ� drop���� ����� �ؾ���
///////////////////////////////////////////////////////////////////////////////////////////

    �� CSV ��
        �� CSV ���� : �����Ϳ� �����͸� �޸�, �����̽���, ������ ���еǾ��ִ� ���� 
                     �����ͺ��̽��� ����ͼ� ��� 

        �� �������������� https://data.go.kr/ Ȱ��

        �� ���� ������ ��ȿ���� �ƴ����� �������� �Ǵ�.
        
        ��  ù ���� ���������� �� �������� �����ؾ���

�� ���θ� �����ȣ ���̺� �����ϱ� ��
--1) zipdoro.csv �غ� (�� 258267��)

--2) zipdoro.csv�� �����ϴ� zipdoro ���̺� ����
create table zipdoro (
     zipno          char(5)         -- �����ȣ
    ,zipaddress     varchar(1000)   -- �ּ�
);
commit;

--3) ��������(����������Ʈ)�� ��������(�ͽ���Ʈ) ��� : ���ӡ����̺��zipdoro���Ŭ��
    �� ��� üũ ���� (ù ���� ������ �ƴϰ� �����Ͱ� ��������ϱ�)
    
    �� ���õ� ���� ���̺��� ������ �����͵� 
    
    �� ����� ���� Į���� ������ �����Ͱ� �� ������ Ȯ��
       - �� ���ǿ��� ��� ���̺� �� �̸� Ȯ��

select count(*) from zipdoro;

-- Q1. ���� Ư���� �������� ���۵Ǵ� �����ȣ�� ��ΰ�
select count(*) gangnam_cnt
from zipdoro
where zipaddress like '����Ư���� ����%';

-- Q2. �ѱ��������б�_���ߵ��б���ġ.csv�� ��ȯ�Ͻÿ�

--1) �ѱ��������б�_���ߵ��б���ġ.csv�� �����ϴ� school_location ���̺� ����

create table school_location (
     schid       varchar2(10)                -- �б�id (pk)
    ,schname     varchar2(255)               -- �б���
    ,schlev      varchar2(20)                -- �б����(�ʡ��ߡ���)
    ,schaddr     varchar2(255)               -- �б� �ּ� 
    ,schdate     varchar2(10)                -- �б� ������
    ,cdate       varchar2(10)                -- �б� ������
    ,lati        number(20,10)               -- ����
    ,longi       number(20,10)               -- �浵
);
commit;

drop table school_location;

select count(*) cnt from school_location;           -- 11873

-- Q2-1. null sell ã��
select *
from school_location
where schaddr is null;

