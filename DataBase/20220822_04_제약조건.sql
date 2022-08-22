-- 파일 → 새로만들기 → 데이터베이스 계층 → 데이터베이스 파일
-- i:\java202207\database\20220822_04_제약조건
-- 테이블은 오라클서버에 저장되므로 같은 이름으로 연습할거면 drop으로 지우고 해야함
//////////////////////////////////////////////////////////////////

-- 쓰레기 정보(유효하지않은 데이터)가 들어가지 않기 위해 자료형과 제약조건이 중요하다.

    【 자료형(데이터타입) 】 참조: http://pretyimo.cafe24.com/lectureRead.do?lectureno=186
          1. 문자형
                - 가변형 : 메모리를 효율적으로 쓰기에 더 적합
                        : varchar
                            ex.  varchar(5) 'sky'  → 2칸은 알아서 삭제된다.
                            ex.  아이디와 비밀번호, 이름, 주소 (사용자마다 글자 수가 다르니까)
                            
                - 고정형 : 값을 select하는 속도가 더 빠르다 / 조건을 잘 줘야함
                        : char(5)
                            ex.  char(5) 'sky  '  → 2칸이 공백문자로 포함된다.
                            ex.  주민등록번호, 우편번호, 계좌번호 (모든 사용자의 번호가 고정된 글자수를 가짐)
         
          2. 숫자형
                - int : 정수 숫자형 
         
          3. 날짜형
                : 연/월/일(연-월-일) 시:분:초
                - 문자열 타입으로 입력한다 (단, 함수를 사용하는 경우 문자열X ex.sysdate)
                - date
                
//////////////////////////////////////////////////////////////////

    【 테이블 제약조건 】
            : 칼럼 하나하나당 제약조건을 세세하게 줄 수 있다.
            
            1. primary key
                : 기본키, 유일성 = 나와 같은 값을 다른 칼럼이 가질 수 없다
                : 모든 테이블에는 primary key가 최소 1개는 무조건 존재해야한다
                : 중복값·null값(빈값)을 허용하지 않는다. = 반드시 데이터를 입력해야한다)
                : where조건 절에 걸릴 수 있는 대표적인 칼럼을 강제할 수 있다.
                
                ex. 주민등록번호, 핸드폰번호, 계좌번호, 아이디, 이메일
                (멤버테이블은 id를 primary key로 지정하는것이 가장 일반적)
                - 'sungjuk' 테이블에서는 primary key로 지정할 것이 마땅치 않으므로
                   일련번호를 primary key로 지정한다.(primary key는 기본 제약조건이 not null)
            
            2. not null
                : 빈 값을 허용하지 않는다.
                
            3. check
                : 입력할 값을 특정 범위로 제한한다.
                  (조금 더 깨끗한 데이터가 들어갈 수 있다)
                : check(칼럼명 between A and B)
                : check(칼럼명 in ('', '', '', ···.)
                  
            4. default
                : 사용자가 값을 입력하지 않으면 해당 칼럼이 정의한 기본값을 자동으로 입력해준다
            
            5. unique (primary key 여러개 설정 가능?)
                : 중복된 데이터를 허용하지않음. (primary key는 하나정하고 그 외에는 unique)
                : unique는 null값을 한번은 허용한다.(primary key 무조건 not null)
                    → 두번하면 중복되므로 한번만 허용한다.
                ex. 멤버테이블 설계 시 id는 primary key / 주민등록번호, 이메일 등은 unique
            
            6. foreign key (테이블끼리의 join에 관련된 제약조건)
                : 외래 키 
                : 테이블을 join하는 경우 부모와 자식 관계를 설정
                : 장바구니 하나를 만들더라도 테이블이 3개나 필요하므로 foreign key을 사용한다
                : 부모테이블을 참조하고 자식테이블이 이루어진다(부모테이블에 없으면 자식테이블에도 insert안됨)


//////////////////////////////////////////////////////////////////

-- 'sungjuk' 테이블 삭제
drop table sungjuk;

-- 'sungjuk' 테이블 생성 
create table sungjuk(
    snum        int             primary key     
                                --→ 기본키(primary key) : 중복을 허용하지않음.
                                --  (옆에 말고 맨 마지막에 따로 작성할수도있음)
                                
    ,uname      varchar(50)     not null
    
    ,kor        int             check(kor between 0 and 100)
                                --→ 국어 점수를 0~100 사이의 점수만 줄 수 있음
    ,eng        int             check(eng between 0 and 100)
    ,mat        int             check(mat between 0 and 100)
    
    ,addr       varchar(20)     check(addr in ('Seoul', 'Jeju', 'Busan', 'Suwon'))
                                --→ 서울, 제주, 부산, 수원 네곳 중 하나만 입력 가능
                                -- 문자열도 가능
                                
    ,tot        int             default 0
                                --→ 데이터가 입력되지 않으면 기본값 0이 설정됨(null은 비어있는값)
    ,aver       int             default 0
    ,wdate      date            default sysdate
                                --→ 따로 시간을 설정하지않으면 기본값으로 시스템의 현재 시간이 입력됨
);

select*from sungjuk;

//////////////////////////////////////////////////////////////////

    【 테이블 제약조건 관련 에러메세지 】
            ο primary key(PK) 제약조건
                - ORA-00001: 무결성 제약 조건(SYSTEM.SYS_C007318)에 위배됩니다
                    insert into sungjuk(snum, uname) values (1,'홍길동');
                        : 두번 실행하면 primary key(snum)가 중복되기때문에 오류가 남
                        : = snum칼럼은 기본키(PK)이므로 중복된 값을 허용하지 않음
            
            ο not null 제약조건    
                - ORA-01400: NULL을 ("SYSTEM"."SUNGJUK"."UNAME") 안에 삽입할 수 없습니다
                    insert into sungjuk(snum) values (1);
                        : uname 안에 빈값을 허용할 수 없음
                
            ο check 제약조건    
                - ORA-02290: 체크 제약조건(SYSTEM.SYS_C007316)이 위배되었습니다
                    insert into sungjuk(snum, uname, kor, eng, mat) 
                    values (1,'홍길동', -10, 20, 300);
                        : 국영수에 제약조건해놓은 점수 범위(0~100)를 벗어남
                        
                    insert into sungjuk(snum, uname, kor, eng, mat, addr) 
                    values (1,'홍길동', 10, 20, 30, 'Incheon');
                        : 주소 범위(addr in ('Seoul', 'Jeju', 'Busan', 'Suwon'))에 벗어남

            ο default 제약조건 
                -
                    insert into sungjuk(snum, uname, kor, eng, mat, addr) 
                    values (2,'무궁화', 10, 20, 30, 'Jeju');
                        : tot,aver은 디폴트값인 0점이 들어간다.
                    select*from sungjuk;
                    
            ο 흔한 error code
                - ORA-00913: 값의 수가 너무 많습니다  "too many values"
                    insert into sungjuk(snum, uname, kor, eng, mat) 
                    values (2,'무궁화', 10, 20, 30, 'Jeju');
                        : 칼럼은 5개인데 값은 6개라 오류 = 칼럼 수와 값의 수가 일치하지 않는 경우
                
                - ORA-00947: 값의 수가 충분하지 않습니다  "not enough values"
                    insert into sungjuk(snum, uname, kor, eng, mat, addr) 
                    values (2,'무궁화', 10, 20, 30);
                        : 칼럼은 6개인데 값은 5개라 오류 = 칼럼 수와 값의 수가 일치하지 않는 경우

















