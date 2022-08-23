-- ���� �� ���θ���� �� �����ͺ��̽� ���� �� �����ͺ��̽� ����
-- i:\java202207\database\20220823_02_Oracle �Լ�
-- ���̺��� ����Ŭ������ ����ǹǷ� ���� �̸����� �����ҰŸ� drop���� ����� �ؾ���
//////////////////////////////////////////////////////////////////

    �� Oracle �Լ� �� : JS�� ��κ� ����
        �� ���ڿ� �Լ� 
              - ���� ���̺� dual : ������ �������� ������ ���̺� ����� ���� �߰��߰�
                                  ����� Ȯ���Ҷ� �ӽ÷� ������ִ� ���̺�(�ӽ����̺�)
                                  
           lower() : ��ȣ �ȿ��ִ� �����͸� ���� �ҹ��ڷ� �ٲ���
                ex. select lower('Hello World') from dual;        -- hello world
                
           upper() : ��ȣ �� ���� �빮�� 
                ex. select upper('Hello World') from dual;        -- HELLO WORLD
                    
           length() : ��ȣ �� ���� �� (���鹮�� ����)
                ex. select length('Hello World') from dual;       -- 11
                
           substr('',n,m) : ' '�ȿ� ���ڸ� n ~ m��°������ �߶� ��� 
                            �� 1��°���� ���� (JS�� 0��°���Ϳ���)
                ex. select substr('Hello World', 1,5) from dual;  -- Hello 

           instr('n','m') : n���� �ȿ� m���ڰ� ���° �������� ��� 
                ex. select instr('Hello World','W') from dual;    -- 7

           lpad('n',m,'o') : n���ڿ��� mĭ������ ����ϰ� ���� ��ĭ�� o�� ä���     
                ex. select lpad('SKY', 5, '*') from dual;         -- **SKY

           rpad('n',m,'o') : n���ڿ��� mĭ������ ����ϰ� ������ ��ĭ�� o�� ä���
                ex. select rpad('SKY', 5, '*') from dual;         -- SKY**

           replace ('n', 'm', 'o') : n���ڿ��� m�̶�� ���ڸ� o�� ��ȯ(Ư�� ���� ��ȯ)
                ex. select replace('happy', 'p', 'k') from dual;  -- hakky
                
           ASCII���� ��ȯ(�ƽ�Ű ����) : �������� ������� ���� ���ĺ��� ����ϴ� ���� ���ڵ�
                select chr(65) from dual;       -- A                      
                select chr(66) from dual;       -- B           
                select chr(97) from dual;       -- a
                select chr(98) from dual;       -- b 
    
           concat('n','m') : ��ȣ �� ���ڿ� �����ϱ� 
                ex. select concat('�ι̿�','�ٸ���') from dual;     -- �ι̿��ٸ���
                ex. select concat(uname,'�� �����'), concat(aver,'�Դϴ�.') from sungjuk;
                    --�� Į���̶��� ���� ���� / �����: �ֵ���ũ�� ����� 90�Դϴ�. 

           || ���� ������ : Į���� || '' = Į���� �ڿ� ' '�� �������ּ��� 
                ex. select uname || '�� �����' || aver || '�Դϴ�.' from sungjuk;   
                                                             -- �ֵ���ũ�� �����90�Դϴ�.
                                                             -- �ϳ��� Į���ȿ� �� �������� ����
                    select uname || '�� �����' || aver || '�Դϴ�.' as str from sungjuk;
                                                             -- Į������ str�� ���� 
                                                             -- strĮ�� �ȿ� �ֵ���ũ�� �����90�Դϴ�.
            
        �� ���� ���� �Լ�
        
           round(n,m) : n��(�Ǽ�)�� �Ҽ��� �ݿø� �� m��°���� ��� (m=0�̸� ������ ���)
                ex. select round(7.221, 1) from dual;   -- 7.2
                
           abs() : ��ȣ ���� ���밪�� ������
                ex. select abs(-7) from dual;           -- 7
                
           mod(n,m) : n��m�� ������ ������ (JS���� % ������ ������)
                 ex. select mod(5, 3) from dual;        -- 2    
                
           ceil() : ��ȣ ���� �Ǽ� �Ҽ��� �ø� 
                 ex. select ceil(12.4) from dual;       -- 13
                
           trunc(n, m) : ��ȣ ���� n(�Ǽ�) �Ҽ��� ������ m��° �ڸ����� ��� (m=0�� �Ҽ��� ���� ������ ���)
                 ex. select trunc(13.56, 1) from dual;
   
-- ����              
select avg(kor)           from sungjuk;         -- 66.36363636363636363636363636363636363636
select ceil(avg(kor))     from sungjuk;         -- 67
select trunc(avg(kor), 2) from sungjuk;         -- 66.36
select round(avg(kor), 2) from sungjuk;         -- 66.36

           to_number('���������� ���ڿ�') : ��ȣ �� ���������� ���ڿ�(ex.'2')�� ������ �����ͷ� ��ȯ
                 ex. select to_number('123')+1 from dual;       -- 124
                     select '100'+1 from dual;                  -- 100 
                     -- ''�ȿ� ������ ���ڰ� �������� �ڵ����� to_number�Լ��� ȣ���ϱ⶧���� ����!
                    
        �� ��¥ ���� �Լ�
        
           sysdate : �ý����� ���� ��¥ �� �ð������� �����ϴ� �Լ�  (JS���� date��ü)     
                 ex. select sysdate from dual;      -- 22/08/23
                     
           extract(n from m) : m���� n�����͸� ���� 
                 ex. sysdate���� ��/��/�� ����
                     select extract(year  from sysdate) from dual;   -- 2022
                     select extract(month from sysdate) from dual;   -- 8
                     select extract(day   from sysdate) from dual;   -- 23
                            --       �� ���� �̴°� date�� �ƴ϶� day�ϱ� ����
                     
                     -- ��¥ �������� ����
                     select sysdate+100 from dual;  -- 22/12/01 : ���� �ý��� ��¥���� 100�� �� 
                     select sysdate-100 from dual;  -- 22/05/15 : ���� �ý��� ��¥���� 100�� ��         
        
                     -- �� ��¥ ������ ������ ���
                     select months_between(sysdate+100, sysdate-100) from dual;
                                                    -- 6.5483870967741935483870967741935483871
                     select months_between('2022/08/23', '2022/05/15') from dual;                               
                                                    -- 3.25806451612903225806451612903225806452
                     select months_between('2022/08/23', '2022/12/01') from dual;                                                       
                                                    -- -3.29032258064516129032258064516129032258
                                                    
           to_date('') : ��ȣ �� �������� ���ڿ��� ��¥�� �����ͷ� ��ȯ                                           
                 ex. select to_date('2022/10/25') from dual;     
                                                    -- 22/10/25
                     select to_date('2022/10/25') - to_date('2022/10/30') from dual;
                                                    -- -5 (���굵 ����) 

//////////////////////////////////////////////////////////////////

    �� nvl() �Լ� �� : mariaDB���� ifnull()
        : null���� ���� ��� null���� �ٸ� ������ �ٲ���    ������ ����ԣ�
        ����:  nvl(��, ������) : select�ȿ��� ��� 
        
        
-- �ּҰ� 'Incheon'�� ���� �������� �ִ밪, �ο����� ��ȸ�Ͻÿ�
select nvl(max(kor),0) as kor_max, count(*) cnt
--     �� ���� �ִ밪�� null���̸� 0�� �����Ѵ� (��õ������ü�� �����Ƿ� null���� ���ü��ۿ�����)
--     �� 0 �ڸ��� ���ڿ� �ȵ� 
from sungjuk
where addr='Incheon';

-- ����� �ڵ�
select max(kor), count(*)       -- �ִ밪(null), �ο���(0)
from sungjuk
where addr='Incheon';

select count(*)+1               -- 0+1 = 1 
from sungjuk
where addr='Incheon';

select max(kor)+1               -- null+1 = (null) �� null���� ���� �Ұ�
from sungjuk
where addr='Incheon';

select nvl(max(kor),0)          -- 0 : null���̸� 0���� ��ü           
from sungjuk
where addr='Incheon';

select nvl(max(kor),0)+1 as max_kor   -- 0+1 = 1            
from sungjuk
where addr='Incheon';

-- �������) �Ϸù�ȣ snumĮ���� max���� +1�� �ٽ� �Ϸù�ȣ�� �־��ָ� ������ó�� ����� �� �ִ�
--          �׷��� nvl()�� ����Ѵ�

//////////////////////////////////////////////////////////////////

    �� ���� Į�� �� : ��¥�� �ƴ����� ��¥ó�� �� �� �ִ� Į��   
        
        �� rownum : ���ȣ  (�����ֻ�룪)
                    
        �� rowid  : ���� �ּҰ�
        
        �� ������ ������(���������� ����� �ƴ�����) �ý��������� �����Ǿ� ���� select�� ������ ��Ÿ�� 
        �� �����ͺ��� ��ġ���ʴ� ���ϼ��� ������ �����Ƿ� �� Ȱ���� �� �ִ�
        �� �׶��׶����� �ٸ� ������ ���� ���� �ִ� 
        
        
select snum, uname, addr, rownum, rowid        
from sungjuk;
-- snum(�Ϸù�ȣĮ��)�� �ʿ信 ���� ���������� rownum�� ���ϸ� �ȵ�

select snum, uname, addr, rownum 
from sungjuk
where rownum>=1 and rownum<=5;
-- rownum�� 1 �̻� 5 ������ ��鸸 ��ȸ : ������(and/or������.)��� �Բ� ��� ���� 

select snum, uname, addr, rownum 
from sungjuk
where addr='Seoul';
-- rownum�� ���� ��ȸ�� ���̺��� ���ȣ�� �ٿ��ٻ��̴�. (4���� ��ȸ�ϸ� 1~4������ ������ ��)
-- �׷��� �Ϸù�ȣ(������)�̶��� �ٸ��� : �Ϸù�ȣ(snum)�� ���ǿ� ���� ������ �ش� ��ȣ�� ����
    
select snum, uname, addr, rownum 
from sungjuk
order by uname;
-- order by�� rownum�� ������ ���� ������ �ప�� �Բ� ���ĵǹǷ� ������� ���� �ʰ� ���׹����� �ȴ�
-- = �ڽ��� �� ��ȣ(rownum)�� �����Ͽ� ���ĵǹǷ� rownum�� �߰��ϴ� ������ ����ؾ��Ѵ� 
    


    
    
    
    