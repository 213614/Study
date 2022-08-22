-- ���� �� ���θ���� �� �����ͺ��̽� ���� �� �����ͺ��̽� ����
-- i:java202207\database\0220819_03_Where������
-- ���̺��� ����Ŭ������ ����ǹǷ� ���� �̸����� �����ҰŸ� drop���� ����� �ؾ���
//////////////////////////////////////////////////////////////////

    �� Where ������ ��
        - ����: where Į���� ������ ����; 
    ex. ���л� ���� ���л� ���� ������ ����� ���������. 
    = Ư�� ���ǿ� �����ϴ� ��鸸 ������� ����/�۵���ų�� ����Ѵ�.
                                      �� ��ȸ(select)/����(update)/����(delete)
  �� ������
    �� �񱳿����� : >  >=  <  <= 
                 != <> �����ʴ�
                  = ����
   
   �� �������� : �׸��� and,  �Ǵ� or, ���������� not
     ex. �������� 50~59 : kor>=50 and  kor<=59

   �� between A and B : A���� ���� B����
     ex. kor between 50 and 59

   �� in ������
     ex. uname='ȫ�浿' or uname='����ȭ'
         uname in ('ȫ�浿','����ȭ')

   �� like ������ : ����� ���� %
     ex. 'ȫ'������ �˻� : uname like 'ȫ%'
         'ȫ'���� ������ �˻� : uname like '%ȫ'
         'ȫ'���� �ִ°� �˻� : uname like '%ȫ%'
     ex. �ݵ�� �α��� �߿��� ȫ���� ���� : ȫ_

   �� NULL ��
     ex. aver = null (Ʋ�� �ۼ���)
         aver is null
         aver is not null
         
//////////////////////////////////////////////////////////////////

--��1) ���������� 50���̻� ���� ��ȸ�Ͻÿ�
�� SQL���� ���� ������ �߿�. (Ư�� ��ȸ�Ҷ�) 
ex. ��ȸ�� ��ɾ from���� ã�ư�  
select uname, kor           -- 3. �� Į���̶� �����ּ���. 
from sungjuk                -- 1. ��� ���̺�����
where kor>=50;              -- 2. Ư�� ������ ���� �ุ
-- �� sungjuk ���̺��� korĮ���� �����Ͱ� 50�� ���ų� ũ�� uname,korĮ���� �Բ� �����ּ���.

--��2) ���� ������ 50���̸� ���� ��ȸ�Ͻÿ�
select uname, eng
from sungjuk
where eng<50;

--��3) �̸��� '���ѹα�' ���� ��ȸ(���)�Ͻÿ�
select uname, kor, eng, mat
from sungjuk
where uname='���ѹα�';        -- �ش� Į��(�̸�)���� ���ǿ��´� ���('���ѹα�')��
-- �� ����
select uname, kor, eng, mat
from sungjuk
where uname in '���ѹα�';

--��4) �̸��� '���ѹα�' �ƴ� ���� ��ȸ�Ͻÿ�
select uname, mat
from sungjuk
where uname!='���ѹα�';

--��5) ����, ����, ���� �������� ������ ��� 90�̻� ���� ��ȸ�Ͻÿ�
select uname, kor, eng, mat
from sungjuk
where kor>=90 and eng>=90 and mat>=90;

--��6) ����, ����, ���� �߿��� �Ѱ����̶� 40�̸� ���� ��ȸ�Ͻÿ�
select uname, kor, eng, mat
from sungjuk
where kor<40 or eng<40 or mat<40;

--��7) ���������� 80 ~ 89�� ���� ���� ��ȸ�Ͻÿ�
select uname, kor
from sungjuk
where kor between 80 and 89
-- �� ����
select uname, kor   
from sungjuk
where kor>=80 and kor<=89;

--��8) �̸��� '����ȭ', '����ȭ'�� ��ȸ�Ͻÿ�
select uname, kor, eng, mat
from sungjuk
where uname='����ȭ' or uname='����ȭ';
-- �� ����    
select uname, kor, eng, mat     -- select ��� update / delete �ۼ� ����
from sungjuk
where uname in ('����ȭ','����ȭ');
     
    select*from sungjuk;
    
//////////////////////////////////////////////////////////////////

    �� between A and B ������ ��: a ~ b  
        - ����: where Į���� between ����1 and ����2;
select uname, eng
from sungjuk
where eng between 80 and 89;

    �� in ������ �� : ~�ȿ� (��Ͽ��� ã��)
        - ����: where Į���� in ���� | (����1,'����2');
select uname, kor, eng, mat   
from sungjuk
where uname in ('���϶�','���Ȳ�');   
    
select uname, kor
from sungjuk
where kor in 90;       
    
-- �������� 10, 30, 50�� ��ȸ
select uname, kor
from sungjuk
where kor in (10, 30, 50);   
    
//////////////////////////////////////////////////////////////////

-- ��9)��, ��, �� ��� 100���� �ƴ� ���� ��ȸ
select uname, kor, eng, mat
from sungjuk
where kor!=100 and eng!=100 and mat!=100;
    
-- �����
select uname, kor, eng, mat
from sungjuk
where not (kor=100 and eng=100 and mat=100);

//////////////////////////////////////////////////////////////////
    
    �� like ������ ��    
        - ���ڿ� �����Ϳ��� ����� ������ �˻��� �� ����ϴ� ������
        - ����: where Į���� like '����';
        - % : ���� ������ ��� ����
        ex. 'ȫ'���� ���� : uname like 'ȫ%'
            'ȫ'���� ���� : uname like '%ȫ'
            'ȫ'�� ���Ե� : uname like '%ȫ%' ������ ���� ����ԣ�
      
        - _ : ���� �������� ��ġ�ؾ� ��
        ex. �ݵ�� �α��� �߿��� 'ȫ'���� ���� : 'ȫ_'
select uname
from sungjuk
where uname='���ѹα�'; 
-- �� �̸��� ���ѹα� �� �ุ ���� �� ����

select uname
from sungjuk
where uname like '%��%';
-- �� �̸��� '��'�� ����ִ� ��� ���� ��� ����

select uname
from sungjuk
where uname like 'ȫ%' or uname like '%��%';
-- �� �̸��� 'ȫ'���� ���� �Ǵ� '��'�� �� ��� �� ���    

select uname
from sungjuk
where uname like 'ȫ__'; -- ����� �ΰ���
-- �� �̸��� 'ȫ'���� �����ϴ� ������ ���ڿ� �� ��� 
    
--��1) �̸����� 'ȫ'���� �����ϴ� �̸��� ��ȸ�Ͻÿ�
select uname
from sungjuk
where uname like 'ȫ%';

--��2) �̸����� 'ȭ'�� ������ �̸��� ��ȸ�Ͻÿ�
select uname
from sungjuk
where uname like '%ȭ';

--��3) �̸��� '��'���� �ִ� �̸��� ��ȸ�Ͻÿ�
select uname
from sungjuk
where uname like '%��%';

--��4) �α��� �̸����� 'ȭ'�� ������ �̸��� ��ȸ�Ͻÿ�
select uname
from sungjuk
where uname like '_ȭ';

--��5) �̸� ������ �߿��� ��� ���ڰ� '��' �ִ� ���� ��ȸ�Ͻÿ�
select uname
from sungjuk
where uname like '_��_';
    
--��6) ����+������ �����ϰ� �˻�� '�Ľ�Ÿ'�϶� (���̺��� ���� where�� ������)
select subject
from notice
where title like '%�Ľ�Ÿ%' or contents like '%�Ľ�Ÿ%';
-- html���� form���� �Լ����� ���� - db�� �Բ� ����

--��7) ���� ������ 50�� �̻��� �࿡ ���ؼ��� ������ ����� ���Ͻÿ�
select uname, kor, tot, aver        -- ���⼭ select�� from�� ���� �´� �ڵ�
from sungjuk
update sungjuk set tot=kor+eng+mat, aver=(kor+eng+mat)/3
where kor>=50; 
-- false
-- ����� �ڵ�
select * from sungjuk where kor>=50;        -- ���̺� Ȯ�ο�

update sungjuk 
set tot=kor+eng+mat, aver=(kor+eng+mat)/3
where kor>=50;

select * from sungjuk;                      -- ���̺� Ȯ�ο�
--�� ���������� �����ؼ� ���� / update-set�� where���� ������ ���ļ� ��� ���� 

//////////////////////////////////////////////////////////////////

    �� null ����ִ� �� ��
-- ������ ����
select count(tot) from sungjuk;     -- 5 : ������ ������ 5���� ���̶� ��
                                    --     (null�� count������ �����Ƿ� 5��)

-- ������ null�� �ִ� ���� ������ ���Ͻÿ�
select count(*)
from sungjuk
where tot=null;     
--�� �̷����ϸ� null���� Ȯ�� ���� (Ʋ�� �ڵ�)

select uname, tot
from sungjuk
where tot is null;
--�� is �����ڸ� �̿��Ͽ� ���� �� �ִ�

-- ��տ� ������� ���� ���� ������ ���Ͻÿ� (null�� �ƴ� ��)
select count(*)
from sungjuk
where aver is not null;
--�� null�� �ƴ� ���� ���� ���� ���ϴ� �� 

-- ��8) ����ִ� ������ ����� ��� ���Ͻÿ�.
select uname, tot, aver
from sungjuk
where tot is null and aver is null;     -- ���̺� Ȯ�ο� 

update sungjuk 
set tot=kor+eng+mat, aver=(kor+eng+mat)/3
where tot is null or aver is null;

select * from sungjuk;                  -- ���̺� Ȯ�ο� 

