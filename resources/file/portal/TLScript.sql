-- 전통주

--drop All------------------------------------------------------
drop table tblProductSort;
drop table tblProductImage;
drop table tblmember;
drop table tblTLBoard;

drop table tblProductInfo;
drop table tblProductLiquor;

drop sequence seqProductLiquor;
drop sequence seqTLBoard;

-------------------------------------------------------------
-- 1. 주종 테이블==================================
create table tblProductSort
(
    seq_sort number not null,
    sort varchar2(20) not null,
    constraint tblProductSort_seq_sort_pk primary key(seq_sort)
);

insert into tblProductSort values (1, '탁주');
insert into tblProductSort values (2, '약주');
insert into tblProductSort values (3, '청주');
insert into tblProductSort values (4, '과실주');
insert into tblProductSort values (5, '증류주');

commit;

-- 2. 전통주 메인 테이블===========================================
create table tblProductLiquor
(
    seq_product number not null,    -- 번호
    seq_sort number not null,       -- 주종번호
    name varchar2(100) not null,    -- 제품명
    price number not null,          -- 가격
    abv varchar2(20) not null,      -- 도수 alcohol by volume
    volume number not null,         -- 용량(ml)
    img varchar2(50) not null,      -- 대표 이미지 파일명
    constraint tblProductLiquor_pk primary key(seq_product),
    constraint tblProductLiquor_seq_sort_fk foreign key(seq_sort) references tblProductSort(seq_sort)
);
create sequence seqProductLiquor;

-- 탁주
insert into tblProductLiquor values (seqProductLiquor.nextVal, 1, '별산 막걸리', 27000, '6.0%', 1000, 'beoulsan.png');
insert into tblProductLiquor values (seqProductLiquor.nextVal, 1, '양지 백주', 20000, '15.5%', 500, 'yangji.png');
insert into tblProductLiquor values (seqProductLiquor.nextVal, 1, '호랑이 생막걸리', 18800, '6.0%', 750, 'tiger.png');
insert into tblProductLiquor values (seqProductLiquor.nextVal, 1, '표문 막걸리', 4500, '6.0%', 500, 'gompyo.png');

-- 약/청주
insert into tblProductLiquor values (seqProductLiquor.nextVal, 2, '세종대왕 어주', 27000, '15.0%', 500, 'sejong.png');
insert into tblProductLiquor values (seqProductLiquor.nextVal, 2, '미인약주', 15000, '15.0%', 500, 'miin.png');
insert into tblProductLiquor values (seqProductLiquor.nextVal, 2, '백화수복', 15000, '15.0%', 1800, 'backhwa.png');
insert into tblProductLiquor values (seqProductLiquor.nextVal, 3, '풍정사계', 18000, '18.0%', 500, 'pungjeong.png');

-- 과실주
insert into tblProductLiquor values (seqProductLiquor.nextVal, 4, '사랑할때 12', 25000, '12.0%', 300, 'love.png');
insert into tblProductLiquor values (seqProductLiquor.nextVal, 4, '시나브로', 40000, '11.0%', 500, 'sinabro.png');
insert into tblProductLiquor values (seqProductLiquor.nextVal, 4, '블링블링 노을별', 22500, '13.0%', 550, 'bling.png');
insert into tblProductLiquor values (seqProductLiquor.nextVal, 4, '오미로제 연', 45000, '12.0%', 500, 'omirose.png');

-- 증류주
insert into tblProductLiquor values (seqProductLiquor.nextVal, 5, '처음처럼', 4000, '16.5%', 360, 'first.png');
insert into tblProductLiquor values (seqProductLiquor.nextVal, 5, '참이슬', 4000, '16.5%', 360, 'drop.png');


commit;
select * from tblProductLiquor;

-- 3. 전통주 설명 테이블==================================
create table tblProductInfo
(
    seq_product number not null,                    -- 번호
    introduce varchar2(500) not null,               -- 한줄소개
    detail varchar2(2000) not null,                 -- 설명
    storage varchar2(50) not null,                  -- 보관방법
    life varchar2(100) not null,                    -- 유통기한
    manufacturer varchar2(100) not null,            -- 제조사
    constraint tblProductInfo_seq_product_fk foreign key(seq_product) references tblProductLiquor(seq_product)
);




insert into tblProductInfo values 
    (1
    , '공주산 밤과 쌀로 장기간 숙성시켜 빚은 고급 막걸리'
    , '별산막걸리는 6년 된 감식초에서 분리한 식초균을 이용했으며 한국식품연구원에서 보급한 토착 효모를 사용해 인공감미료를 넣지 않은 새콤달콤한 수제 막걸리입니다. 공주산 밤과 쌀로 장기간 숙성시켜 빚은 고급 막걸리로 목넘김이 부드럽고 약간의 신맛과 단맛의 조화로 20~50대 까지 부담없이 즐길 수 있습니다.'
    , '냉장 보관'
    , '병입일로부터 30일'
    , '사곡양조원'
    );
    
insert into tblProductInfo values 
    (2
    , '강원도에도 빚고있는 부드러운 고도수 수제 막걸리'
    , '강원도 양양군 강현면에서 빚고있는 부드럽고 고소한 풍미를 지닌 탁주, 막걸리로 청정한 양양 지역 햅쌀로 첨가제 없이 물 누룩으로 정성을 다하여 빚어내는 고품격 삼양주 입니다. 삼양주란 3차 담금에 의한 곡주의 제조방법으로 오감으로 빚어내고 항아리에서 발효 숙성시킨 양양술곳간 탁주입니다.'
    , '냉장 보관'
    , '병입일로부터 30일'
    , '양양술곳간'
    ); 
    
insert into tblProductInfo values 
    (3
    , '생 발효를 통해 맛을 낸 막걸리'
    , '생 발효를 통해 맛을 내어 부드러운 바디감을 가지고 있으며, 맛과 향이 풍부하고 목 넘김이 뛰어납니다. 2013 농림부주최 우리술 품평회, 2014 국제주류품평회 몽드셀렉션, 2015 대한민국주류대상, 2016 대한민국 우리술 품평회에 수상 및 인증했습니다.'
    , '냉장 보관'
    , '병입일로부터 15일'
    , '배혜정도가'
    ); 
    
insert into tblProductInfo values 
    (4
    , '무감미료 생 막걸리'
    , '막걸리는 올드하고 뻔하다? 한강주조와 69년 역사의 대한제분 곰표가 만나 뒤집습니다. 올드하고 고루한 것이 아닌 새롭고 멋진 막걸리가 무엇인지 함께 고민하고 연구하여 표문막걸리를 완성했습니다. 밀누룩의 다양하고 풍부한 향미와 쌀 본연의 단맛이 잘 어우러진 6도 막걸리입니다. 탄산감이 적고 기분 좋은 산미와 부드럽고 깔끔한 목넘김이 좋은 막걸리 입니다.'
    , '냉장 보관'
    , '제조일로부터 30일'
    , '한강주조'
    ); 
    
insert into tblProductInfo values 
    (5
    , '파주산 찹쌀100%로 맛과 향이 조화를 이루는 전통주'
    , '파주산 찹쌀 100%로 단맛과 신맛, 그리고 쓴맛과 향이 조화를 이루는 전통주입니다. 목넘김이 부드럽고 입안에 퍼지는 향긋함을 느낄 수 있는것이 특징으로 이양주(밑술/덧술)로 만든 미안탁주를 여과하여 제조합니다. 미인약주는 다른 감미료나 효소 없이 오직 쌀만을 이용해서 만든 술 중 쌀 자체의 단 맛을 가장 농축해서 끌어올린 술로 완성도가 높고 고급스러운 단 맛이 납니다.'
    , '냉장 보관'
    , '제조일로부터 30일'
    , '최행숙전통주가'
    );     
    
    
insert into tblProductInfo values 
    (6
    , '파주산 찹쌀100%로 맛과 향이 조화를 이루는 전통주'
    , '파주산 찹쌀 100%로 단맛과 신맛, 그리고 쓴맛과 향이 조화를 이루는 전통주입니다. 목넘김이 부드럽고 입안에 퍼지는 향긋함을 느낄 수 있는것이 특징으로 이양주(밑술/덧술)로 만든 미안탁주를 여과하여 제조합니다. 미인약주는 다른 감미료나 효소 없이 오직 쌀만을 이용해서 만든 술 중 쌀 자체의 단 맛을 가장 농축해서 끌어올린 술로 완성도가 높고 고급스러운 단 맛이 납니다.'
    , '냉장 보관'
    , '제조일로부터 30일'
    , '최행숙전통주가'
    );     
    
insert into tblProductInfo values 
    (7
    , '단맛이 덜하여 요리용으로도 자주 쓰이는 전통주'
    , '약한 풋사과의 향미를 가지고 있지만 후츠슈답게 바디감은 별로 없다. 약한 단맛과 신맛이 향미를 받쳐주고 약한 쓴맛이 피니시를 이룬다. 후츠슈 치고는 에탄올 냄새 억제가 잘 된 편이고 동급의 다른 후츠슈에 비하면 밸런스와 품질은 우수한 편이다.'
    , '냉장 보관'
    , '제조일로부터 30일'
    , '롯데칠성음료'
    );        
    
insert into tblProductInfo values 
    (8
    , '사과향과 부드러운 맛을 표현한 과실주'
    , '공해 없는 청정지역 사과의 고장 충주에서 재배하여 맛, 색, 당도가 높은 질 좋은 사과를 엄선하여 전통 방법으로 제조. 저온 발효 숙성으로 은은한 사과 향과 부드러운 맛을 표현.'
    , '냉장 보관'
    , '제조일로부터 30일'
    , '중원양조'
    );     
    
insert into tblProductInfo values 
    (9
    , '명성을 쌓아가다 시나브로 와이너리'
    , '세계에서 인정받는 한국의 사르도네! 청수는 오늘날 우리나라 화이트 와인을 대표하는 품종입니다.청수를 최초로 양조한 시나브로 와이너리에서 그 매력을 한껏 느껴보세요.'
    , '냉장 보관'
    , '제조일로부터 30일'
    , '이근용'
    );  

insert into tblProductInfo values 
    (10
    , '청주에 증류소주를 더해 발효해 여름을 나는 술'
    , '세계에서 인정받는 한국의 사르도네! 청수는 오늘날 우리나라 화이트 와인을 대표하는 품종입니다.청수를 최초로 양조한 시나브로 와이너리에서 그 매력을 한껏 느껴보세요.'
    , '실온 보관'
    , '제조일로부터 314일'
    , '화양양조장'
    );  
    
    
insert into tblProductInfo values 
    (11
    , '병 안에서 별이 휘날리는 사과맛 우주 술'
    , '세계에서 인정받는 한국의 사르도네! 청수는 오늘날 우리나라 화이트 와인을 대표하는 품종입니다.청수를 최초로 양조한 시나브로 와이너리에서 그 매력을 한껏 느껴보세요.'
    , '냉장 보관'
    , '제조일로부터 14일'
    , '영덕'
    );  

insert into tblProductInfo values 
    (12
    , '병 안에서 별이 휘날리는 사과맛 우주 술'
    , '세계에서 인정받는 한국의 사르도네! 청수는 오늘날 우리나라 화이트 와인을 대표하는 품종입니다.청수를 최초로 양조한 시나브로 와이너리에서 그 매력을 한껏 느껴보세요.'
    , '냉장 보관'
    , '제조일로부터 14일'
    , '문경'
    );   
    
insert into tblProductInfo values 
    (13
    , '대한민국 소주시장에 새 바람을 일으키 소주'
    , '세계에서 인정받는 한국의 사르도네! 청수는 오늘날 우리나라 화이트 와인을 대표하는 품종입니다.청수를 최초로 양조한 시나브로 와이너리에서 그 매력을 한껏 느껴보세요.'
    , '실온 및 냉장 보관'
    , '제조일로부터 2년'
    , '롯데칠성음료'
    );     
    
insert into tblProductInfo values 
    (14
    , '대나무 숯으로 4번 걸러 더 깨끗한 목넘김을 느낄수 있는 참이슬'
    , '세계에서 인정받는 한국의 사르도네! 청수는 오늘날 우리나라 화이트 와인을 대표하는 품종입니다.청수를 최초로 양조한 시나브로 와이너리에서 그 매력을 한껏 느껴보세요.'
    , '실온 및 냉장 보관'
    , '제조일로부터 2년'
    , '하이트진로'
    );    
    
    
    
    
--delete tblProductInfo  where seq_product = 23;
commit;
select * from tblProductInfo order by seq_product desc;

--delete tblTLBoard;
--4. 레시피 게시판 테이블=============================================
create table tblTLBoard (
    seq_tlboard number primary key,                     --글번호(PK)
    seq number not null references tblMember(seq),      --작성자번호(FK)
    title varchar2(100) not null,                       --제목
    content varchar2(4000) not null,                    --내용
    regdate date default sysdate not null,              --작성시간
    readcount number default 0 not null,                --조회수
    orgfilename varchar2(100) null,                     --첨부파일
    filename varchar2(100) null                         --첨부파일
);
create sequence seqTLBoard;


insert into tblTLBoard values 
(seqTLBoard.nextVal
, 1
, '비오는 날에는 막걸리에 파전'
, '뜨겁게 달군 팬에 밀가루 반죽을 펴고 연한 쪽파를 나란히 얹어 지진 음식이다.
밀가루 반죽에 파를 넣어서 부치기도 하며, 초간장에 찍어 먹는다.

🍴만들기
1. 반죽에 준비된 고기와 실파, 조갯살을 넣고 가볍게 섞는다.

2. 뜨겁게 달군 팬에 기름을 넉넉히 두르고 반죽을 한 국자씩 떠서 앞뒤로 노릇하게 지져낸다.

3. 따끈한 파전을 양념장에 찍어 먹는다.'
, sysdate
, default
, 'pajeon.jpg'
, 'pajeon.jpg'
);

insert into tblTLBoard values 
(seqTLBoard.nextVal
, 1
, '곤드레 나물밥에 막걸리 한잔'
, '쌀 위에 곤드레를 얹어 밥을 지은 뒤 양념장에 비벼 먹는 나물밥이다. 
산이나 들에서 나는 나물인 곤드레는 말린 것을 불려서 사용하며, 
부드러운 맛과 독특한 향이 특징이다.

🍴만들기
1. 뜨겁게 달군 냄비에 들기름을 두르고 양념한 곤드레나물을 넣어 중간 불에서 10분 정도 
   볶다가 불린 쌀을 넣고 같이 볶는다.
   
2. 물 3컵을 붓고 끓어오르면 중간 불에서 밥물이 자작해질 때까지 끓인다.

3. 밥물이 잦아들면 약한 불로 줄여서 10분 정도 뜸을 들인다.

4. 밥을 고루 섞어 그릇에 담고 양념장을 곁들여 낸다.
'
, sysdate
, default
, 'rice.jpg'
, 'rice.jpg'
);

insert into tblTLBoard values 
(seqTLBoard.nextVal
, 1
, '소풍에는 김밥'
, '소금과 참기름으로 간한 흰밥을 김 위에 펴고 다양한 채소와 고기 등을 함께 올린 뒤 
둘둘 말아서 썰어 먹는 음식이다. 
소풍이나 여행 또는 도시락 음식으로 간편하게 만들 수 있다. 

🍴만들기
1. 김의 매끄러운 부분이 김발에 마주하도록 놓는다. 조미한 밥 1컵을 김 중앙에 올린 다음 
   김윗부분의 ¼을 남기고 나머지 부분에 넓게 편다. 밥을 너무 두껍게 놓지 않도록 한다.
   
2. 밥 가운데에 소고기, 단무지, 오이, 당근, 계란을 나란히 놓는다. 
   김발을 안쪽부터 말면서 꼭꼭 누른다.
   
3. 칼에 참기름을 바르고 1cm 두께로 동글게 썬다.'
, sysdate
, default
, 'gimbab.jpg'
, 'gimbab.jpg'
);

insert into tblTLBoard values 
(seqTLBoard.nextVal
, 1
, '꿀꿀할때 소주한잔에 홍합탕'
, '홍합과 무, 고추를 넣고 물을 부어 끓인 맑은 조갯국이다. 술국으로 많이 먹는다. 

🍴만들기
1. 냄비에 홍합을 넣고 물을 부은 다음 생강즙, 청주, 소금을 넣고 센 불에서 끓인다.

2. 홍합이 벌어지면 풋고추와 홍고추를 넣고 불을 끈다.'
, sysdate
, default
, 'honghap.jpg'
, 'honghap.jpg'
);

insert into tblTLBoard values 
(seqTLBoard.nextVal
, 1
, '술안주로 부대찌개 어때요?'
, '한국식 재료인 김치, 두부, 돼지고기와 서양식 재료인 햄, 소시지를 함께 넣고 
얼큰하게 끓인 별미 찌개 요리다.

🍴만들기
1. 전골냄비에 준비된 돼지고기와 소시지, 채소를 고루 담고 베이크트 빈을 올린 다음 
   양념장을 얹는다.
   
2. 소금으로 간한 국물을 붓고 센 불에서 끓이기 시작하여 팔팔 끓어오르면 스파게티면을 
   넣고 먹는다.'
, sysdate
, default
, 'budea.jpg'
, 'budea.jpg'
);

insert into tblTLBoard values 
(seqTLBoard.nextVal
, 1
, '술 마신 다음날'
, '계란을 곱게 풀어서 새우젓이나 소금으로 간하여 쪄낸 부드러운 음식이다.

🍴만들기
1. 작은 그릇 4개에 잔새우를 4등분하여 담는다.

2. 계란물을 각각의 그릇에 고루 붓고 송송 썬 파를 올린다.

3. 김이 오른 찜통에 ②를 넣고 뚜껑을 덮어 중약 불에서 15분 동안 찐다. 
   꼬치로 찔러보아 계란물이 올라오지 않으면 다 익은 것이다.'
, sysdate
, default
, 'egg.jpg'
, 'egg.jpg'
);

insert into tblTLBoard values 
(seqTLBoard.nextVal
, 1
, '사조막걸리와 족발'
, '삶은 돼지족에 간장, 생강 등을 넣고 조려낸 음식으로 젤라틴이 매우 풍부하다.

🍴만들기
1. 큰 냄비에 돼지족을 넣고 물을 잠기도록 부은 다음 조림장을 넣고 불을 약하게 줄여 
   1시간 반 동안 조린다.

2. 한김 식힌 돼지족은 뼈를 발라내고 한 입 크기로 썬다.

3. 새우젓 양념을 곁들여 낸다.'
, sysdate
, default
, 'pigfoot.jpg'
, 'pigfoot.jpg'
);

insert into tblTLBoard values 
(seqTLBoard.nextVal
, 1
, '고등어 구이에 과실주'
, '고등어에 굵은소금을 뿌린 뒤 팬이나 석쇠에 구운 생선구이다. 
한국에서 가장 많이 먹는 생선 중 하나로 생물을 쓰기도 하나 염장한 고등어도 자주 사용한다.

🍴만들기
1. 소금에 절인 고등어의 물기를 키친타월로 걷는다.

2. 그릴을 예열하여 팬에 붓으로 식용유를 바른 다음 고등어 껍질이 위로 향하게 놓고 
   앞뒤로 노르스름하게 굽는다. 
   또는 팬에 식용유를 두르고 앞뒤로 노릇하게 굽는다.'
, sysdate
, default
, 'fish.jpg'
, 'fish.jpg'
);

insert into tblTLBoard values 
(seqTLBoard.nextVal
, 1
, '다 어울리는 감자전'
, '감자를 곱게 갈아 건더기와 가라앉은 녹말을 함께 넣고 기름에 지진 음식이다.

🍴만들기
1. 감자 간 것에 애호박을 섞고 물과 소금, 감자 전분을 넣어 반죽한다.

2. 뜨겁게 달군 팬에 식용유를 두르고 반죽을 한 국자씩 떠서 얇고 동그랗게 편다.

3. 전이 익어 투명해지면 뒤집어서 노릇하게 지진다.

4. 접시에 담고 양념장을 곁들여 낸다.'
, sysdate
, default
, 'potato.jpg'
, 'potato.jpg'
);


commit;






----------------------------------------------------------------------------------------------------------------
-- sql 모음

-- main list 쿼리
select
    pl.seq_product,
    pl.name,
    ps.sort,
    ps.seq_sort,
    price,
    abv,
    volume,
    img,
    introduce,
    manufacturer
from tblproductliquor pl
    inner join tblProductSort ps
        on ps.seq_sort = pl.seq_sort
            inner join tblProductInfo pi
                on pi.seq_product = pl.seq_product
                    order by pl.seq_product desc;
                    
 
-- 레시피 게시판 list(all)
select * from tblTLBoard order by regdate desc;



-- 레시피 게시판 view
select
    b.*,
    m.name
from tblTLBoard b
    inner join tblmember m
        on b.seq = m.seq
            where b.seq_tlboard = 1;

        
        
    
-- 레시피 게시판 add
insert into tblTLBoard values 
    (seqTLBoard.nextVal
    , 1
    , '비오는 날에는 역시?'
    , '뜨겁게 달군 팬에 밀가루 반죽을 펴고 연한 쪽파를 나란히 얹어 지진 음식이다. 
    밀가루 반죽에 파를 넣어서 부치기도 하며, 초간장에 찍어 먹는다.
    1. 반죽에 준비된 고기와 실파, 조갯살을 넣고 가볍게 섞는다.
    2. 뜨겁게 달군 팬에 기름을 넉넉히 두르고 반죽을 한 국자씩 떠서 앞뒤로 노릇하게 지져낸다.
    3. 따끈한 파전을 양념장에 찍어 먹는다.'
    , sysdate
    , default
    , null
    , null
    );
    

-- 레시피 게시판 edit
update tblTLBoard set 
    title = '수정합니다.', 
    content = '내용 수정 성공'
where seq_tlboard = 1;


