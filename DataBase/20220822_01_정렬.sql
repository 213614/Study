-- 파일 → 새로만들기 → 데이터베이스 계층 → 데이터베이스 파일
-- i:\java202207\database\0220822_01_정렬
-- 테이블은 오라클서버에 저장되므로 같은 이름으로 연습할거면 drop으로 지우고 해야함
//////////////////////////////////////////////////////////////////
    
    【 수업내용 】
        - sort 정렬
        - 테이블 수정
        -  시퀀스

//////////////////////////////////////////////////////////////////

    【 정렬 】
    : DB에 저장되어진 정보를 정렬해서 가져와야한다. 
     (저장된 순서나, 행의 순서가 수정 삭제 추가를 반복하며 섞이기때문에 정렬을 해야한다)
    : 정렬이 잘되어있으면 JAVA에서 접근하기가 쉽다.
    
    【 Sort 정렬 】    
    : 어떠한 특정값(keyfield)을 기준으로 순서대로 재배치하는 것.
        - 오름차순 정렬(Ascending Sort  : ASC)  ＊생략하면 ASC가 기본값
            : 작은 수에서 큰 수로 점점 커짐 (1 → 10 / A → Z → a → z → ㄱ → ㅎ)
        - 내림차순 정렬(Descending Sort : Desc)
            : 큰 수에서 작은 수로 점점 작아짐 (10 → 1 / ㅎ → ㄱ → z → a → Z → A)
        - 형식 
            : order by 칼럼명1                → 1차 정렬 
            : order by 칼럼명1, 칼럼명2, ···.; → 2차 정렬 (칼럼이 너무 많으면 테이블 설계가 잘못 된 것)
            : 1차가 같고 그걸 기준으로 2차도 같으면 3차 ···.
            : ex. 우리반 안에서 여성/남성(1차) 각 여성/남성에서 나이대별로(2차) 나이대 별 안에서 지역별까지(3차)
            
-- 성적 테이블을 조회하시오
select*from sungjuk;

-- 전체 레코드의 이름순(오름차순)으로 정렬해서 조회하시오
select uname                -- 3. uname 레코드만 보여주세요.
from sungjuk                -- 1. '성적'테이블에서
order by uname asc;         -- 2. uname칼럼을 오름차순 정렬해서

-- asc(오름차순)은 기본값이라 생략 가능
select uname              
from sungjuk                
order by uname;

-- desc(내림차순) 
select uname              
from sungjuk                
order by uname desc;

-- 국어 점수을 기준으로 오름차순 정렬해서 조회하시오(1차 정렬)
select uname, kor
from sungjuk
order by kor;

-- 동점대사람들 안에서 이름을 기준으로 내림차순 정렬을 또 하고싶다(2차 정렬)
select uname, kor
from sungjuk
order by kor, uname desc;      -- → 국어점수를 오름차순 정렬 후 동점자 사이에서 
                               -- 이름을 기준으로 내림차순 정렬을 해주세요.
select *
from sungjuk
order by kor desc, eng desc, mat desc;        
    -- 국어, 영어, 수학 점수가 같다면 내림차순으로 정렬 (모두 내림차순 정렬)
    -- kor desc(1차 정렬) eng desc(2차 정렬) mat desc(3차 정렬)

//////////////////////////////////////////////////////////////////

-- ＊정렬 할 떄 원하는 대상(행)을 지정할 수 있다＊
-- Q1. 평균 70점 이하 행을 이름순으로 조회하시오.
select uname, aver
from sungjuk
where aver<=70
order by uname asc;

--강사님 코드
-- 평균 70점 이하 학생 조회
select uname, aver
from sungjuk
where aver<=70;
-- 70점 이하 학생들 이름을 기준으로 오름차순 정렬 
select uname, aver
from sungjuk
where aver<=70
order by uname;
-- ★ 한번에 다 하지말고 단계별로 나누어서 작동되는지 봐가며 진행한다.

select uname, aver
from sungjuk
order by uname 
where aver<=70;         -- 이름 순으로 정렬 후 70점 이하 학생들 조회하기
-- 순서가 바뀌면 에러가 난다. (error code : ORA-00933)
-- ★ 먼저 조건으로 대상을 추린 후 정렬해야한다 (대체적으로 order by는 후순위)

//////////////////////////////////////////////////////////////////

    【 Alter 명령어 】
        - 테이블의 구조 자체를 수정 및 변경하는 것으로 
          자주 사용하면 테이블 설계가 잘못되었다는 뜻(잦은 수정은 데이터 손실로 이어진다)
          ex. 칼럼의 제약조건 수정 등 

        1. 컬럼 추가
             alter table table명 add (컬럼명 데이터타입 계약조건);
                -- 연습_ 음악(music) 칼럼 추가
                   alter table sungjuk add (music int null);
                   select*from sungjuk;
                
        2. 컬럼명 수정 : 영구적 수정(as는 일시적 수정)
             alter table table명 rename column 원래컬럼명 to 바꿀컬럼명;
                -- 연습_ 국어(kor)을 korea로 수정
                   alter table sungjuk rename column kor to korea;
                   select*from sungjuk;
                
        3. 컬럼 데이터 타입 수정 : 데이터타입 수정시 저장된 데이터가 날라갈수도있음
             alter table table명 modify(컬럼명 데이터타입);
                -- 연습_music의 자료형을 int에서 varchar로 변경
                   alter table sungjuk modify(music varchar(5));
                   select*from sungjuk;
                
        4. 컬럼 삭제 : 백업이 없으면 복구 불가니까 신중히 삭제하기
             alter table table명 drop(컬럼명);
                -- 연습_music 칼럼 삭제 
                   alter table sungjuk drop(music);
                   select*from sungjuk;
                   

        





