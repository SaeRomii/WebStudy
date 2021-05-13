SELECT USER
FROM DUAL;
--==>> SCOTT

--○ 기존 테이블 삭제
DROP TABLE TBL_SCORE;
--==>> Table TBL_SCORE이(가) 삭제되었습니다.

--○ 실습 테이블 생성
CREATE TABLE TBL_SCORE
( SID   NUMBER
, NAME  VARCHAR2(30)
, KOR   NUMBER(3)
, ENG   NUMBER(3)
, MAT   NUMBER(3)
);
--==>>Table TBL_SCORE이(가) 생성되었습니다.

--○ 생성된 테이블에 제약조건 추가
ALTER TABLE TBL_SCORE
ADD CONSTRAINT SCORE_SID_PK PRIMARY KEY(SID);
--==>> Table TBL_SCORE이(가) 변경되었습니다.

ALTER TABLE TBL_SCORE
ADD CONSTRAINT SCORE_KOR_CK CHECK(KOR BETWEEN 0 AND 100);
--==>> Table TBL_SCORE이(가) 변경되었습니다.

ALTER TABLE TBL_SCORE
ADD CONSTRAINT SCORE_ENG_CK CHECK(ENG BETWEEN 0 AND 100);
--==>> Table TBL_SCORE이(가) 변경되었습니다.

ALTER TABLE TBL_SCORE
ADD CONSTRAINT SCORE_MAT_CK CHECK(MAT BETWEEN 0 AND 100);
--==>> Table TBL_SCORE이(가) 변경되었습니다.

--○ 기존 시퀀스 제거
DROP SEQUENCE SCORESEQ;
--==>> Sequence SCORESEQ이(가) 삭제되었습니다.

--○ 실습 관련 시퀀스 새로 생성
CREATE SEQUENCE SCORESEQ
NOCACHE;
--==>> Sequence SCORESEQ이(가) 생성되었습니다.

--○ 데이터 입력 쿼리문 구성
INSERT INTO TBL_SCORE(SID, NAME, KOR, ENG, MAT)
VALUES(SCORESEQ.NEXTVAL, '이새롬', 90, 80, 70);
--> 한 줄 구성
INSERT INTO TBL_SCORE(SID, NAME, KOR, ENG, MAT) VALUES(SCORESEQ.NEXTVAL, '이새롬', 90, 80, 70)
;

--○ 테이블 전체 조회 쿼리문 구성
SELECT *
FROM TBL_SCORE
ORDER BY SID;
--> 한 줄 구성
SELECT SID, NAME, KOR, ENG, MAT FROM TBL_SCORE ORDER BY SID
;

SELECT SID, NAME, KOR, ENG, MAT, (KOR+ENG+MAT) AS TOT, ROUND(((KOR+ENG+MAT)/3.0),1) AS AVG FROM TBL_SCORE
;

--○ 인원 수 확인 쿼리문 구성
SELECT COUNT(*) AS COUNT
FROM TBL_SCORE;
--> 한 줄 구성
SELECT COUNT(*) AS COUNT FROM TBL_SCORE
;
--==>> 1

--○ 커밋
COMMIT;
--==>> 커밋완

--○ 데이터 추가 입력
INSERT INTO TBL_SCORE(SID, NAME, KOR, ENG, MAT)
VALUES(SCORESEQ.NEXTVAL, '배수지', 70, 50, 60);

