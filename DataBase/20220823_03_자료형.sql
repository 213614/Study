-- 파일 → 새로만들기 → 데이터베이스 계층 → 데이터베이스 파일
-- i:\java202207\database\20220823_03_자료형
-- 테이블은 오라클서버에 저장되므로 같은 이름으로 연습할거면 drop으로 지우고 해야함
//////////////////////////////////////////////////////////////////

    【 Oracle DB 자료형 】
          ο 숫자형
               - number      전체자릿수(38)까지 표현. 표준SQL문의 int형과 동일하지만, 소수점 표현도 가능함
                                                              (int는 정수만)
               - number(3)   전체자릿수(3) -999~999 
                             → 세자리 수 까지만 허용한다는 뜻 
               - number(6,2) 전체 자릿수(6)이고, 6칸내에서 소수점 자릿수(2)까지만 표현 허용
          
          ο 문자형
               - char        최대길이 2000바이트    : 고정형
               - varchar2    최대길이 4000바이트    : 가변형 
               - long        최대 2GB까지
  
           ο 이진파일
               - blob
               ※ 파일을 데이터베이스에 저장할 수는 있으나 절대 사용하지 않음 (DB 용량때문에)
                  → DB에는 파일 명만 저장하고 파일 자체는 하드디스크에다 저장
                  → 경로를 매치시켜서 보여주는것
           
           ο  날짜형
               - date       년/월-일 시:분:초
               - timestamp  기본날짜형을 확장한 자료형

//////////////////////////////////////////////////////////////////

    【 Maria DB 자료형 】: MySQL과 비슷

          ο 숫자형 : tinyint, smallint, mediumint, int, bigint, float, double, boolean
               - TINYINT(자리수) : 달력에서 연도빼고 제일 큰 수는 31이니까 그럴때 쓰임 (데이터 손실 방지)
               - SMALLINT(자리수)
               - MEDIUMINT(자리수)
               - INT(자리수)      ＊ 기준 
               - BIGINT(자리수)
               - FLOAT(전체자리수, 소수점이하자리수)     : 실수형
               - DOUBLE(전체자리수, 소수점이하자리수)    : 실수형
               - boolean : true / false

          ο 문자형 :  char, varchar, tinytext, text, mediumtext, longtext
               - CHAR(글자수)    => 255자까지          : 고정형
               - VARCHAR(글자수) => 255자까지          : 가변형
               - TINYTEXT        => 255자까지
               - TEXT            => 65535자까지       ＊ 기준 (ex.이메일 textbox) 
               - MEDIUMTEXT      => 16777215자까지
               - LONGTEXT        => 4294967295자까지

          ο 날짜형 : date, datetime, timestamp, time, year












