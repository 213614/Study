-- 파일 → 새로만들기 → 데이터베이스 계층 → 데이터베이스 파일
-- i:java202207\database\0220819_03_Where조건절
-- 테이블은 오라클서버에 저장되므로 같은 이름으로 연습할거면 drop으로 지우고 해야함
//////////////////////////////////////////////////////////////////

    【 Where 조건절 】
        - 형식: where 칼럼명 연산자 조건; 
    ex. 여학생 따로 남학생 따로 성적의 평균을 내고싶을때. 
    = 특정 조건에 만족하는 행들만 대상으로 조작/작동시킬때 사용한다.
                                      → 조회(select)/수정(update)/삭제(delete)
  ● 연산자
    ο 비교연산자 : >  >=  <  <= 
                 != <> 같지않다
                  = 같다
   
   ο 논리연산자 : 그리고 and,  또는 or, 부정연산자 not
     ex. 국어점수 50~59 : kor>=50 and  kor<=59

   ο between A and B : A에서 부터 B사이
     ex. kor between 50 and 59

   ο in 연산자
     ex. uname='홍길동' or uname='무궁화'
         uname in ('홍길동','무궁화')

   ο like 연산자 : 비슷한 유형 %
     ex. '홍'씨성을 검색 : uname like '홍%'
         '홍'으로 끝나는 검색 : uname like '%홍'
         '홍'글자 있는것 검색 : uname like '%홍%'
     ex. 반드시 두글자 중에서 홍으로 시작 : 홍_

   ο NULL 값
     ex. aver = null (틀린 작성법)
         aver is null
         aver is not null
         
//////////////////////////////////////////////////////////////////

--문1) 국어점수가 50점이상 행을 조회하시오
※ SQL문은 접근 순서가 중요. (특히 조회할때) 
ex. 조회시 명령어가 from부터 찾아감  
select uname, kor           -- 3. 이 칼럼이랑 보여주세요. 
from sungjuk                -- 1. 어디 테이블에가서
where kor>=50;              -- 2. 특정 조건을 가진 행만
-- → sungjuk 테이블에서 kor칼럼의 데이터가 50과 같거나 크면 uname,kor칼럼과 함께 보여주세요.

--문2) 영어 점수가 50점미만 행을 조회하시오
select uname, eng
from sungjuk
where eng<50;

--문3) 이름이 '대한민국' 행을 조회(출력)하시오
select uname, kor, eng, mat
from sungjuk
where uname='대한민국';        -- 해당 칼럼(이름)에서 조건에맞는 사람('대한민국')을
-- ↕ 같음
select uname, kor, eng, mat
from sungjuk
where uname in '대한민국';

--문4) 이름이 '대한민국' 아닌 행을 조회하시오
select uname, mat
from sungjuk
where uname!='대한민국';

--문5) 국어, 영어, 수학 세과목의 점수가 모두 90이상 행을 조회하시오
select uname, kor, eng, mat
from sungjuk
where kor>=90 and eng>=90 and mat>=90;

--문6) 국어, 영어, 수학 중에서 한과목이라도 40미만 행을 조회하시오
select uname, kor, eng, mat
from sungjuk
where kor<40 or eng<40 or mat<40;

--문7) 국어점수가 80 ~ 89점 사이 행을 조회하시오
select uname, kor
from sungjuk
where kor between 80 and 89
-- ↕ 같음
select uname, kor   
from sungjuk
where kor>=80 and kor<=89;

--문8) 이름이 '무궁화', '봉선화'를 조회하시오
select uname, kor, eng, mat
from sungjuk
where uname='무궁화' or uname='봉선화';
-- ↕ 같음    
select uname, kor, eng, mat     -- select 대신 update / delete 작성 가능
from sungjuk
where uname in ('무궁화','봉선화');
     
    select*from sungjuk;
    
//////////////////////////////////////////////////////////////////

    【 between A and B 연산자 】: a ~ b  
        - 형식: where 칼럼명 between 조건1 and 조건2;
select uname, eng
from sungjuk
where eng between 80 and 89;

    【 in 연산자 】 : ~안에 (목록에서 찾기)
        - 형식: where 칼럼명 in 조건 | (조건1,'조건2');
select uname, kor, eng, mat   
from sungjuk
where uname in ('라일락','나팔꽃');   
    
select uname, kor
from sungjuk
where kor in 90;       
    
-- 국어점수 10, 30, 50점 조회
select uname, kor
from sungjuk
where kor in (10, 30, 50);   
    
//////////////////////////////////////////////////////////////////

-- 문9)국, 영, 수 모두 100점이 아닌 행을 조회
select uname, kor, eng, mat
from sungjuk
where kor!=100 and eng!=100 and mat!=100;
    
-- 강사님
select uname, kor, eng, mat
from sungjuk
where not (kor=100 and eng=100 and mat=100);

//////////////////////////////////////////////////////////////////
    
    【 like 연산자 】    
        - 문자열 데이터에서 비슷한 유형을 검색할 때 사용하는 연산자
        - 형식: where 칼럼명 like '조건';
        - % : 글자 갯수와 상관 없음
        ex. '홍'으로 시작 : uname like '홍%'
            '홍'으로 종료 : uname like '%홍'
            '홍'이 포함된 : uname like '%홍%' ＊가장 많이 사용함＊
      
        - _ : 글자 갯수까지 일치해야 함
        ex. 반드시 두글자 중에서 '홍'으로 시작 : '홍_'
select uname
from sungjuk
where uname='대한민국'; 
-- → 이름이 대한민국 인 행만 뽑을 수 있음

select uname
from sungjuk
where uname like '%민%';
-- → 이름에 '민'이 들어있는 모든 행을 출력 가능

select uname
from sungjuk
where uname like '홍%' or uname like '%민%';
-- → 이름에 '홍'으로 시작 또는 '민'이 들어간 모든 행 출력    

select uname
from sungjuk
where uname like '홍__'; -- 언더바 두개임
-- → 이름에 '홍'으로 시작하는 세글자 문자열 행 출력 
    
--문1) 이름에서 '홍'으로 시작하는 이름을 조회하시오
select uname
from sungjuk
where uname like '홍%';

--문2) 이름에서 '화'로 끝나는 이름을 조회하시오
select uname
from sungjuk
where uname like '%화';

--문3) 이름에 '나'글자 있는 이름을 조회하시오
select uname
from sungjuk
where uname like '%나%';

--문4) 두글자 이름에서 '화'로 끝나는 이름을 조회하시오
select uname
from sungjuk
where uname like '_화';

--문5) 이름 세글자 중에서 가운데 글자가 '나' 있는 행을 조회하시오
select uname
from sungjuk
where uname like '_나_';
    
--문6) 제목+내용을 선택하고 검색어가 '파스타'일때 (테이블은 없고 where절 연습용)
select subject
from notice
where title like '%파스타%' or contents like '%파스타%';
-- html에서 form만들어서 함수만들어서 연결 - db랑 함께 연결

--문7) 국어 점수가 50점 이상인 행에 대해서만 총점과 평균을 구하시오
select uname, kor, tot, aver        -- 여기서 select와 from만 빼면 맞는 코드
from sungjuk
update sungjuk set tot=kor+eng+mat, aver=(kor+eng+mat)/3
where kor>=50; 
-- false
-- 강사님 코드
select * from sungjuk where kor>=50;        -- 테이블 확인용

update sungjuk 
set tot=kor+eng+mat, aver=(kor+eng+mat)/3
where kor>=50;

select * from sungjuk;                      -- 테이블 확인용
--→ 순차적으로 분할해서 진행 / update-set도 where절과 저렇게 합쳐서 사용 가능 

//////////////////////////////////////////////////////////////////

    【 null 비어있는 값 】
-- 총점의 갯수
select count(tot) from sungjuk;     -- 5 : 총점의 갯수가 5개의 행이란 뜻
                                    --     (null은 count해주지 않으므로 5개)

-- 총점에 null이 있는 행의 갯수를 구하시오
select count(*)
from sungjuk
where tot=null;     
--→ 이렇게하면 null값을 확인 못함 (틀린 코드)

select uname, tot
from sungjuk
where tot is null;
--→ is 연산자를 이용하여 구할 수 있다

-- 평균에 비어있지 않은 행의 갯수를 구하시오 (null이 아닌 값)
select count(*)
from sungjuk
where aver is not null;
--→ null이 아닌 값을 가진 행을 구하는 식 

-- 문8) 비어있는 총점과 평균을 모두 구하시오.
select uname, tot, aver
from sungjuk
where tot is null and aver is null;     -- 테이블 확인용 

update sungjuk 
set tot=kor+eng+mat, aver=(kor+eng+mat)/3
where tot is null or aver is null;

select * from sungjuk;                  -- 테이블 확인용 

