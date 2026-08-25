-- 이미 생성된 DB에서 한 번만 실행하세요.
-- 리뷰 작성 중 신규 영화 등록에 사용하는 시퀀스입니다.
CREATE SEQUENCE my_황희원_movie_seq
START WITH 1
INCREMENT BY 1;

-- 같은 제목의 중복 등록을 DB에서도 막고 싶다면, 중복 movieNm 데이터가 없는지 확인한 후 실행하세요.
-- ALTER TABLE my_황희원_movie ADD CONSTRAINT uq_my_황희원_movie_nm UNIQUE (movieNm);
