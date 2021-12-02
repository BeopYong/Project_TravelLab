--=========================================
-- Data Input GuidLine
--=========================================
-- paycode 6자리 난수생성기 만들어 사용
-- 관리자 추가는 DB에서만 사용

-- 카테고리번호 
-- 101:항공 102:버스 103:기차
-- 201:호텔 202:펜션 
-- 301:맛집 302:축제/전시 303:관광지

-- 지역번호 (전화번호 참고)
-- 서울 :02 부산: 051 제주 : 064 강원도 : 033

--=========================================
-- Member Data Input
--=========================================
select * from tlab_member;

desc region;

insert into tlab_member(no,member_id,password,member_name,email,tel,member_role)
values (seq_tlab_member_no.nextval,'admin','mruWO0rrhCSbWFwSsZKIJW63IJb39jV+loNO2LF4FjUCKJkgZ1HQYJfLRaLCvlweQSO2QdSZ9sZkO80X9Oc2Nw==',
'최고관리자계정','admin@gmail.com','01011111111','A');
commit;
insert into admin(no,admin_id,admin_password,admin_name,admin_role)
values (seq_admin_no.nextval,'admin','admin13579!','최고관리자계정','U');
-- pwd: mruWO0rrhCSbWFwSsZKIJW63IJb39jV+loNO2LF4FjUCKJkgZ1HQYJfLRaLCvlweQSO2QdSZ9sZkO80X9Oc2Nw==
insert into admin(no,admin_id,admin_password,admin_name,admin_role)
values (seq_admin_no.nextval,'manager','manager13579!','매니저계정','B');
-- pwd: LnHhUDzp4i1ceaCclbkLI7yzE1Lvnnjdu3JRLilMad0/7yadH5Ye3qv/3KiLhTCc0mbt/VjP1f6nwu5UGKuXhA==

-- 모든 비밀번호 초기 설정 1234

insert into tlab_member(no,member_id,password,member_name,email,paycode,tel)
values (seq_tlab_member_no.nextval,'songpa','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','traveler1','songpa@tlab.com',434709,'01013570001');

insert into tlab_member(no,member_id,password,member_name,email,paycode,tel)
values (seq_tlab_member_no.nextval,'gangnam','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','traveler2','gangnam@tlab.com',752676,'01013570002');

insert into tlab_member(no,member_id,password,member_name,email,paycode,tel)
values (seq_tlab_member_no.nextval,'seocho','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','traveler3','seocho@tlab.com',284727,'01013570003');

insert into tlab_member(no,member_id,password,member_name,email,paycode,tel)
values (seq_tlab_member_no.nextval,'mapo','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','traveler4','mapo@tlab.com',263580,'01013570004');

insert into tlab_member(no,member_id,password,member_name,email,paycode,tel)
values (seq_tlab_member_no.nextval,'seongbuk','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','traveler5','seongbuk@tlab.com',687958,'01013570005');

insert into tlab_member(no,member_id,password,member_name,email,paycode,tel)
values (seq_tlab_member_no.nextval,'yongsan','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','traveler6','yongsan@tlab.com',678888,'01013570006');

insert into tlab_member(no,member_id,password,member_name,email,paycode,tel)
values (seq_tlab_member_no.nextval,'jongro','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','traveler7','jongro@tlab.com',480717,'01013570007');

insert into tlab_member(no,member_id,password,member_name,email,paycode,tel)
values (seq_tlab_member_no.nextval,'yeongdeungpo','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','traveler8','yeongdeungpo@tlab.com',431837,'01013570008');

insert into tlab_member(no,member_id,password,member_name,email,paycode,tel)
values (seq_tlab_member_no.nextval,'gwangjin','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','traveler9','gwangjin@tlab.com',428513,'01013570009');

insert into tlab_member(no,member_id,password,member_name,email,paycode,tel)
values (seq_tlab_member_no.nextval,'dongdaemun','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','traveler10','dongdaemun@tlab.com',339125,'01013570010');

insert into tlab_member(no,member_id,password,member_name,email,paycode,tel)
values (seq_tlab_member_no.nextval,'junggu','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','traveler11','junggu@tlab.com',133641,'01013570011');

insert into tlab_member(no,member_id,password,member_name,email,paycode,tel)
values (seq_tlab_member_no.nextval,'seodaemun','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','traveler12','seodaemun@tlab.com',781039,'01013570012');

insert into tlab_member(no,member_id,password,member_name,email,paycode,tel)
values (seq_tlab_member_no.nextval,'dongjak','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','traveler13','dongjak@tlab.com',702670,'01013570013');

insert into tlab_member(no,member_id,password,member_name,email,paycode,tel)
values (seq_tlab_member_no.nextval,'gwanak','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','traveler14','gwanak@tlab.com',254539,'01013570014');

insert into tlab_member(no,member_id,password,member_name,email,paycode,tel)
values (seq_tlab_member_no.nextval,'guro','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','traveler15','guro@tlab.com',507340,'01013570015');

insert into tlab_member(no,member_id,password,member_name,email,paycode,tel)
values (seq_tlab_member_no.nextval,'jungnang','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','traveler16','jungnang@tlab.com',190831,'01013570016');

insert into tlab_member(no,member_id,password,member_name,email,paycode,tel)
values (seq_tlab_member_no.nextval,'dobong','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','traveler17','dobong@tlab.com',413454,'01013570017');

insert into tlab_member(no,member_id,password,member_name,email,paycode,tel)
values (seq_tlab_member_no.nextval,'gangbuk','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','traveler18','gangbuk@tlab.com',848121,'01013570018');

insert into tlab_member(no,member_id,password,member_name,email,paycode,tel)
values (seq_tlab_member_no.nextval,'nowon','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','traveler19','nowon@tlab.com',907269,'01013570019');

insert into tlab_member(no,member_id,password,member_name,email,paycode,tel)
values (seq_tlab_member_no.nextval,'yangcheon','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','traveler20','yangcheon@tlab.com',277320,'01013570020');

insert into tlab_member(no,member_id,password,member_name,email,paycode,tel)
values (seq_tlab_member_no.nextval,'seongdong','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','traveler21','seongdong@tlab.com',144744,'01013570021');

insert into tlab_member(no,member_id,password,member_name,email,paycode,tel)
values (seq_tlab_member_no.nextval,'hanriver','hanriver','traveler22','hanriver@tlab.com',349751,'01013570022');

insert into tlab_member(no,member_id,password,member_name,email,paycode,tel)
values (seq_tlab_member_no.nextval,'geumcheon','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','traveler23','geumcheon@tlab.com',865387,'01013570023');

insert into tlab_member(no,member_id,password,member_name,email,paycode,tel)
values (seq_tlab_member_no.nextval,'gangdong','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','traveler24','gangdong@tlab.com',336659,'01013570024');

insert into tlab_member(no,member_id,password,member_name,email,paycode,tel)
values (seq_tlab_member_no.nextval,'gangseo','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','traveler25','gangseo@tlab.com',879848,'01013570025');

insert into tlab_member(no,member_id,password,member_name,email,paycode,tel)
values (seq_tlab_member_no.nextval,'eunpyeong','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','traveler26','eunpyeong@tlab.com',644573,'01013570026');

--select * from tlab_member;

insert into tlab_member(no,member_id,password,member_name,email,paycode,tel)
values (seq_tlab_member_no.nextval,'bukgu','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','traveler27','bukgu@tlab.com',363749,'01013570027');

insert into tlab_member(no,member_id,password,member_name,email,paycode,tel)
values (seq_tlab_member_no.nextval,'busanjingu','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','traveler28','busanjingu@tlab.com',420094,'01013570028');

insert into tlab_member(no,member_id,password,member_name,email,paycode,tel)
values (seq_tlab_member_no.nextval,'donggu','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','traveler29','donggu@tlab.com',932855,'01013570029');

insert into tlab_member(no,member_id,password,member_name,email,paycode,tel)
values (seq_tlab_member_no.nextval,'dongnaegu','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','traveler30','dongnaegu@tlab.com',917399,'01013570030');

insert into tlab_member(no,member_id,password,member_name,email,paycode,tel)
values (seq_tlab_member_no.nextval,'gangseogu','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','traveler31','gangseogu@tlab.com',438554,'01013570031');

insert into tlab_member(no,member_id,password,member_name,email,paycode,tel)
values (seq_tlab_member_no.nextval,'geumjeongu','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','traveler32','geumjeongu@tlab.com',597018,'01013570032');

insert into tlab_member(no,member_id,password,member_name,email,paycode,tel)
values (seq_tlab_member_no.nextval,'haeundaegu','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','traveler33','haeundaegu@tlab.com',653005,'01013570033');

insert into tlab_member(no,member_id,password,member_name,email,paycode,tel)
values (seq_tlab_member_no.nextval,'junggu2','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','traveler34','junggu2@tlab.com',287721,'01013570034');

insert into tlab_member(no,member_id,password,member_name,email,paycode,tel)
values (seq_tlab_member_no.nextval,'namgu','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','traveler35','namgu@tlab.com',742075,'01013570035');

insert into tlab_member(no,member_id,password,member_name,email,paycode,tel)
values (seq_tlab_member_no.nextval,'sahagu','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','traveler36','eunpyeong@tlab.com',700718,'01013570036');

insert into tlab_member(no,member_id,password,member_name,email,paycode,tel)
values (seq_tlab_member_no.nextval,'sasanggu','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','traveler37','sasanggu@tlab.com',116899,'01013570037');

insert into tlab_member(no,member_id,password,member_name,email,paycode,tel)
values (seq_tlab_member_no.nextval,'seogu','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','traveler38','seogu@tlab.com',966219,'01013570038');

insert into tlab_member(no,member_id,password,member_name,email,paycode,tel)
values (seq_tlab_member_no.nextval,'suyeonggu','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','traveler39','suyeonggu@tlab.com',369095,'01013570039');

insert into tlab_member(no,member_id,password,member_name,email,paycode,tel)
values (seq_tlab_member_no.nextval,'yeongdogu','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','traveler40','eunpyeong@tlab.com',271686,'01013570040');

insert into tlab_member(no,member_id,password,member_name,email,paycode,tel)
values (seq_tlab_member_no.nextval,'yeonjegu','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','traveler41','yeonjegu@tlab.com',144750,'01013570041');

insert into tlab_member(no,member_id,password,member_name,email,paycode,tel)
values (seq_tlab_member_no.nextval,'gijanggun','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','traveler42','gijanggun@tlab.com',563351,'01013570042');

--select * from tlab_member;

insert into tlab_member(no,member_id,password,member_name,email,paycode,tel)
values (seq_tlab_member_no.nextval,'wonju','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','traveler43','wonju@tlab.com',369681,'01013570043');

insert into tlab_member(no,member_id,password,member_name,email,paycode,tel)
values (seq_tlab_member_no.nextval,'chuncheon','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','traveler44','chuncheon@tlab.com',109937,'01013570044');

insert into tlab_member(no,member_id,password,member_name,email,paycode,tel)
values (seq_tlab_member_no.nextval,'gangneung','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','traveler45','gangneung@tlab.com',372553,'01013570045');

insert into tlab_member(no,member_id,password,member_name,email,paycode,tel)
values (seq_tlab_member_no.nextval,'donghae','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','traveler46','donghae@tlab.com',421196,'01013570046');

insert into tlab_member(no,member_id,password,member_name,email,paycode,tel)
values (seq_tlab_member_no.nextval,'sokcho','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','traveler47','sokcho@tlab.com',111311,'01013570047');

insert into tlab_member(no,member_id,password,member_name,email,paycode,tel)
values (seq_tlab_member_no.nextval,'samcheok','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','traveler48','samcheok@tlab.com',892870,'01013570048');

insert into tlab_member(no,member_id,password,member_name,email,paycode,tel)
values (seq_tlab_member_no.nextval,'taebaek','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','traveler49','taebaek@tlab.com',562166,'01013570049');

insert into tlab_member(no,member_id,password,member_name,email,paycode,tel)
values (seq_tlab_member_no.nextval,'hongcheon','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','traveler50','hongcheon@tlab.com',745375,'01013570050');

insert into tlab_member(no,member_id,password,member_name,email,paycode,tel)
values (seq_tlab_member_no.nextval,'cheorwon','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','traveler51','cheorwon@tlab.com',838654,'01013570051');

insert into tlab_member(no,member_id,password,member_name,email,paycode,tel)
values (seq_tlab_member_no.nextval,'hoengseong','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','traveler52','hoengseong@tlab.com',354909,'01013570052');

insert into tlab_member(no,member_id,password,member_name,email,paycode,tel)
values (seq_tlab_member_no.nextval,'pyeongchang','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','traveler53','pyeongchang@tlab.com',415501,'01013570053');

insert into tlab_member(no,member_id,password,member_name,email,paycode,tel)
values (seq_tlab_member_no.nextval,'jeongseon','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','traveler54','jeongseon@tlab.com',608479,'01013570054');

insert into tlab_member(no,member_id,password,member_name,email,paycode,tel)
values (seq_tlab_member_no.nextval,'yeongwol','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','traveler55','wonju@tlab.com',647317,'01013570055');

insert into tlab_member(no,member_id,password,member_name,email,paycode,tel)
values (seq_tlab_member_no.nextval,'inje','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','traveler56','inje@tlab.com',921518,'01013570056');

insert into tlab_member(no,member_id,password,member_name,email,paycode,tel)
values (seq_tlab_member_no.nextval,'goseong','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','traveler57','goseong@tlab.com',562809,'01013570057');

insert into tlab_member(no,member_id,password,member_name,email,paycode,tel)
values (seq_tlab_member_no.nextval,'yangyang','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','traveler58','yangyang@tlab.com',543560,'01013570058');

insert into tlab_member(no,member_id,password,member_name,email,paycode,tel)
values (seq_tlab_member_no.nextval,'hwacheon','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','traveler59','hwacheon@tlab.com',968079,'01013570059');

insert into tlab_member(no,member_id,password,member_name,email,paycode,tel)
values (seq_tlab_member_no.nextval,'yanggu','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','traveler60','yanggu@tlab.com',272274,'01013570060');

insert into tlab_member(no,member_id,password,member_name,email,paycode,tel)
values (seq_tlab_member_no.nextval,'jeju','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','traveler61','jeju@tlab.com',942023,'01013570061');

insert into tlab_member(no,member_id,password,member_name,email,paycode,tel)
values (seq_tlab_member_no.nextval,'seogwipo','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','traveler62','seogwipo@tlab.com',747728,'01013570062');


rollback;
commit;
--=========================================
-- Product Data Input
--=========================================
-- 101:항공 102:버스 103:기차
-- 201:호텔 202:펜션 
-- 301:맛집 302:관광지 303:축제
insert into product_category(no,name) values(101,'항공');
insert into product_category(no,name) values(102,'버스');
insert into product_category(no,name) values(103,'기차');
insert into product_category(no,name) values(201,'숙박');
insert into product_category(no,name) values(301,'맛집');
insert into product_category(no,name) values(302,'관광지');
insert into product_category(no,name) values(303,'축제');

-- 지역번호 (전화번호 참고)
-- 서울 :02 부산: 051 제주 : 064 강원도 : 033
insert into region (no,name) values(02,'서울');
insert into region (no,name) values(051,'부산');
insert into region (no,name) values(064,'제주');
insert into region (no,name) values(033,'강원도');

--=========================================
-- 항공권 데이터 샘플
--=========================================
insert into product(no,p_category,p_name,p_stock,unit_price)
values (seq_product_no.nextval,101,'항공패스권',100,50000);
insert into product(no,region,p_category,p_name,p_stock,unit_price)
values (seq_product_no.nextval,101,'항공패스권',100,150000);
--=========================================
-- 버스 데이터 샘플
--=========================================

insert into product(no,p_category,p_name,p_stock,unit_price)
values (seq_product_no.nextval,102,'버스패스권',100,30000);
insert into product(no,region,p_category,p_name,p_stock,unit_price)
values (seq_product_no.nextval,102,'버스패스권',100,50000);
--=========================================
-- 기차 데이터 샘플
--=========================================
insert into product(no,p_category,p_name,p_stock,unit_price)
values (seq_product_no.nextval,103,'기차패스권',100,50000);
insert into product(no,region,p_category,p_name,p_stock,unit_price)
values (seq_product_no.nextval,103,'기차패스권',100,120000);
--=========================================
-- 숙박 패스권 샘플
--=========================================
insert into product (no,p_category,p_name,p_stock,unit_price)
values (seq_product_no.nextval,201,'숙박패스권',100,50000);
insert into product (no,p_category,p_name,p_stock,unit_price)
values (seq_product_no.nextval,201,'숙박패스권',100,100000);
insert into product (no,p_category,p_name,p_stock,unit_price)
values (seq_product_no.nextval,201,'숙박패스권',100,300000);
insert into product (no,p_category,p_name,p_stock,unit_price)
values (seq_product_no.nextval,201,'숙박패스권',100,500000);
--=========================================
-- 맛집 데이터 샘플
--=========================================

-- 맛집은 날짜조건없이 일정에 넣을 수 있다고 가정함. 선예약금 있음.
-- 부산 051
insert into product (no,region,p_category,p_name,p_stock,unit_price)
values (seq_product_no.nextval,'051',301,'만호갈미 샤브샤브',20,20000);
insert into product (no,region,p_category,p_name,p_stock,unit_price)
values (seq_product_no.nextval,'051',301,'부흥식당',20,20000);
insert into product (no,region,p_category,p_name,p_stock,unit_price)
values (seq_product_no.nextval,'051',301,'가야할매밀면',20,20000);
insert into product (no,region,p_category,p_name,p_stock,unit_price)
values (seq_product_no.nextval,'051',301,'국제밀면',20,20000);
insert into product (no,region,p_category,p_name,p_stock,unit_price)
values (seq_product_no.nextval,'051',301,'할매가야밀면',20,20000);
insert into product (no,region,p_category,p_name,p_stock,unit_price)
values (seq_product_no.nextval,'051',301,'김해식당',20,20000);
insert into product (no,region,p_category,p_name,p_stock,unit_price)
values (seq_product_no.nextval,'051',301,'물꽁식당',20,20000);
insert into product (no,region,p_category,p_name,p_stock,unit_price)
values (seq_product_no.nextval,'051',301,'부산명물횟집',20,20000);
insert into product (no,region,p_category,p_name,p_stock,unit_price)
values (seq_product_no.nextval,'051',301,'원조한양족발',20,20000);
insert into product (no,region,p_category,p_name,p_stock,unit_price)
values (seq_product_no.nextval,'051',301,'이재모피자',20,20000);
insert into product (no,region,p_category,p_name,p_stock,unit_price)
values (seq_product_no.nextval,'051',301,'거대갈비',20,20000);
insert into product (no,region,p_category,p_name,p_stock,unit_price)
values (seq_product_no.nextval,'051',301,'금수복국 본점',20,20000);
insert into product (no,region,p_category,p_name,p_stock,unit_price)
values (seq_product_no.nextval,'051',301,'다온',20,20000);
insert into product (no,region,p_category,p_name,p_stock,unit_price)
values (seq_product_no.nextval,'051',301,'동백섬횟집',20,20000);
insert into product (no,region,p_category,p_name,p_stock,unit_price)
values (seq_product_no.nextval,'051',301,'르꽁비브',20,20000);
insert into product (no,region,p_category,p_name,p_stock,unit_price)
values (seq_product_no.nextval,'051',301,'문스시',20,20000);
insert into product (no,region,p_category,p_name,p_stock,unit_price)
values (seq_product_no.nextval,'051',301,'예이제',20,20000);
insert into product (no,region,p_category,p_name,p_stock,unit_price)
values (seq_product_no.nextval,'051',301,'원조석대추어탕',20,20000);
insert into product (no,region,p_category,p_name,p_stock,unit_price)
values (seq_product_no.nextval,'051',301,'일광대복집',20,20000);
insert into product (no,region,p_category,p_name,p_stock,unit_price)
values (seq_product_no.nextval,'051',301,'흙시루',20,20000);
insert into product (no,region,p_category,p_name,p_stock,unit_price)
values (seq_product_no.nextval,'051',301,'원조할매복국',20,20000);
insert into product (no,region,p_category,p_name,p_stock,unit_price)
values (seq_product_no.nextval,'051',301,'젠스시',20,20000);
insert into product (no,region,p_category,p_name,p_stock,unit_price)
values (seq_product_no.nextval,'051',301,'옛날 오막집',20,20000);
insert into product (no,region,p_category,p_name,p_stock,unit_price)
values (seq_product_no.nextval,'051',301,'평안도족발',20,20000);
insert into product (no,region,p_category,p_name,p_stock,unit_price)
values (seq_product_no.nextval,'051',301,'한우숯불양곱창',20,20000);
insert into product (no,region,p_category,p_name,p_stock,unit_price)
values (seq_product_no.nextval,'051',301,'쌍둥이돼지국밥',20,20000);
insert into product (no,region,p_category,p_name,p_stock,unit_price)
values (seq_product_no.nextval,'051',301,'이층집 564-9',20,20000);
insert into product (no,region,p_category,p_name,p_stock,unit_price)
values (seq_product_no.nextval,'051',301,'초원복국 대연본점',20,20000);
insert into product (no,region,p_category,p_name,p_stock,unit_price)
values (seq_product_no.nextval,'051',301,'금문',20,20000);
insert into product (no,region,p_category,p_name,p_stock,unit_price)
values (seq_product_no.nextval,'051',301,'소문난동래파전',20,20000);
insert into product (no,region,p_category,p_name,p_stock,unit_price)
values (seq_product_no.nextval,'051',301,'옹기마을',20,20000);
insert into product (no,region,p_category,p_name,p_stock,unit_price)
values (seq_product_no.nextval,'051',301,'신발원',20,20000);

--강원 033
insert into product (no,region,p_category,p_name,p_stock,unit_price)
values (seq_product_no.nextval,'033',301,'우성닭갈비',20,20000);
insert into product (no,region,p_category,p_name,p_stock,unit_price)
values (seq_product_no.nextval,'033',301,'라꼬시나바이이성용',20,20000);
insert into product (no,region,p_category,p_name,p_stock,unit_price)
values (seq_product_no.nextval,'033',301,'모녀가리비',20,20000);
insert into product (no,region,p_category,p_name,p_stock,unit_price)
values (seq_product_no.nextval,'033',301,'양지말화로구이',20,20000);
insert into product (no,region,p_category,p_name,p_stock,unit_price)
values (seq_product_no.nextval,'033',301,'주문진횟집',20,20000);
insert into product (no,region,p_category,p_name,p_stock,unit_price)
values (seq_product_no.nextval,'033',301,'삼교리동치미막국수본점',20,20000);
insert into product (no,region,p_category,p_name,p_stock,unit_price)
values (seq_product_no.nextval,'033',301,'뼈대있는짬뽕',20,20000);
insert into product (no,region,p_category,p_name,p_stock,unit_price)
values (seq_product_no.nextval,'033',301,'파크키친',20,20000);
insert into product (no,region,p_category,p_name,p_stock,unit_price)
values (seq_product_no.nextval,'033',301,'카페파이프',20,20000);
insert into product (no,region,p_category,p_name,p_stock,unit_price)
values (seq_product_no.nextval,'033',301,'갈매기횟집',20,20000);
insert into product (no,region,p_category,p_name,p_stock,unit_price)
values (seq_product_no.nextval,'033',301,'다키닥팜',20,20000);
insert into product (no,region,p_category,p_name,p_stock,unit_price)
values (seq_product_no.nextval,'033',301,'금강산횟집',20,20000);
insert into product (no,region,p_category,p_name,p_stock,unit_price)
values (seq_product_no.nextval,'033',301,'강릉수제어묵고로케',20,20000);
insert into product (no,region,p_category,p_name,p_stock,unit_price)
values (seq_product_no.nextval,'033',301,'단천식당',20,20000);
insert into product (no,region,p_category,p_name,p_stock,unit_price)
values (seq_product_no.nextval,'033',301,'송이버섯마을',20,20000);
insert into product (no,region,p_category,p_name,p_stock,unit_price)
values (seq_product_no.nextval,'033',301,'속초751샌드위치',20,20000);
insert into product (no,region,p_category,p_name,p_stock,unit_price)
values (seq_product_no.nextval,'033',301,'콩새야',20,20000);
insert into product (no,region,p_category,p_name,p_stock,unit_price)
values (seq_product_no.nextval,'033',301,'마카오박',20,20000);
insert into product (no,region,p_category,p_name,p_stock,unit_price)
values (seq_product_no.nextval,'033',301,'버드나무브루어리',20,20000);
insert into product (no,region,p_category,p_name,p_stock,unit_price)
values (seq_product_no.nextval,'033',301,'오무라안',20,20000);
insert into product (no,region,p_category,p_name,p_stock,unit_price)
values (seq_product_no.nextval,'033',301,'옛날초당순두부',20,20000);
insert into product (no,region,p_category,p_name,p_stock,unit_price)
values (seq_product_no.nextval,'033',301,'중앙닭강정',20,20000);
insert into product (no,region,p_category,p_name,p_stock,unit_price)
values (seq_product_no.nextval,'033',301,'우리장터',20,20000);
insert into product (no,region,p_category,p_name,p_stock,unit_price)
values (seq_product_no.nextval,'033',301,'남우수산',20,20000);
insert into product (no,region,p_category,p_name,p_stock,unit_price)
values (seq_product_no.nextval,'033',301,'아바이옛날식당',20,20000);
insert into product (no,region,p_category,p_name,p_stock,unit_price)
values (seq_product_no.nextval,'033',301,'청초수물회',20,20000);
insert into product (no,region,p_category,p_name,p_stock,unit_price)
values (seq_product_no.nextval,'033',301,'큰기와집',20,20000);
insert into product (no,region,p_category,p_name,p_stock,unit_price)
values (seq_product_no.nextval,'033',301,'크래프트루트',20,20000);
insert into product (no,region,p_category,p_name,p_stock,unit_price)
values (seq_product_no.nextval,'033',301,'평창한우마을',20,20000);
insert into product (no,region,p_category,p_name,p_stock,unit_price)
values (seq_product_no.nextval,'033',301,'부성불고기찜닭',20,20000);

--제주 064
insert into product (no,region,p_category,p_name,p_stock,unit_price)
values (seq_product_no.nextval,'064',301,'상춘재',20,20000);
insert into product (no,region,p_category,p_name,p_stock,unit_price)
values (seq_product_no.nextval,'064',301,'스시호시카이',20,20000);
insert into product (no,region,p_category,p_name,p_stock,unit_price)
values (seq_product_no.nextval,'064',301,'선흘곶',20,20000);
insert into product (no,region,p_category,p_name,p_stock,unit_price)
values (seq_product_no.nextval,'064',301,'숙성도',20,20000);
insert into product (no,region,p_category,p_name,p_stock,unit_price)
values (seq_product_no.nextval,'064',301,'연리지가든',20,20000);
insert into product (no,region,p_category,p_name,p_stock,unit_price)
values (seq_product_no.nextval,'064',301,'곰막',20,20000);
insert into product (no,region,p_category,p_name,p_stock,unit_price)
values (seq_product_no.nextval,'064',301,'송림반점',20,20000);
insert into product (no,region,p_category,p_name,p_stock,unit_price)
values (seq_product_no.nextval,'064',301,'오드랑베이커리',20,20000);
insert into product (no,region,p_category,p_name,p_stock,unit_price)
values (seq_product_no.nextval,'064',301,'산노루',20,20000);
insert into product (no,region,p_category,p_name,p_stock,unit_price)
values (seq_product_no.nextval,'064',301,'우진해장국',20,20000);
insert into product (no,region,p_category,p_name,p_stock,unit_price)
values (seq_product_no.nextval,'064',301,'카페태희',20,20000);
insert into product (no,region,p_category,p_name,p_stock,unit_price)
values (seq_product_no.nextval,'064',301,'피어22',20,20000);
insert into product (no,region,p_category,p_name,p_stock,unit_price)
values (seq_product_no.nextval,'064',301,'일통이반',20,20000);
insert into product (no,region,p_category,p_name,p_stock,unit_price)
values (seq_product_no.nextval,'064',301,'진아떡집',20,20000);
insert into product (no,region,p_category,p_name,p_stock,unit_price)
values (seq_product_no.nextval,'064',301,'닻',20,20000);
insert into product (no,region,p_category,p_name,p_stock,unit_price)
values (seq_product_no.nextval,'064',301,'커피파인더',20,20000);
insert into product (no,region,p_category,p_name,p_stock,unit_price)
values (seq_product_no.nextval,'064',301,'미영이네식당',20,20000);
insert into product (no,region,p_category,p_name,p_stock,unit_price)
values (seq_product_no.nextval,'064',301,'남양수산',20,20000);
insert into product (no,region,p_category,p_name,p_stock,unit_price)
values (seq_product_no.nextval,'064',301,'밀리우',20,20000);
insert into product (no,region,p_category,p_name,p_stock,unit_price)
values (seq_product_no.nextval,'064',301,'상원가든',20,20000);
insert into product (no,region,p_category,p_name,p_stock,unit_price)
values (seq_product_no.nextval,'064',301,'중문수두리보말칼국수',20,20000);
insert into product (no,region,p_category,p_name,p_stock,unit_price)
values (seq_product_no.nextval,'064',301,'맛나식당',20,20000);
insert into product (no,region,p_category,p_name,p_stock,unit_price)
values (seq_product_no.nextval,'064',301,'섭지코지로',20,20000);
insert into product (no,region,p_category,p_name,p_stock,unit_price)
values (seq_product_no.nextval,'064',301,'금박돈',20,20000);
insert into product (no,region,p_category,p_name,p_stock,unit_price)
values (seq_product_no.nextval,'064',301,'범일분식',20,20000);
insert into product (no,region,p_category,p_name,p_stock,unit_price)
values (seq_product_no.nextval,'064',301,'서귀다원',20,20000);
insert into product (no,region,p_category,p_name,p_stock,unit_price)
values (seq_product_no.nextval,'064',301,'대포칼제비',20,20000);
insert into product (no,region,p_category,p_name,p_stock,unit_price)
values (seq_product_no.nextval,'064',301,'만선식당',20,20000);
insert into product (no,region,p_category,p_name,p_stock,unit_price)
values (seq_product_no.nextval,'064',301,'도렐',20,20000);
insert into product (no,region,p_category,p_name,p_stock,unit_price)
values (seq_product_no.nextval,'064',301,'천짓골식당',20,20000);
insert into product (no,region,p_category,p_name,p_stock,unit_price)
values (seq_product_no.nextval,'064',301,'해심가든',20,20000);
insert into product (no,region,p_category,p_name,p_stock,unit_price)
values (seq_product_no.nextval,'064',301,'글라글라하와이',20,20000);
insert into product (no,region,p_category,p_name,p_stock,unit_price)
values (seq_product_no.nextval,'064',301,'춘심이네',20,20000);


-- 관광지는 언제나 출입 가능한 것으로 가정, 가격 따로 없음.

-- 제주 064 302 
insert into product (no,region,p_category,p_name)
values (seq_product_no.nextval,'064',302,'성산일출봉');
insert into product (no,region,p_category,p_name)
values (seq_product_no.nextval,'064',302,'사려니숲길');
insert into product (no,region,p_category,p_name)
values (seq_product_no.nextval,'064',302,'협재해수욕장');
insert into product (no,region,p_category,p_name)
values (seq_product_no.nextval,'064',302,'함덕해수욕장');
insert into product (no,region,p_category,p_name)
values (seq_product_no.nextval,'064',302,'산굼부리');
insert into product (no,region,p_category,p_name)
values (seq_product_no.nextval,'064',302,'새별오름');
insert into product (no,region,p_category,p_name)
values (seq_product_no.nextval,'064',302,'섭지코지');
insert into product (no,region,p_category,p_name)
values (seq_product_no.nextval,'064',302,'한라산국립공원');
insert into product (no,region,p_category,p_name)
values (seq_product_no.nextval,'064',302,'용눈이오름');
insert into product (no,region,p_category,p_name)
values (seq_product_no.nextval,'064',302,'비자림');
insert into product (no,region,p_category,p_name)
values (seq_product_no.nextval,'064',302,'천지연폭포');
insert into product (no,region,p_category,p_name)
values (seq_product_no.nextval,'064',302,'세화해변');
insert into product (no,region,p_category,p_name)
values (seq_product_no.nextval,'064',302,'정방폭포');
insert into product (no,region,p_category,p_name)
values (seq_product_no.nextval,'064',302,'김녕해수욕장');
insert into product (no,region,p_category,p_name)
values (seq_product_no.nextval,'064',302,'송악산');
insert into product (no,region,p_category,p_name)
values (seq_product_no.nextval,'064',302,'쇠소깍');
insert into product (no,region,p_category,p_name)
values (seq_product_no.nextval,'064',302,'제주절물자연휴양림');
insert into product (no,region,p_category,p_name)
values (seq_product_no.nextval,'064',302,'보롬왓');
insert into product (no,region,p_category,p_name)
values (seq_product_no.nextval,'064',302,'웃세오름');
insert into product (no,region,p_category,p_name)
values (seq_product_no.nextval,'064',302,'백록담');
insert into product (no,region,p_category,p_name)
values (seq_product_no.nextval,'064',302,'마방목지');
insert into product (no,region,p_category,p_name)
values (seq_product_no.nextval,'064',302,'청보리메밀꽃밭');
insert into product (no,region,p_category,p_name)
values (seq_product_no.nextval,'064',302,'환상숲곶자왈공원');
insert into product (no,region,p_category,p_name)
values (seq_product_no.nextval,'064',302,'생각하는정원');
insert into product (no,region,p_category,p_name)
values (seq_product_no.nextval,'064',302,'종달리수국길');
insert into product (no,region,p_category,p_name)
values (seq_product_no.nextval,'064',302,'주상절리대');
insert into product (no,region,p_category,p_name)
values (seq_product_no.nextval,'064',302,'용두암');

-- 강원 033 302 
insert into product (no,region,p_category,p_name)
values (seq_product_no.nextval,'033',302,'남이섬');
insert into product (no,region,p_category,p_name)
values (seq_product_no.nextval,'033',302,'설악산국립공원');
insert into product (no,region,p_category,p_name)
values (seq_product_no.nextval,'033',302,'경포해변');
insert into product (no,region,p_category,p_name)
values (seq_product_no.nextval,'033',302,'오대산월정사');
insert into product (no,region,p_category,p_name)
values (seq_product_no.nextval,'033',302,'오죽헌');
insert into product (no,region,p_category,p_name)
values (seq_product_no.nextval,'033',302,'강촌레일파크');
insert into product (no,region,p_category,p_name)
values (seq_product_no.nextval,'033',302,'DMZ박물관');
insert into product (no,region,p_category,p_name)
values (seq_product_no.nextval,'033',302,'휘닉스스노우파크');
insert into product (no,region,p_category,p_name)
values (seq_product_no.nextval,'033',302,'뮤지엄 산');
insert into product (no,region,p_category,p_name)
values (seq_product_no.nextval,'033',302,'정동진');
insert into product (no,region,p_category,p_name)
values (seq_product_no.nextval,'033',302,'평창송어축제');
insert into product (no,region,p_category,p_name)
values (seq_product_no.nextval,'033',302,'알파카월드');
insert into product (no,region,p_category,p_name)
values (seq_product_no.nextval,'033',302,'환선굴');
insert into product (no,region,p_category,p_name)
values (seq_product_no.nextval,'033',302,'정선레일파크');
insert into product (no,region,p_category,p_name)
values (seq_product_no.nextval,'033',302,'낙산사');
insert into product (no,region,p_category,p_name)
values (seq_product_no.nextval,'033',302,'강릉선교장');
insert into product (no,region,p_category,p_name)
values (seq_product_no.nextval,'033',302,'제이드가든 수목원');
insert into product (no,region,p_category,p_name)
values (seq_product_no.nextval,'033',302,'태백산국립공원');
insert into product (no,region,p_category,p_name)
values (seq_product_no.nextval,'033',302,'소양강스카이워크');
insert into product (no,region,p_category,p_name)
values (seq_product_no.nextval,'033',302,'동강래프팅');

-- 부산 051 302
insert into product (no,region,p_category,p_name)
values (seq_product_no.nextval,'051',302,'태종대');
insert into product (no,region,p_category,p_name)
values (seq_product_no.nextval,'051',302,'감천문화마을');
insert into product (no,region,p_category,p_name)
values (seq_product_no.nextval,'051',302,'해운대해수욕장');
insert into product (no,region,p_category,p_name)
values (seq_product_no.nextval,'051',302,'국제시장');
insert into product (no,region,p_category,p_name)
values (seq_product_no.nextval,'051',302,'영도대교');
insert into product (no,region,p_category,p_name)
values (seq_product_no.nextval,'051',302,'송도구름산책로');
insert into product (no,region,p_category,p_name)
values (seq_product_no.nextval,'051',302,'송도해상케이블카');
insert into product (no,region,p_category,p_name)
values (seq_product_no.nextval,'051',302,'낙조분수');
insert into product (no,region,p_category,p_name)
values (seq_product_no.nextval,'051',302,'다대포해수욕장');
insert into product (no,region,p_category,p_name)
values (seq_product_no.nextval,'051',302,'흰여울문화마을');
insert into product (no,region,p_category,p_name)
values (seq_product_no.nextval,'051',302,'부산아쿠아리움');
insert into product (no,region,p_category,p_name)
values (seq_product_no.nextval,'051',302,'해동용궁사');
insert into product (no,region,p_category,p_name)
values (seq_product_no.nextval,'051',302,'부산타워');
insert into product (no,region,p_category,p_name)
values (seq_product_no.nextval,'051',302,'남포동테마거리');
insert into product (no,region,p_category,p_name)
values (seq_product_no.nextval,'051',302,'광안대교');
insert into product (no,region,p_category,p_name)
values (seq_product_no.nextval,'051',302,'BIFF광장');
insert into product (no,region,p_category,p_name)
values (seq_product_no.nextval,'051',302,'서면1번가');
insert into product (no,region,p_category,p_name)
values (seq_product_no.nextval,'051',302,'비치로드');
insert into product (no,region,p_category,p_name)
values (seq_product_no.nextval,'051',302,'상해거리');
insert into product (no,region,p_category,p_name)
values (seq_product_no.nextval,'051',302,'센텀시티');
insert into product (no,region,p_category,p_name)
values (seq_product_no.nextval,'051',302,'168계단');

-- 서울: 02 부산: 051 제주 : 064 강원도 : 033
-- 201:호텔 202:펜션 
-- 301:맛집 302:관광지 303:축제
--==========================
-- cs_board Data Input
--==========================

insert into cs_board(no,title,writer,content,board_ref)
values (seq_cs_board_no.nextval,'메뉴 허위신고','jongro'
,'파송송 계란탁 메뉴에 파와 계란이 비싸다고 파대신 부추를 넣어주고 메추리알을 주셨습니다
메뉴에 장난질 하는 허위 사업자 신고합니다.'
,null);

insert into cs_board(no,title,writer,content,board_ref)
values (seq_cs_board_no.nextval,'위치정보오류','mapo'
,'업체의 위치정보가 상품과 다릅니다. 정정 요청드립니다.'
,null);
select * from cs_board;
commit;


insert into cs_board(no,title,writer,content,board_ref)
values (seq_cs_board_no.nextval,'jongro님 답변드립니다','manager'
,'먼저 고객님께 불편을 드린점 사과드립니다. 
현장방문 후 메뉴를 확인하였고 다수의 신고사례가 발견되어 블록 처리하였습니다. 
해당 업체는 관련 행정기관에 통보하여 행정조치를 받도록 이관하였습니다. 
심려를 끼친 점 다시한번 사과드리며 행정기관의 조치결과는 추후 다시 알려 드리겠습니다. 
감사합니다.'
,1);


--==========================
-- 변경필요 
--==========================
--update admin set admin_password = ? wherer admin_id=admin; 암호화된 비번으로 설정
--commit;
--orinal 비밀번호 : admin1234!
--암호화된 비밀번호 : miobE5zf+b8wlv1+6bocqQTaxmR/xiGBTPjjaBLUY5k1TanJG3m9EkTX4etpVnwGKL1+resfQJUf0XpT2nrXDA==






