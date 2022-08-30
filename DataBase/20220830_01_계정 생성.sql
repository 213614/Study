-- 파일 → 새로만들기 → 데이터베이스 계층 → 데이터베이스 파일
-- i:\java202207\database\20220830_01_계정 생성.sql
-- 테이블은 오라클서버에 저장되므로 같은 이름으로 연습할거면 drop으로 지우고 해야함
///////////////////////////////////////////////////////////////////////////////////////////

    【 최고관리자 계정 】
        ο Oracle   : system 또는 sys
        ο Maria DB : root
        ο MS-SQL   : sa

    【 DCL명령어 】
        : Data Control Language 제어어
        - 사용자가 별로 쓸일 없음. 호스팅 업체가 주로 사용
        
        ο grant    사용자 접근 권한 부여
        ο revoke   사용자 접근 권한 취소
        ο deny     특정 사용자만 접근 차단
        
///////////////////////////////////////////////////////////////////////////////////////////

        ο 계정 생성시 세션 변경해야 함
               alter session set "_ORACLE_SCRIPT"=true;

        ο 오라클 서버에서 발급해준 아이디가 있는지 확인 : 사용자 계정 목록 조회
               select username from all_users;

        ο 테이블 스페이스(테이블의 저장 공간)생성
               create tablespace 테이블스페이스 이름
               datafile '데이터 파일 저장 경로' size 초기 사이즈
               autoextend on           -- ↓ 옵션(선택사항)
               next 자동 증가 사이즈  
               maxsize 최대 사이즈;
               
         ex.   create tablespace java202207
               datafile 'i:\java202207\database\java202207.dbf' size 50m
               autoextend on
               next 10m             -- 초기사이즈50m가 꽉차면 추가로 10m 더 
               maxsize unlimited;

        ο 모든 권한 부여 
               grant connect, resource, dba to 아이디;
               
         ex.   grant connect, resource, dba to java202207;
            
        ο 사용자 계정 생성
               create user 아이디 identified by 비번
               default tablespace 테이블스페이스이름;

         ex.   create user java202207 identified by 1234
               default tablespace java202207;

        ο 사용자 계정 삭제
               drop user 아이디 cascade;
               
         ex.   drop user java202207 cascade;            
         
        ο 테이블 스페이스 종류 확인       
               select tablespace_name, contents  from dba_tablespaces;         

        ο 테이블 스페이스 삭제
               drop tablespace 테이블스페이스명
               including contents and datafiles
               cascade constraints;        
        
         ex.   drop tablespace java202207        
               including contents and datafiles
               cascade constraints;        

commit;
