-- 계정 생성
-- CREATE USER SEMIWEB IDENTIFIED BY SEMIWEB;
-- GRANT RESOURCE, CONNECT TO SEMIWEB;


------------------------------------------------
--------------- TB_MEM 관련 테이블 ---------------
------------------------------------------------

CREATE TABLE TB_MEM (
    NO NUMBER PRIMARY KEY,
    MEM_ID VARCHAR2(30) NOT NULL UNIQUE,
    PASSWORD VARCHAR2(100) NOT NULL,
    ROLE VARCHAR2(10) DEFAULT 'ROLE_USER',
    MEM_NM VARCHAR2(15) NOT NULL,
    PHONE VARCHAR2(13),
    EMAIL VARCHAR2(100),
    ADDR VARCHAR2(100),
    STATUS VARCHAR2(1) DEFAULT 'Y' CHECK(STATUS IN('Y', 'N')),
    ENROLL_DATE DATE DEFAULT SYSDATE
);

COMMENT ON COLUMN TB_MEM.NO IS '회원번호';
COMMENT ON COLUMN TB_MEM.MEM_ID IS '회원아이디';
COMMENT ON COLUMN TB_MEM.PASSWORD IS '회원비밀번호';
COMMENT ON COLUMN TB_MEM.ROLE IS '회원타입';
COMMENT ON COLUMN TB_MEM.MEM_NM IS '회원명';
COMMENT ON COLUMN TB_MEM.PHONE IS '전화번호';
COMMENT ON COLUMN TB_MEM.EMAIL IS '이메일';
COMMENT ON COLUMN TB_MEM.ADDR IS '주소';
COMMENT ON COLUMN TB_MEM.STATUS IS '상태값(Y/N)';
COMMENT ON COLUMN TB_MEM.ENROLL_DATE IS '회원가입일';

CREATE SEQUENCE SEQ_UNO;

INSERT INTO TB_MEM (NO, MEM_ID, PASSWORD, ROLE, MEM_NM, PHONE, EMAIL, ADDR,STATUS, ENROLL_DATE) 
        VALUES(SEQ_UNO.NEXTVAL, 'admin', '1234', 'ROLE_ADMIN', '관리자', '010-4179-4341', 'admin@iei.or.kr', '서울시 강남구 역삼동', DEFAULT, DEFAULT);






/* -----------------------------------------------------
    지역 테이블
----------------------------------------------------- */
CREATE TABLE TB_LOCAL (
    NO NUMBER(20) PRIMARY KEY,
    LOCAL_NAME VARCHAR2(20) NOT NULL
);

COMMENT ON COLUMN TB_LOCAL.NO IS '지역고유번호';
COMMENT ON COLUMN TB_LOCAL.LOCAL_NAME IS '지역명';

CREATE SEQUENCE SEQ_TB_LOCAL_NO;

INSERT INTO TB_LOCAL VALUES(SEQ_TB_LOCAL_NO.NEXTVAL, '추자도');
INSERT INTO TB_LOCAL VALUES(SEQ_TB_LOCAL_NO.NEXTVAL, '차귀도');
INSERT INTO TB_LOCAL VALUES(SEQ_TB_LOCAL_NO.NEXTVAL, '비양도');
INSERT INTO TB_LOCAL VALUES(SEQ_TB_LOCAL_NO.NEXTVAL, '한경면');
INSERT INTO TB_LOCAL VALUES(SEQ_TB_LOCAL_NO.NEXTVAL, '한림읍');
INSERT INTO TB_LOCAL VALUES(SEQ_TB_LOCAL_NO.NEXTVAL, '애월읍');
INSERT INTO TB_LOCAL VALUES(SEQ_TB_LOCAL_NO.NEXTVAL, '제주시');
INSERT INTO TB_LOCAL VALUES(SEQ_TB_LOCAL_NO.NEXTVAL, '조천읍');
INSERT INTO TB_LOCAL VALUES(SEQ_TB_LOCAL_NO.NEXTVAL, '구좌읍');
INSERT INTO TB_LOCAL VALUES(SEQ_TB_LOCAL_NO.NEXTVAL, '우도');
INSERT INTO TB_LOCAL VALUES(SEQ_TB_LOCAL_NO.NEXTVAL, '성산읍');
INSERT INTO TB_LOCAL VALUES(SEQ_TB_LOCAL_NO.NEXTVAL, '표선면');
INSERT INTO TB_LOCAL VALUES(SEQ_TB_LOCAL_NO.NEXTVAL, '남원읍');
INSERT INTO TB_LOCAL VALUES(SEQ_TB_LOCAL_NO.NEXTVAL, '서귀포시');
INSERT INTO TB_LOCAL VALUES(SEQ_TB_LOCAL_NO.NEXTVAL, '중문');
INSERT INTO TB_LOCAL VALUES(SEQ_TB_LOCAL_NO.NEXTVAL, '안덕면');
INSERT INTO TB_LOCAL VALUES(SEQ_TB_LOCAL_NO.NEXTVAL, '대정읍');
INSERT INTO TB_LOCAL VALUES(SEQ_TB_LOCAL_NO.NEXTVAL, '가파도');
INSERT INTO TB_LOCAL VALUES(SEQ_TB_LOCAL_NO.NEXTVAL, '마라도');




/* -----------------------------------------------------
    여행지 테이블
----------------------------------------------------- */
CREATE TABLE TB_SPOT (	
    SP_NO NUMBER(10) PRIMARY KEY,
    SP_TITLE VARCHAR2(50),
    SP_TYPE VARCHAR2(20),
    SP_IMG_PATH VARCHAR2(50),
    SP_ADDR VARCHAR2(100),
    SP_PHONE VARCHAR2(50),
    SP_PRICE VARCHAR2(100),
    SP_OFFDAY VARCHAR2(100),
    SP_CONTENT VARCHAR2(2000),
    SP_LAT VARCHAR2(100),
    SP_LONG VARCHAR2(100),
    LOCAL NUMBER(20),
    FOREIGN KEY (LOCAL) REFERENCES TB_LOCAL (NO)
);

COMMENT ON COLUMN TB_SPOT.NO IS '게시글 번호';
COMMENT ON COLUMN TB_SPOT.SP_TITLE IS '게시글 제목';
COMMENT ON COLUMN TB_SPOT.SP_TYPE IS '여행지 형태';
COMMENT ON COLUMN TB_SPOT.SP_IMG_PATH IS '이미지 경로';
COMMENT ON COLUMN TB_SPOT.SP_ADDR IS '주소';
COMMENT ON COLUMN TB_SPOT.SP_PHONE IS '전화번호';
COMMENT ON COLUMN TB_SPOT.SP_PRICE IS '가격';
COMMENT ON COLUMN TB_SPOT.SP_OFFDAY IS '휴무일';
COMMENT ON COLUMN TB_SPOT.SP_CONTENT IS '게시글 내용';
COMMENT ON COLUMN TB_SPOT.SP_LAT IS '위도(X)';
COMMENT ON COLUMN TB_SPOT.SP_LONG IS '경도(Y)';
COMMENT ON COLUMN TB_SPOT.LOCAL IS '지역고유번호';

CREATE SEQUENCE SEQ_TB_SPOT_NO;

-- 관광명소
INSERT INTO TB_SPOT VALUES(SEQ_TB_SPOT_NO.NEXTVAL, '우도 일주', '관광명소', '/resources/images/spot/spot', '제주도 제주시 우도면', NULL, NULL, NULL, '제주도에서도 가장 제주도의 모습을 많이 지니고 있어 찾아볼 수 있는 곳은 8개의 유인도 중에서 바로 우도다. 우도는 제주도의 또 다른 속살이라고 불릴 만큼 제주도를 가장 많이 닮았다.', NULL, NULL, 10);
INSERT INTO TB_SPOT VALUES(SEQ_TB_SPOT_NO.NEXTVAL, '올레길 1코스', '관광명소', '/resources/images/spot/spot', '제주도 서귀포시 성산읍', NULL, NULL, NULL, '1코스는 오름과 해변을 즐기며 성산일출봉을 배경으로 한 광치기해변의 풍경을 가슴 가득하게 담을 수 있는 화려한 올레길이다.', NULL, NULL, 11);
INSERT INTO TB_SPOT VALUES(SEQ_TB_SPOT_NO.NEXTVAL, '한림에서 일몰 감상', '관광명소', '/resources/images/spot/spot', '제주도 제주시 한림읍', NULL, NULL, NULL, '한림항 방파제 너머로 보이는 장엄한 해넘이의 모습을 감상하세요.', NULL, NULL, 5);
INSERT INTO TB_SPOT VALUES(SEQ_TB_SPOT_NO.NEXTVAL, '함덕 서우봉', '관광명소', '/resources/images/spot/spot', '제주도 제주시 조천읍 조함해안로 525', NULL, NULL, NULL, '제주시 조천읍 함덕리에 자리한 함덕해수욕장은 해수욕장 바로 옆에 우뚝선 오름(서우봉) 덕분에 ‘함덕서우봉해변’이라고도 불린다. 제주공항에서 불과 20km 떨어졌지만, 이곳에 도착하는 순간 다른 나라에 온 것 같은 기분이 든다.', NULL, NULL, 8);
INSERT INTO TB_SPOT VALUES(SEQ_TB_SPOT_NO.NEXTVAL, '마라도', '관광명소', '/resources/images/spot/spot', '제주도 서귀포시 대정읍 가파리 600', NULL, NULL, NULL, '마라도는 대한민국 최남단에 위치한 섬이며, 모슬포항에서 11km 정도 떨어져 있다. 면적은 0.3km2, 해안선의 길이는 4.2km이고, 최고점은 39m이다. 인구수는 59가구 127명이다.', NULL, NULL, 19);
INSERT INTO TB_SPOT VALUES(SEQ_TB_SPOT_NO.NEXTVAL, '김영갑갤러리두모악', '관광명소', '/resources/images/spot/spot', '제주도 서귀포시 성산읍 삼달로 137', '064-784-9907', '성인 4,500원', NULL, '김영갑갤러리두모악 미술관은 우리 모두가 주인입니다. 김영갑 선생님께서 돌아가신 이후에도 많은 분들의 지속적인 관심과 후원으로 김영갑갤러리두모악을 지켜낼 수 있었습니다.', NULL, NULL, 11);
INSERT INTO TB_SPOT VALUES(SEQ_TB_SPOT_NO.NEXTVAL, '카멜리아힐 동백꽃 축제', '관광명소', '/resources/images/spot/spot', '제주도 서귀포시 안덕면 병악로 166', '064-792-0088', '성인 9,000원', NULL, '카멜리아힐은 30년 열정과 사랑으로 제주의 자연을 담은 동양에서 가장 큰 독백 수목원입니다.', NULL, NULL, 14);
INSERT INTO TB_SPOT VALUES(SEQ_TB_SPOT_NO.NEXTVAL, '오설록 티 뮤지엄', '관광명소', '/resources/images/spot/spot', '제주도 서귀포시 안덕면 신화역사로 15 오설록', '064-794-5312', NULL, NULL, '제주 오설록 서광 차밭과 맞닿아 있는 오설록 티뮤지엄은 아모레퍼시픽이 차와 한국 전통차 문화를 소개하고, 널리 보급하고자 2001년 9월에 개관한 국내 최초의 차 박물관입니다. 동양과 서양, 전통과 현대가 조화를 이룬 문화공간으로 차 유물관, 자연친화적인 휴식공간, 2013년 티클래스를 더해 21세기형 차 박물관으로 발돋움했습니다.', NULL, NULL, 14);
INSERT INTO TB_SPOT VALUES(SEQ_TB_SPOT_NO.NEXTVAL, '비자림 숲길 산책', '관광명소', '/resources/images/spot/spot', '제주도 제주시 구좌읍 비자숲길 55', '064-710-7912', '성인 3,000원', NULL, '천연기념물로 지정보호하고 있는 비자림은 448,165㎡의 면적에 500∼800년생 비자나무 2,800여 그루가 밀집하여 자생되고 있다.', NULL, NULL, 9);
INSERT INTO TB_SPOT VALUES(SEQ_TB_SPOT_NO.NEXTVAL, '성산일출봉에서 일출 감상', '관광명소', '/resources/images/spot/spot', '제주도 서귀포시 성산읍 성산리 1', '064-783-0959', '성인 5,000원', '매월 첫째 월요일', '그 탄생의 비밀] 푸른 바다 사이에 우뚝 솟은 성채와 같은 모양, 봉우리 정상에 있는 거대한 사발 모양의 분화구, 그리고 그 위에서 맞이하는 일출의 장관 때문에 성산일출봉은 많은 사람들의 감흥과 탄성을 자아낸다.', NULL, NULL, 11);
-- 체험
INSERT INTO TB_SPOT VALUES(SEQ_TB_SPOT_NO.NEXTVAL, '제주 민속촌 체험', '체험', '/resources/images/spot/spot', '제주도 서귀포시 표선면 민속해안로 631-34', '064-787-4501', '성인 11,000원', NULL, '제주민속촌은 제주의 문화유산을 원형 그대로 보존하기 위해 19세기를 기준 연대로 산촌, 중간산촌, 어촌, 토속신앙을 비롯하여 제주영문과 유배소 등을 전문가의 고증을 통해 구성한 박물관입니다.', NULL, NULL, 12);
INSERT INTO TB_SPOT VALUES(SEQ_TB_SPOT_NO.NEXTVAL, '김녕 요트 투어', '체험', '/resources/images/spot/spot', '제주도 제주시 구좌읍 구좌해안로 229-16', '064-787-4501', '성인 60,000원', NULL, '한라산 동쪽 수려한 자연경관속 화려한 요트에서 즐기는 제주의 風光은 또다른 인생의 기쁨을 제공합니다.제주도 요트의 마을 제주 김녕!', NULL, NULL, 9);
INSERT INTO TB_SPOT VALUES(SEQ_TB_SPOT_NO.NEXTVAL, '제주레일바이크', '체험', '/resources/images/spot/spot', '제주도 제주시 구좌읍 용눈이오름로 641', '064-783-0033', '성인 15,000원', NULL, '스릴과 힐링 ! 제주의 대자연을 달리고 체험 할 수 있는 제주레일바이크!', NULL, NULL, 9);
INSERT INTO TB_SPOT VALUES(SEQ_TB_SPOT_NO.NEXTVAL, '낭만농장 귤밭76번지', '체험', '/resources/images/spot/spot', '제주도 서귀포시 안덕면 병악로 76', '0507-1422-5303', '성인 2,000원', NULL, '낭만농장 귤밭76번지에서 제주 감귤 따기 체험이 가능합니다.', NULL, NULL, 14);
INSERT INTO TB_SPOT VALUES(SEQ_TB_SPOT_NO.NEXTVAL, '얼라이브 카트', '체험', '/resources/images/spot/spot', '제주도 서귀포시 중문관광로 42', '064-805-0987', '성인 25,000원', NULL, '짜릿한 속도감을 느낄 수 있는 카트레이싱 체험! 최고의 시설과 안전함, 무엇과도 비교할 수 없는 제주의 아름다운 자연속에서 쌓인 스트레스를 한방에 날려버리세요.', NULL, NULL, 15);
-- 쇼핑
INSERT INTO TB_SPOT VALUES(SEQ_TB_SPOT_NO.NEXTVAL, '아더하프', '쇼핑', '/resources/images/spot/spot', '제주도 제주시 신설로4길 4 1층', '0507-1330-4958', NULL, '매주 월요일', '제주 유일 애견용품 편집샵입니다. 인터넷으로만 구입해야 했던 다양한 브랜드의 애견 용품이 구비되어있습니다.', NULL, NULL, 7);
INSERT INTO TB_SPOT VALUES(SEQ_TB_SPOT_NO.NEXTVAL, '텐저린 컬쳐스테이션 편집샵', '쇼핑', '/resources/images/spot/spot', '제주도 제주시 관덕로 26', '064-751-9505', NULL, NULL, '국내외 다양한 브랜드와 제주의 브랜드들이 함께 어울리게 되었습니다.', NULL, NULL, 7);
INSERT INTO TB_SPOT VALUES(SEQ_TB_SPOT_NO.NEXTVAL, '제주 감성 편집샵 제주가 푸르다', '쇼핑', '/resources/images/spot/spot', '제주도 서귀포시 칠십리로 38-1', '064-763-5885', NULL, NULL, '제주 감성 편집샵 제주가 푸르다에서 제주에서만 느낄 수 있는 특별한 오브제를 만나보실 수 있습니다.', NULL, NULL, 14);
INSERT INTO TB_SPOT VALUES(SEQ_TB_SPOT_NO.NEXTVAL, '서쪽가게', '쇼핑', '/resources/images/spot/spot', '제주 제주시 한림읍 한림로 372-7', '064-796-8178', NULL, NULL, '환경은 더 이상 선택이 아닌 필수가 되야 한다고 생각한 저희는 더 이상 지구가 아프지 않았으면 좋겠다는 바람으로 샵의 철학을 정리하는 시간을 가졌어요', NULL, NULL, 5);
INSERT INTO TB_SPOT VALUES(SEQ_TB_SPOT_NO.NEXTVAL, '아코제주', '쇼핑', '/resources/images/spot/spot', '제주 제주시 구좌읍 구좌로 75-1', '070-8869-2177', NULL, NULL, '아코제주에서 제주를 연상케 하는 소품들을 준비했습니다. 다양한 소품을 통해 제주를 느껴보세요.', NULL, NULL, 9);





/* -----------------------------------------------------
숙박 게시판 테이블 생성
----------------------------------------------------- */
CREATE TABLE TB_STAY (	
    ST_NO NUMBER(10) PRIMARY KEY,
    ST_TYPE VARCHAR2(20), 
    ST_NAME VARCHAR2(100),
    ST_IMG_PATH VARCHAR2(50),
    ST_ADDR VARCHAR2(100),
    ST_PHONE VARCHAR2(50),
    ST_PRICE VARCHAR2(100),
    ST_CONTENT VARCHAR2(2000),
    SP_LAT VARCHAR2(100),
    SP_LONG VARCHAR2(100),
    LOCAL NUMBER(20),
    FOREIGN KEY (LOCAL) REFERENCES TB_LOCAL (NO)
);

CREATE SEQUENCE SEQ_TB_STAY_NO;

-- 호텔
INSERT INTO TB_STAY VALUES(SEQ_TB_STAY_NO.NEXTVAL, '호텔', '랜딩관 제주신화월드', '/resources/images/stay/stay', '제주도 서귀포시 안덕면 신화역사로 304번길 38', 92000, '064-111-9505', '제주 서귀포시 안덕면에 위치한 랜딩관 제주신화월드 호텔, 리조트는 5성급 부대시설과 서비스를 제공합니다.', NULL, NULL, 14);
INSERT INTO TB_STAY VALUES(SEQ_TB_STAY_NO.NEXTVAL, '호텔', '롯데 호텔 제주', '/resources/images/stay/stay', '제주도 서귀포시 중문관광로72번길 35', 105000, '064-751-9544', '천제연 폭포, 여미지식물원 등이 걸어서 10분, 중문색달해수욕장, 갯깍주상절리대 등이 걸어서 약 20분 내외의 거리에 있습니다.', NULL, NULL, 15);
INSERT INTO TB_STAY VALUES(SEQ_TB_STAY_NO.NEXTVAL, '호텔', '제주 신라 호텔', '/resources/images/stay/stay', '제주도 서귀포시 중문관광로72번길 75', 88000, '064-151-1105', '해변가가 내려다보이는 쉬리의 언덕이 유명한 제주 신라 호텔은 중문관광단지 내 자리하고 있어 여미지식물원, 천제연폭포, 별 내린 전망대 등이 아주 가까운 거리에 있습니다.', NULL, NULL, 15);
INSERT INTO TB_STAY VALUES(SEQ_TB_STAY_NO.NEXTVAL, '호텔', '호텔 리젠트 마린 더 블루', '/resources/images/stay/stay', '제주도 제주시 서부두2길 20', 99000, '064-551-9203', '제주 탑동에 위치한 호텔 리젠트 마린 더 블루는 제주 국제 공항에서 차로 약 15분 거리에 있습니다. 호텔 바로 앞에는 탁 트인 탑동 광장이 자리해 있으며, 옆에는 제주 최대의 횟집 단지인 서부두 명품 횟집 거리가 있습니다.', NULL, NULL, 7);
INSERT INTO TB_STAY VALUES(SEQ_TB_STAY_NO.NEXTVAL, '호텔', '메리어트관 제주신화월드', '/resources/images/stay/stay', '제주도 서귀포시 안덕면 신화역사로 304번길 38', 92000, '064-333-9505', '제주 최고의 프리미엄 서비스와 차별화된 혜택을 선보이는 글로벌 체인 메리어트 호텔입니다. 오설록, 협재해수욕장, 중문 관광 단지 등 제주의 인기 명소가 인접해 있습니다.', NULL, NULL, 14);
INSERT INTO TB_STAY VALUES(SEQ_TB_STAY_NO.NEXTVAL, '호텔', '그랜드 조선 제주', '/resources/images/stay/stay', '제주도 서귀포시 중문관광로72번길 60', 69000, '064-654-9505', '제주 대표 관광지가 모여 있는 중문관광단지에 위치하고 있어, 중문 색달해변, 천제연폭포, 여미지식물원, 테디베어 뮤지엄 등을 도보로 이동하실 수 있습니다.', NULL, NULL, 15);
INSERT INTO TB_STAY VALUES(SEQ_TB_STAY_NO.NEXTVAL, '호텔', '신라스테이 제주', '/resources/images/stay/stay', '제주도 제주시 노연로 100', 97000, '064-751-3456', '호텔신라의 프리미엄 비즈니스호텔인 신라스테이 제주는 제주 국제공항에서 차로 약 15분 거리에 있습니다.', NULL, NULL, 7);
INSERT INTO TB_STAY VALUES(SEQ_TB_STAY_NO.NEXTVAL, '호텔', '메종 글래드 제주', '/resources/images/stay/stay', '제주도 제주시 노연로 80', 99000, '064-751-9231', '40여 년의 역사와 전통을 자랑하는 메종 글래드 제주는 제주 관광의 랜드마크로서 제주 고유의 매력을 경험할 수 있는 호텔입니다.', NULL, NULL, 7);
INSERT INTO TB_STAY VALUES(SEQ_TB_STAY_NO.NEXTVAL, '호텔', '라마다 프라자 제주 호텔', '/resources/images/stay/stay', '제주도 제주시 탑동로 66', 92000, '064-121-8877', '제주시에 위치한 라마다 프라자 제주 호텔은 제주 공항에서 차로 단 10분 거리에 있습니다.', NULL, NULL, 7);
INSERT INTO TB_STAY VALUES(SEQ_TB_STAY_NO.NEXTVAL, '호텔', '유탑 유블레스호텔', '/resources/images/stay/stay', '제주도 제주시 조천읍 조함해안로 502', 54000, '064-251-6505', '유탑 유블레스호텔은 에메랄드빛 바다와 흰 모래밭이 어우러지는 함덕 서우봉 해변에서 도보로 약 3분 거리에 위치합니다.', NULL, NULL, 8);
-- 에어비엔비
INSERT INTO TB_STAY VALUES(SEQ_TB_STAY_NO.NEXTVAL, '에어비엔비', '제주 애월 감성 공유 민박', '/resources/images/stay/stay', '제주도 제주시 애월읍', 110000, '064-781-1290', '제주 촌집의 따뜻한 감성은 남기고 이용에 편리하도록 리모델링한 숙소입니다.', NULL, NULL, 6);
-- 펜션
INSERT INTO TB_STAY VALUES(SEQ_TB_STAY_NO.NEXTVAL, '펜션', '더갤러리펜션', '/resources/images/stay/stay', '제주 제주시 조천읍 남조로 1717-24', 90000, '064-651-3344', '품격있는 휴식공간을 만들기 위해 최상의 자재로 럭셔리하고 클래식한 분위기와 아름다운 정원을 만들었습니다.', NULL, NULL, 8);
-- 캠핑
INSERT INTO TB_STAY VALUES(SEQ_TB_STAY_NO.NEXTVAL, '캠핑', '디포레카라반파크', '/resources/images/stay/stay', '제주 제주시 구좌읍 송당6길 78-1', 90000, '064-051-0505', '디-포레 카라반 파크에서 새들의 지저귐과 안식향이 가득함 숲속에서 평생 처음 추억으로 간직해 드릴것을 약속 드립니다.', NULL, NULL, 9);






/* -----------------------------------------------------
    맛집 테이블
----------------------------------------------------- */
CREATE TABLE TB_REST (	
    RS_NO NUMBER(10) PRIMARY KEY,
    RS_TYPE VARCHAR2(20), 
    RS_NAME VARCHAR2(100),
    RS_MENU VARCHAR2(50),
    RS_IMG_PATH VARCHAR2(50),
    RS_ADDR VARCHAR2(100),
    RS_PHONE VARCHAR2(50),
    RS_PRICE VARCHAR2(100),
    RS_OFFDAY VARCHAR2(30),
    RS_CONTENT VARCHAR2(2000),
    RS_LAT VARCHAR2(100),
    RS_LONG VARCHAR2(100),
    LOCAL NUMBER(20),
    FOREIGN KEY (LOCAL) REFERENCES TB_LOCAL (NO)
);

CREATE SEQUENCE SEQ_TB_REST_NO;
 
-- 음식점
INSERT INTO TB_REST VALUES(SEQ_TB_REST_NO.NEXTVAL, '음식점', '제주 더시즈닝 협재흑돼지', '시즈닝 흑돼지 한판', '/resources/images/rest/rest', '제주 제주시 한림읍 한림로 328 1층', '0507-1426-8791', '54,000원', '없음', '협재 더시즈닝 제주 흑돼지 스테이크 하우스 지오반니 메인 셰프가 선보이는 최고의 파스타와 흑돼지를 경험할수 있습니다.', NULL, NULL, 5);
INSERT INTO TB_REST VALUES(SEQ_TB_REST_NO.NEXTVAL, '음식점', '제주어향원', '전복돌솥밥', '/resources/images/rest/rest', '제주 서귀포시 남원읍 남원리 91-8', '0507-1480-0036', '15,000원', '매주 수요일', '국내에서 나오는 전복으로만 요리하는 전복요리전문점입니다.', NULL, NULL, 14);
INSERT INTO TB_REST VALUES(SEQ_TB_REST_NO.NEXTVAL, '음식점', '소섬전복', '전복밥', '/resources/images/rest/rest', '제주 제주시 우도면 우도해안길 1158', '064-782-0062', '15,000원', '없음', '국내에서 나오는 전복으로만 요리하는 전복요리전문점입니다.', NULL, NULL, 10);
INSERT INTO TB_REST VALUES(SEQ_TB_REST_NO.NEXTVAL, '음식점', '제주도초밥', '시즈닝 흑돼지 한판', '/resources/images/rest/rest', '제주 제주시 한림읍 한림로 328 1층', '0507-1426-8791', '54,000원', '없음', '협재 더시즈닝 제주 흑돼지 스테이크 하우스 지오반니 메인 셰프가 선보이는 최고의 파스타와 흑돼지를 경험할수 있습니다.', NULL, NULL, 5);
INSERT INTO TB_REST VALUES(SEQ_TB_REST_NO.NEXTVAL, '음식점', '만족한상회', '갈치 한상 2인', '/resources/images/rest/rest', '제주 서귀포시 중문상로 58-5', '0507-1318-1388', '60,000', '없음', '10년 이상 조리 경력으로 맛은 물론 가격까지 잡은 만족한상회 깔끔한 분위기 속에서 고객에게 만족한 한상을 제공하고자 다짐한 처음의 마음으로 최선을 다하겠습니다.', NULL, NULL, 15);
INSERT INTO TB_REST VALUES(SEQ_TB_REST_NO.NEXTVAL, '음식점', '모루쿠다', '해산물 라멘', '/resources/images/rest/rest', '제주 서귀포시 태평로431번길 32 1층 모루쿠다', '064-733-1477', '14,000', '없음', '모루쿠다 제주도에서 나오는 산해진미를 한곳에서 드실 수 있고 관광객과 도민들이 가격 부담 없이 즐길 수 있도록 가격을 맞췄습니다.', NULL, NULL, 14);
INSERT INTO TB_REST VALUES(SEQ_TB_REST_NO.NEXTVAL, '음식점', '올래국수', '고기국수', '/resources/images/rest/rest', '제주 제주시 귀아랑길 24 올래국수', '064-742-7355', '8,500', '매주 일요일', '올래국수는 제주 특산물로 요리합니다.', NULL, NULL, 7);
INSERT INTO TB_REST VALUES(SEQ_TB_REST_NO.NEXTVAL, '음식점', '이춘옥원조고등어쌈밥', '고등어 묵은지찜', '/resources/images/rest/rest', '제주 제주시 애월읍 일주서로 7213', '0507-1402-9914', '32,000', '없음', '완벽한 시간으로기억되도록 맛있는 음식과 미소로 보답하겠습니다.', NULL, NULL, 6);
INSERT INTO TB_REST VALUES(SEQ_TB_REST_NO.NEXTVAL, '음식점', '춘심이네 본점', '통갈치구이 2인', '/resources/images/rest/rest', '제주 서귀포시 안덕면 창천중앙로24번길 16', '064-794-4010', '78,000', '없음', '통갈치구이, 통갈치찜 전문점입니다.', NULL, NULL, 14);
INSERT INTO TB_REST VALUES(SEQ_TB_REST_NO.NEXTVAL, '음식점', '우진해장국', '고사리 육개장', '/resources/images/rest/rest', '제주 제주시 서사로 11', '064-757-3393', '9,000', '없음', '제주산 고사리를 갈아 넣고 푹 끓여 갈색 빛깔이 나는 제주식 해장국을 만날 수 있는 한식당입니다.', NULL, NULL, 7);
-- 카페
INSERT INTO TB_REST VALUES(SEQ_TB_REST_NO.NEXTVAL, '카페', '카페 노티드 제주', '우유생크림 도넛', '/resources/images/rest/rest', '제주 제주시 애월읍 애월로1길 24-9 1,2층', '0507-1319-2204', '3,500', '없음', '고객님들께 더 좋은 서비스를 제공하기 위하여 항상 노력하겠습니다.', NULL, NULL, 6);
-- 술집
INSERT INTO TB_REST VALUES(SEQ_TB_REST_NO.NEXTVAL, '술집', '미드나잇 제주', '감바스파스타', '/resources/images/rest/rest', '제주 서귀포시 안덕면 신화역사로304번길 98 F002호', '0507-1319-2204', '27,000', '둘째주, 넷째주 수요일', '고객님들께 더 좋은 서비스를 제공하기 위하여 항상 노력하겠습니다.', NULL, NULL, 14);


/* -----------------------------------------------------
    여행후기 테이블
----------------------------------------------------- */
CREATE TABLE TB_REVIEW (	
    RV_NO NUMBER(10) PRIMARY KEY,
    RV_TYPE VARCHAR2(20),
    RV_TITLE VARCHAR2(100), 
    RV_IMG_PATH VARCHAR2(50),
    RV_DATE VARCHAR2(100),
    RV_CONTENT VARCHAR2(1000),
    RV_COMMNET VARCHAR2(500),
    RV_HITS VARCHAR2(20),
    MEM_NO NUMBER(30),
    FOREIGN KEY (MEM_NO) REFERENCES TB_MEM (NO)
);

CREATE SEQUENCE SEQ_TB_REVIEW_NO;

INSERT INTO TB_REVIEW VALUES(SEQ_TB_REVIEW_NO.NEXTVAL, '여행지', '신창 풍차해안도로 다녀왔어요!', '/resources/images/review/review', SYSDATE, '제주도 드라이브코스 하면 단연 먼저 생각나는 건 제주 신창 풍차 해안도로에요.', NULL, NULL, NULL);
INSERT INTO TB_REVIEW VALUES(SEQ_TB_REVIEW_NO.NEXTVAL, '숙박', '히든클리프 1박 후기', '/resources/images/review/review', SYSDATE, '룸컨디션도 깔끔하고 직원도 친절해서 좋았는데 무엇보다 가장 큰 장점은 수영장이었던 거 같아요.', NULL, NULL, NULL);
INSERT INTO TB_REVIEW VALUES(SEQ_TB_REVIEW_NO.NEXTVAL, '맛집', '명진전복에서 전복돌솥밥 먹었어요!', '/resources/images/review/review', SYSDATE, '수요미식회에 소개되었던 전복돌솥밥이 맛있는 명진전복에 다녀왔습니다.', NULL, NULL, NULL);




COMMIT;
