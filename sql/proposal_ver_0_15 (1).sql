--====================================
-- 관리자 계정
--====================================
-- tlab계정 생성
alter session set "_oracle_script" = true; -- c##으로 계정명 지정 회피

show user;

create user tlab
identified by tlab
default tablespace users;

alter user tlab quota unlimited on users;

grant connect, resource to tlab;

--====================================
-- tlab 계정
--====================================

---------------clear table view----------------------------------
--drop table tlab_member cascade constraints;
--drop sequence seq_tlab_member_no;

--drop table member_attachment cascade constraints;
--drop sequence seq_member_attachment_no;
--drop table admin cascade constraints;
--drop sequence seq_admin_no;
--drop table product_category cascade constraints;
--drop sequence seq_category_no;
--drop table region cascade constraints;
--drop sequence seq_region_no;
--drop table product cascade constraints;
--alter table product drop constraint fk_product_region;
--alter table product drop constraint fk_product_p_category;
--drop sequence seq_product_no;
--drop table product_attachment cascade constraints;
--alter table product_attachment drop constraint fk_product_attachment_product_no;
--drop sequence seq_product_attachment_no;
--drop table cart_list cascade constraints;
--drop sequence seq_cart_list_no;
--drop table product_order cascade constraints;
--alter table product_order drop constraint fk_order_product_no;
--drop sequence seq_product_order_no;
--drop table order_list cascade constraints;
--alter table order_list drop constraint fk_order_member_id;
--drop sequence seq_order_list_no;
--drop table wish_list cascade constraints;
--drop sequence seq_wish_list_no;
--drop table scrap cascade constraints;
--drop sequence seq_scrap_no;
--drop table cs_board cascade constraints;
--drop sequence seq_cs_board_no;
--drop table magazine cascade constraints;
--drop sequence seq_magazine_no;
--drop table magazine_attachment cascade constraints;
--drop sequence seq_magazine_attachment_no;
--drop table cs_board_comment cascade constraints;
--drop sequence seq_cs_board_comment_no;
--drop table magazine_comment cascade constraints;
--drop sequence seq_magazine_comment_no;
--drop table recommend cascade constraints;
--drop sequence seq_recommend_no;
--drop table recommend_count cascade constraints;
--drop sequence seq_recommend_count_no;

----------------------------------------------------------------

-- ##member entity table
create table tlab_member (
    no number,
    member_id varchar2(20) not null,
    password varchar2(300) not null,
    member_name varchar2(50) not null,
    email varchar2(200) not null,
    paycode number(20), 
    tel char(11) not null, -- 11자리수
    valid char(1) default 'Y',
    reg_date date default sysdate
);
create sequence seq_tlab_member_no;
alter table tlab_member add (member_role char(1) default 'U');

--alter table tlab_member add constraint pk_tlab_member_no primary key (no);
--alter table tlab_member add constraint uk_tlab_member_member_id unique (member_id);
--alter table tlab_member add constraint chk_tlab_member_valid check(valid in ('Y','N'));

create table member_attachment(
    no number,
    original_filename varchar2(255) not null,
    renamed_filename varchar2(255) not null,
    member_id varchar2(20)
);
create sequence seq_member_attachment_no;
--alter table member_attachment add constraint pk_member_attachment_no primary key (no);
--alter table member_attachment add constraint fk_member_attachment_member_id foreign key(member_id) references tlab_member(member_id) on delete cascade;

--create table admin (
--    no number,
--    admin_id varchar2(20),
--    admin_password varchar(300) not null,
--    admin_name varchar2(50) not null,
--    admin_role char(1) default 'B',
--    reg_date date default sysdate
--);
--create sequence seq_admin_no;
--alter table admin add constraint pk_admin_no primary key(no);
--alter table admin add constraint uk_admin_id unique (admin_id);
--alter table admin add constraint ck_admin_role check (admin_role in ('A','B'));

create table product_category (
    no number,
    name varchar2(50)
);

--alter table product_category add constraint pk_product_category primary key(no);
create table region (
    no number,
    code varchar2(5),
    name varchar2(100)
);
create sequence seq_region_no;
--alter table region add constraint pk_region_no primary key(no);


-- product entity table
-- 해당지역의 상품으로 한정, 교통수단은 패스로 처리
create table product (
    no number,
    region varchar2(5),
    p_category number,
    p_name varchar(30) not null,
    p_content clob,
--  p_day date,
    p_stock number,
    unit_price number,
    valid char(1) default 'Y', 
    reg_date date default sysdate
); 
create sequence seq_product_no;
--desc product;
--alter table product add constraint pk_product_no primary key(no);
--alter table product add constraint fk_product_region foreign key(region) references region(code) on delete set null;
--alter table product add constraint fk_product_p_category foreign key(p_category) references product_category(no) on delete set null;
--alter table product add constraint ck_product_valid check (valid in ('Y','N'));


create table product_attachment (
    no number,
    product_no number not null,
    original_filename varchar2(255) not null,
    renamed_filename varchar2(255) not null
);
create sequence seq_product_attachment_no;
--alter table product_attachment add constraint pk_product_attachment_no primary key(no);
--alter table product_attachment add constraint fk_product_attachment_product_no foreign key (product_no) references product(no) on delete cascade;
--alter table product_attachment add constraint uk_product_attachment_renamed_filename unique(renamed_filename);

-- tranfer unit table
create table cart_list (
    no number,
    product_name varchar2(30) not null, --product_no 말고 product_name으로 넣어봤습니다.
    quantity number default 1 not null,
    product_bill number not null,
    member_id varchar(20) not null
);
create sequence seq_cart_list_no;
--alter table cart_list add constraint pk_cart_list_no primary key(no);
--alter table cart_list add constraint fk_cart_list_member_id foreign key (member_id) references tlab_member(member_id) on delete cascade;
--alter table cart_list add constraint fk_cart_list_product_no foreign key (product_no) references product(no) on delete cascade;
--상품명일때 제약조건 alter table cart_list add constraint fk_cart_list_product_name foreign key (product_name) references product(p_name) on delete cascade;
--alter table cart_list add constraint ck_cart_list_quantity check (quantity>1);

create table product_order (
     no number,
     product_name number not null, -- 여기도 no말고 name으로 하면 좋을 듯 합니다.
     quantity number default 1 not null,
     product_bill number not null,
     order_code number(30) not null
);
create sequence seq_product_order_no;
--alter table product_order add constraint pk_order_no primary key(no);
--alter table product_order add constraint ck_order_quantity check (quantity>1);
--alter table product_order add constraint ck_order_unit_price check (unit_price>=0);

create table order_list(
    no number,
    order_code number(30) not null,
    member_id varchar(20) not null,
    total_bill number default 0,
    payment_date date default sysdate
);

create sequence seq_order_list_no;
--alter table order_list add constraint fk_order_list_member_id foreign key (member_id) references tlab_member(member_id) on delete set null;
--alter table order_list add constraint uk_order_list_order_code unique(order_code);
--alter table order_list add constraint ck_order_list_total_bill check (total_bill>=0);


--create table wish_list (
--    no number,
--    member_id varchar2(20),
--    product_no number
--);
--create sequence seq_wish_list_no;
--alter table wish_list add constraint pk_wish_list_no primary key(no);
--alter table wish_list add constraint fk_wish_list_member_id foreign key (member_id) references tlab_member(member_id) on delete cascade;
--alter table wish_list add constraint fk_wish_list_product_no foreign key (product_no) references product(no) on delete cascade;

create table scrap (
    no number,
    member_id varchar2(20),
    magazine_no number
);
create sequence seq_scrap_no;
--alter table scrap add constraint pk_scrap_no primary key(no);
--alter table scrap add constraint fk_scrap_member_id foreign key (member_id) references tlab_member(member_id) on delete cascade;
--alter table scrap add constraint fk_scrap_magazine_no foreign key (magazine_no) references magazine(no) on delete cascade;


create table cs_board (
    no number,
    options varchar2(20) not null, --1:1 문의, 공지사항, 
    title varchar2(100) not null,
    writer varchar2(20) not null,
    content clob,
    board_ref number,
    read_count number default 0,
    reg_date date default sysdate
);
--commit;
create sequence seq_cs_board_no;
--alter table cs_board add constraint pk_cs_board_no primary key(no);
--alter table cs_board add constraint fk_cs_board_member_id foreign key(writer) references tlab_member(member_id) on delete cascade;
--alter table cs_board add constraint fk_cs_board_board_ref foreign key(board_ref) references cs_board(no) on delete cascade;

create table cs_board_comment(
    no number,
    comment_level number default 1, -- 댓글 1, 대댓글 2
    writer varchar2(15),
    content varchar2(2000),
    cs_board_no number,
    comment_ref number,               -- 대댓글인 경우, 참조하는 댓글번호 no,  댓글인 경우 null
    reg_date date default sysdate
);
create sequence seq_cs_board_comment_no;
--alter table cs_board_comment add constraint pk_cs_board_comment_no primary key(no);
--alter table cs_board_comment add constraint fk_cs_board_comment_writer foreign key(writer) references tlab_member(member_id) on delete set null;
--alter table cs_board_comment add constraint fk_cs_board_comment_board_no foreign key(cs_board_no) references cs_board(no) on delete cascade;
--alter table cs_board_comment add constraint fk_cs_board_comment_comment_ref foreign key(comment_ref) references cs_board_comment(no) on delete cascade;

create table cs_board_attachment (
    no number,
    original_filename varchar2(255) not null,
    renamed_filename varchar2(255) not null,
    cs_board_no number not null
);
create sequence seq_cs_board_attachment_no;
--alter table cs_board_attachment add constraint pk_cs_board_attachment_no primary key(no);
--alter table cs_board_attachment add constraint fk_cs_board_attachment_cs_board_no foreign key(cs_board_no) references cs_board(no) on delete cascade;

create table magazine(
    no number,
    title varchar2(20) not null,
    writer varchar(20) not null,
    content clob not null,
    reg_date date default sysdate,
    read_count number default 0,
    region varchar2(10),
    valid char(1) default 'Y'
);

create sequence seq_magazine_no;
--alter table magazine add constraint pk_magazine_no primary key(no);
--alter table magazine add constraint fk_magazine_writer foreign key(writer) references tlab_member(member_id) on delete cascade;
--alter table magazine add constriant fk_magazine_region foreign key(region) references region(code) on delete set null;
--alter table magazine add constraint ck_magazine_valid check (valid in ('Y','N'));

create table magazine_comment(
    no number,
    comment_level number default 1, -- 댓글 1, 대댓글 2
    writer varchar2(15),
    content varchar2(2000),
    magazine_no number,
    comment_ref number,               -- 대댓글인 경우, 참조하는 댓글번호 no,  댓글인 경우 null
    reg_date date default sysdate
);
create sequence seq_magazine_comment_no;
--alter table magazine_comment add constraint pk_magazine_comment_no primary key(no);
--alter table magazine_comment add constraint fk_magazine_comment_writer foreign key(writer) references tlab_member(member_id) on delete cascade;
--alter table magazine_comment add constraint fk_magazine_comment_magazine_no foreign key(magazine_no) references magazine(no) on delete cascade;
--alter table magazine_comment add constraint fk_magazine_comment_comment_ref foreign key(comment_ref) references magazine_comment(no) on delete cascade;

create table magazine_attachment (
    no number,
    original_filename varchar2(255) not null,
    renamed_filename varchar2(255) not null,
    magazine_no number not null
);
create sequence seq_magazine_attachment_no;
--alter table magazine_attachment add constraint pk_magazine_attachment_no primary key (no);
--alter table magazine_attachment add constraint fk_magazine_attachment_magazine_no foreign key(magazine_no) references magazine(no) on delete cascade;

create table recommend (
    no number,
    magazine_no number,
    member_id varchar(20)
);
create sequence seq_recommend_no;
--alter table recommend add constraint fk_recommend_magazine_no foreign key(magazine_no) references magazine(no) on delete cascade;
--alter table recommend add constraint fk_recommend_member_id foreign key(member_id) references tlab_member(member_id) on delete cascade;
--count (*)=> 3개
--select count(*) from recommend group by magazine_no having magazine_no=1;

create table recommend_count(
    no number,
    magazine_no number,
    total number
);
create sequence seq_recommend_count_no;
--alter table recommend_count add constraint fk_recommend_count_magazine_no foreign key(magazine_no) references magazine(no) on delete cascade;
--commit;
desc tlab_member;

--============================================================
-- Comment Input
--============================================================

comment on column tlab_member.no is '가입자순서';
comment on column tlab_member.member_id is '멤버아이디';
comment on column tlab_member.password is '비밀번호';
comment on column tlab_member.member_name is '멤버이름';
comment on column tlab_member.email is '멤버이메일';
comment on column tlab_member.paycode is '멤버결제코드';
comment on column tlab_member.tel is '전화번호';
comment on column tlab_member.valid is '유효성검사';
comment on column tlab_member.reg_date is '등록일';
comment on column tlab_member.member_role is '역할'; -- '역할' 뭔가 이상하지 않나요 ㅋㅋ직책?

comment on column member_attachment.no is 'member첨부파일순서';
comment on column member_attachment.original_filename is '원본파일명';
comment on column member_attachment.renamed_filename is '저장된파일명';
comment on column member_attachment.member_id is '멤버아이디';

comment on column product.no is '상품번호';
comment on column product.region is '지역번호';
comment on column product.p_category is '카테고리';
comment on column product.p_name is '상품명';
comment on column product.p_content is '상품설명';
comment on column product.p_stock is '재고';
comment on column product.unit_price is '가격';
comment on column product.valid is '구매가능여부';
comment on column product.reg_date is '등록날짜';

comment on column product_order.no is '주문순서'; 
comment on column product_order.product_no is '상품번호';
comment on column product_order.quantity is '선택상품수량';
comment on column product_order.unit_price is '단위가격';
comment on column product_order.product_bill is '상품별지불금액';
comment on column product_order.order_code is '주문번호';

comment on column order_list.no is '리스트순번';
comment on column order_list.order_code is '주문번호';
comment on column order_list.member_id is '주문자id';
comment on column order_list.paycode is '지불코드번호';
comment on column order_list.total_bill is '총 지불 금액';
comment on column order_list.payment_date is '지불일';

comment on column magazine.no is '매거진번호';
comment on column magazine.title is '제목';
comment on column magazine.writer is '글쓴이';
comment on column magazine.content is '본문';
comment on column magazine.reg_date is '작성일';
comment on column magazine.read_count is '조회수';
comment on column magazine.valid is '게시차단여부';

comment on column cs_board.no is '고객센터글번호';
comment on column cs_board.title is '제목';
comment on column cs_board.writer is '글쓴이';
comment on column cs_board.content is '본문';
comment on column cs_board.board_ref is '참조글';
comment on column cs_board.reg_date is '작성일';


--=======================================================
--제약조건추가 
--=======================================================

--alter table tlab_member add constraint pk_tlab_member_no primary key (no);
--alter table tlab_member add constraint uk_tlab_member_member_id unique (member_id);
--alter table tlab_member add constraint chk_tlab_member_valid check(valid in ('Y','N'));

--alter table member_attachment add constraint pk_member_attachment_no primary key (no);
--alter table member_attachment add constraint fk_member_attachment_member_id foreign key(member_id) references tlab_member(member_id) on delete cascade;

--alter table product_category add constraint pk_product_category primary key(no);
--alter table region add constraint pk_region_no primary key(no);

--alter table product add constraint pk_product_no primary key(no);
--alter table product add constraint fk_product_region foreign key(region) references region(code) on delete set null;
--alter table product add constraint fk_product_p_category foreign key(p_category) references product_category(no) on delete set null;
--alter table product add constraint ck_product_valid check (valid in ('Y','N'));

--alter table product_attachment add constraint pk_product_attachment_no primary key(no);
--alter table product_attachment add constraint fk_product_attachment_product_no foreign key (product_no) references product(no) on delete cascade;

--alter table product_order add constraint pk_order_no primary key(no);
--alter table product_order add constraint ck_order_quantity check (quantity>1);
--alter table order_list add constraint fk_order_list_member_id foreign key (member_id) references tlab_member(member_id) on delete set null;
--alter table order_list add constraint uk_order_list_order_code unique(order_code);
--alter table order_list add constraint ck_order_list_total_bill check (total_bill>=0);

--alter table cart_list add constraint pk_cart_list_no primary key(no);
--alter table cart_list add constraint fk_cart_list_member_id foreign key (member_id) references tlab_member(member_id) on delete cascade;
--alter table cart_list add constraint fk_cart_list_product_name foreign key (product_name) references product(p_name) on delete cascade;
--alter table cart_list add constraint ck_cart_list_quantity check (quantity>1);
--alter table wish_list add constraint pk_wish_list_no primary key(no);
--alter table wish_list add constraint fk_wish_list_member_id foreign key (member_id) references tlab_member(member_id) on delete cascade;
--alter table wish_list add constraint fk_wish_list_product_no foreign key (product_no) references product(no) on delete cascade;
--alter table scrap add constraint pk_scrap_no primary key(no);
--alter table scrap add constraint fk_scrap_member_id foreign key (member_id) references tlab_member(member_id) on delete cascade;
--alter table scrap add constraint fk_scrap_magazine_no foreign key (magazine_no) references magazine(no) on delete cascade;
--alter table cs_board add constraint pk_cs_board_no primary key(no);
--alter table cs_board add constraint fk_cs_board_member_id foreign key(writer) references tlab_member(member_id) on delete cascade;
--alter table cs_board add constraint fk_cs_board_board_ref foreign key(board_ref) references cs_board(no) on delete cascade;

--alter table cs_board_attachment add constraint pk_cs_board_attachment_no primary key(no);
--alter table cs_board_attachment add constraint fk_cs_board_attachment_cs_board_no foreign key(cs_board_no) references cs_board(no) on delete cascade;
--alter table cs_board_comment add constraint pk_cs_board_comment_no primary key(no);
--alter table cs_board_comment add constraint fk_cs_board_comment_writer foreign key(writer) references tlab_member(member_id) on delete cascade;
--alter table cs_board_comment add constraint fk_cs_board_comment_board_no foreign key(cs_board_no) references cs_board(no) on delete cascade;
--alter table cs_board_comment add constraint fk_cs_board_comment_comment_ref foreign key(comment_ref) references cs_board_comment(no) on delete cascade;

--alter table magazine add constraint pk_magazine_no primary key(no);
--alter table magazine add constraint fk_board_writer foreign key(writer) references tlab_member(member_id) on delete cascade;
--alter table magazine add constriant fk_magazine_region foreign key(region) references region(code) on delete set null;
--alter table magazine add constraint ck_magazine_valid check (valid in ('Y','N'));

--alter table magazine_comment add constraint pk_magazine_comment_no primary key(no);
--alter table magazine_comment add constraint fk_magazine_comment_writer foreign key(writer) references tlab_member(member_id) on delete cascade;
--alter table magazine_comment add constraint fk_magazine_comment_magazine_no foreign key(magazine_no) references magazine(no) on delete cascade;
--alter table magazine_comment add constraint fk_magazine_comment_comment_ref foreign key(comment_ref) references magazine_comment(no) on delete cascade;

--alter table magazine_attachment add constraint pk_magazine_attachment_no primary key (no);
--alter table magazine_attachment add constraint fk_magazine_attachment_magazine_no foreign key(magazine_no) references magazine(no) on delete cascade;

--alter table recommend add constraint fk_recommend_magazine_no foreign key(magazine_no) references magazine(no) on delete cascade;
--alter table recommend add constraint fk_recommend_member_id foreign key(member_id) references tlab_member(member_id) on delete cascade;

--alter table recommend_count add constraint fk_recommend_count_magazine_no foreign key(magazine_no) references magazine(no) on delete cascade;


--=======================================================
--변경사항 
--=======================================================
--11.22
--alter table tlab_member modify password varchar2(300);
--alter table tlab_member modify paycode number(20);
--alter table order_list modify paycode number(20);
--alter table admin rename column member_name to admin_name;
--alter table tlab_member modify member_id not null;
--commit;

--11.23
--alter table cs_board add board_ref number;
--alter table cs_board add foreign key (board_ref) references cs_board(no);
--commit;
--alter table cs_board modify(title varchar(100)); 
--drop table wish_list; 
--drop sequence seq_wish_list_no;
--commit;

--11.24 comment 추가 -> dataSQL.sql
--기본제약조건 수정시 삭제->추가만 가능.
--foreign key를 추가하려면 먼저 not null 부터 제거
--alter table admin modify admin_id not null;
--alter table tlab_member add contraint uk_tlab_member_member_name unique(member_name);
--alter table cs_board drop constraint fk_cs_board_member_id;
--alter table cs_board modify writer null;

--alter table cs_board add constraint fk_cs_board_member_id foreign key (writer) references tlab_member(member_id)on delete cascade;

--alter table cs_board add constraint fk_cs_board_admin_id foreign key (writer) references admin(admin_id) on delete cascade;

-- 에러 
-- #an alter table validating constraint failed because the table has child records.
-- UPDATE cs_board SET writer = NULL WHERE writer NOT IN (SELECT member_name FROM tlab_member);
-- DELETE FROM cs_board WHERE writer NOT IN (SELECT member_id FROM admin);
-- 비밀글 답글 설정


--11.29
-- tlab_member의 member_name 칼럼이 unique 조건이 걸려있어서 동명이인 가입불가 문제
-- admin 테이블의 admin_role 이 너무 복잡함 하나로 통일
-- foreign key를 걸면 참조 테이블 수정이 불가능해짐
-- SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'PROUDUCT';
-- 제약조건을 나중에 추가하는 형태로 바꿈.

--=======================================================
--샘플 데이터 입력-> data.sql참고
--=======================================================
select * from tlab_member;
select * from product;
select * from tlab_member;

--primary key와 unique+not null의 다른점

--foreign key를 unique하지 않은 일반칼럼으로 설정하면 안되는 이유는? 어떤 데이터를 참조해야 할지 알수가 없다.

--foreign key를 제약조건으로 설정하면 on delete cascade를 잡으면 안되는 테이블에서 문제가 생긴다.


