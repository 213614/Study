-- ���� �� ���θ���� �� �����ͺ��̽� ���� �� �����ͺ��̽� ����
-- i:\java202207\database\20220830_01_���� ����.sql
-- ���̺��� ����Ŭ������ ����ǹǷ� ���� �̸����� �����ҰŸ� drop���� ����� �ؾ���
///////////////////////////////////////////////////////////////////////////////////////////

    �� �ְ������ ���� ��
        �� Oracle   : system �Ǵ� sys
        �� Maria DB : root
        �� MS-SQL   : sa

    �� DCL��ɾ� ��
        : Data Control Language �����
        - ����ڰ� ���� ���� ����. ȣ���� ��ü�� �ַ� ���
        
        �� grant    ����� ���� ���� �ο�
        �� revoke   ����� ���� ���� ���
        �� deny     Ư�� ����ڸ� ���� ����
        
///////////////////////////////////////////////////////////////////////////////////////////

        �� ���� ������ ���� �����ؾ� ��
               alter session set "_ORACLE_SCRIPT"=true;

        �� ����Ŭ �������� �߱����� ���̵� �ִ��� Ȯ�� : ����� ���� ��� ��ȸ
               select username from all_users;

        �� ���̺� �����̽�(���̺��� ���� ����)����
               create tablespace ���̺����̽� �̸�
               datafile '������ ���� ���� ���' size �ʱ� ������
               autoextend on           -- �� �ɼ�(���û���)
               next �ڵ� ���� ������  
               maxsize �ִ� ������;
               
         ex.   create tablespace java202207
               datafile 'i:\java202207\database\java202207.dbf' size 50m
               autoextend on
               next 10m             -- �ʱ������50m�� ������ �߰��� 10m �� 
               maxsize unlimited;

        �� ��� ���� �ο� 
               grant connect, resource, dba to ���̵�;
               
         ex.   grant connect, resource, dba to java202207;
            
        �� ����� ���� ����
               create user ���̵� identified by ���
               default tablespace ���̺����̽��̸�;

         ex.   create user java202207 identified by 1234
               default tablespace java202207;

        �� ����� ���� ����
               drop user ���̵� cascade;
               
         ex.   drop user java202207 cascade;            
         
        �� ���̺� �����̽� ���� Ȯ��       
               select tablespace_name, contents  from dba_tablespaces;         

        �� ���̺� �����̽� ����
               drop tablespace ���̺����̽���
               including contents and datafiles
               cascade constraints;        
        
         ex.   drop tablespace java202207        
               including contents and datafiles
               cascade constraints;        

commit;
