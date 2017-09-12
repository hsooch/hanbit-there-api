SELECT *
  FROM tbl_there;

INSERT INTO tbl_there
		(id, name, name_en, background, summary, timezone, group_id)
values 
		('Tokyo', '도쿄', 'Tokyo', './img/theres/tokyo.jpg', '', 'Asia/Tokyo', 'Asia'),
		('Laos', '라오스', 'Laos', './img/theres/tokyo.jpg', '', 'Asia/Tokyo', 'Asia'),
		('Macau', '마카오', 'Macau', './img/theres/tokyo.jpg', '', 'Asia/Tokyo', 'Asia'),
		('Mongolia', '몽골', 'Mongolia', './img/theres/tokyo.jpg', '', 'Asia/Tokyo', 'Asia'),
		('Bali', '발리', 'Bali', './img/theres/tokyo.jpg', '', 'Asia/Tokyo', 'Asia'),
		('BangKok', '방콕', 'BangKok', './img/theres/tokyo.jpg', '', 'Asia/Tokyo', 'Asia'),
        ('Boracay', '보라카이', 'Boracay', './img/theres/tokyo.jpg', '', 'Asia/Tokyo', 'Asia'),
        ('Shanghai', '샹하이', 'Shanghai', './img/theres/tokyo.jpg', '', 'Asia/Tokyo', 'Asia'),
        ('Cebu', '세부', 'Cebu', './img/theres/tokyo.jpg', '', 'Asia/Tokyo', 'Asia'),
        ('Siemreap', '시엠립', 'Siemreap', './img/theres/tokyo.jpg', '', 'Asia/Tokyo', 'Asia'),
        ('Singapore', '싱가폴', 'Singapore', './img/theres/tokyo.jpg', '', 'Asia/Tokyo', 'Asia'),
        ('Osaka', '오사카', 'Osaka', './img/theres/tokyo.jpg', '', 'Asia/Tokyo', 'Asia'),
        ('Okinawa', '오키나와', 'Okinawa', './img/theres/tokyo.jpg', '', 'Asia/Tokyo', 'Asia'),
        ('Chiang-Mai', '치앙마이', 'Chiang-Mai', './img/theres/tokyo.jpg', '', 'Asia/Tokyo', 'Asia'),
        ('Kotakinabalu', '코타키나발루', 'Kotakinabalu', './img/theres/tokyo.jpg', '', 'Asia/Tokyo', 'Asia'),
        ('Kualalumpur', '쿠알라룸푸르', 'Kualalumpur', './img/theres/tokyo.jpg', '', 'Asia/Tokyo', 'Asia'),
        ('Phuket', '푸켓', 'Phuket', './img/theres/tokyo.jpg', '', 'Asia/Tokyo', 'Asia'),
        ('Hokkaido', '홋카이도', 'Hokkaido', './img/theres/tokyo.jpg', '', 'Asia/Tokyo', 'Asia'),
        ('HongKong', '홍콩', 'HongKong', './img/theres/tokyo.jpg', '', 'Asia/Tokyo', 'Asia'),
        ('Fukuoka', '후쿠오카', 'Fukuoka', './img/theres/tokyo.jpg', '', 'Asia/Tokyo', 'Asia'),
        ('London', '런던', 'London', './img/theres/tokyo.jpg', '', 'Asia/Tokyo', 'Euroup'),
        ('Rome', '로마', 'Rome', './img/theres/tokyo.jpg', '', 'Asia/Tokyo', 'Euroup'),
        ('Madrid', '마드리드', 'Madrid', './img/theres/tokyo.jpg', '', 'Asia/Tokyo', 'Euroup'),
        ('Barcelona', '바르셀로나', 'Barcelona', './img/theres/tokyo.jpg', '', 'Asia/Tokyo', 'Euroup'),
        ('Venice', '베네치아', 'Venice', './img/theres/tokyo.jpg', '', 'Asia/Tokyo', 'Euroup'),
        ('eurail', '유레일패스', 'eurail', './img/theres/tokyo.jpg', '', 'Asia/Tokyo', 'Euroup'),
        ('Interlaken', '인터라켄', 'Interlaken', './img/theres/tokyo.jpg', '', 'Asia/Tokyo', 'Euroup'),
        ('Paris', '파리', 'Paris', './img/theres/tokyo.jpg', '', 'Asia/Tokyo', 'Euroup'),
        ('Florence', '피렌체', 'Florence', './img/theres/tokyo.jpg', '', 'Asia/Tokyo', 'Euroup'),
        ('Gold-Coast', '골드코스트', 'Gold-Coast', './img/theres/tokyo.jpg', '', 'Asia/Tokyo', 'Oceania'),
        ('NewZealand', '뉴질랜드', 'NewZealand', './img/theres/tokyo.jpg', '', 'Asia/Tokyo', 'Oceania'),
        ('darwin', '다윈', 'darwin', './img/theres/tokyo.jpg', '', 'Asia/Tokyo', 'Oceania'),
        ('Melbourne', '멜버른', 'Melbourne', './img/theres/tokyo.jpg', '', 'Asia/Tokyo', 'Oceania'),
        ('Brisbane', '브리즈번', 'Brisbane', './img/theres/tokyo.jpg', '', 'Asia/Tokyo', 'Oceania'),
        ('Sydney', '시드니', 'Sydney', './img/theres/tokyo.jpg', '', 'Asia/Tokyo', 'Oceania'),
        ('adelaide', '애들레이드', 'adelaide', './img/theres/tokyo.jpg', '', 'Asia/Tokyo', 'Oceania'),
        ('uluru', '울룰루', 'uluru', './img/theres/tokyo.jpg', '', 'Asia/Tokyo', 'Oceania'),
        ('tasmania', '타즈매니아', 'tasmania', './img/theres/tokyo.jpg', '', 'Asia/Tokyo', 'Oceania'),
        ('perth', '퍼스', 'perth', './img/theres/tokyo.jpg', '', 'Asia/Tokyo', 'Oceania'),
        ('gangwon', '강원', 'gangwon', './img/theres/tokyo.jpg', '', 'Asia/Tokyo', 'Korea'),
        ('Seoul', '서울', 'Seoul', './img/theres/tokyo.jpg', '', 'Asia/Tokyo', 'Korea'),
        ('suncheon', '순천', 'suncheon', './img/theres/tokyo.jpg', '', 'Asia/Tokyo', 'Korea'),
        ('jeolla', '전라', 'jeolla', './img/theres/tokyo.jpg', '', 'Asia/Tokyo', 'Korea'),
        ('Jeju', '제주', 'Jeju', './img/theres/tokyo.jpg', '', 'Asia/Tokyo', 'Korea'),
        ('Chungcheong', '충청', 'Chungcheong', './img/theres/tokyo.jpg', '', 'Asia/Tokyo', 'Korea'),
        ('tongyeong', '통영', 'tongyeong', './img/theres/tokyo.jpg', '', 'Asia/Tokyo', 'Korea');
        
SELECT *
  FROM tbl_location;
  
INSERT INTO tbl_location
	(id, lat, lng)
VALUES
    ('Taiwan', 25.032969, 121.565418);


SELECT *
  FROM tbl_info
 WHERE id = 'Newyork'
 ORDER BY info_order;
  
INSERT INTO tbl_info
	(id, info_id, title, value, info_order)
VALUES
	('Taiwan', 1, '언어', '중국어(만다린), 객가어', 1),
    ('Taiwan', 2, '화폐', '뉴 타이완 달러(TWD, New Taiwan Dollar)', 2),
    ('Taiwan', 3, '비자', '30일 이하 대만 무비자', 3),
    ('Taiwan', 4, 'TIP', '교통패스 이지카드를 구입하면 편리합니다', 4);
    

SELECT *
  FROM tbl_traffic;
  
INSERT INTO tbl_traffic
	(id, traffic_id, title, contents, icon, traffic_order)
VALUES
	('Taiwan', 1, '지하철 MRT', '타이페이 시내 대부분을 이동 할 수 있는 타이페이 교통의 중심 지하철', 'subway', 1),
    ('Taiwan', 2, '자전거', '시내 곳곳에서 쉽게 찾을 수 있는 자전거 정거장에서 자유롭게 이용 후 30분 무료 탑승 후 반납할 수 있는 자전거', 'bicycle', 2),
    ('Taiwan', 3, '시내버스 Bus', '타이페이 시민의 발이 되어주는, 200여개의 노선이 운행되고 있는 타이페이 버스', 'bus', 3),
    ('Taiwan', 4, '호텔셔틀버스', '타이완 관광청에서 운영하고 주요관광지로 이동할 수 있는 셔틀버스', 'bus', 4),
    ('Taiwan', 5, '택시 Taxi', '친절한 택시기사가 많기로 소문난 타이페이 택시', 'taxi', 5);
    
    
SELECT *
  FROM tbl_there_group
 ORDER BY group_order;

INSERT INTO tbl_there_group
	(id, name, group_order)
VALUES
	('America', '아메리카', '1'),
    ('Asia', '아시아', '2'),
    ('Euroup', '유럽', '3'),
    ('Oceania', '오세아니아', '4'),
    ('Korea', '국내', '5');
    
    
    
SELECT g.name group_name, t.id, t.name
  FROM tbl_there_group g, tbl_there t
 WHERE g.id = t.group_id
 ORDER BY group_order, t.name;
 
 
 
SELECT *
  FROM tbl_there_group;
  
SELECT NOW();

UPDATE tbl_there_group
   SET update_dt = NOW()
 WHERE id IN ('Asia', 'Europe', 'Oceania', 'Korea');
 
 SELECT g.id, g.name, g.update_dt, 
		COUNT(t.group_id) there_count
  FROM tbl_there_group g, tbl_there t
 WHERE g.id = t.group_id
 GROUP BY t.group_id
 ORDER BY group_order;
 

select * from tbl_there_group;

			SELECT 'Africa', '아프리카', MAX(group_order) + 1, NOW()
			  FROM tbl_there_group;
              
SELECT g.id, g.name, g.update_dt, COUNT(t.group_id) there_count
		 FROM tbl_there_group g LEFT JOIN tbl_there t
		   ON g.id = t.group_id
		GROUP BY t.group_id
		ORDER BY group_order;

SELECT g.id, g.name, g.update_dt, COUNT(t.group_id) there_count
		 FROM tbl_there_group g, tbl_there t
		WHERE g.id = t.group_id
		GROUP BY t.group_id
		ORDER BY group_order;
        
        
SELECT t.id, t.group_id, t.name, t.summary, t.background,
	   COUNT(distinct i.info_id) info_count,	-- distinct = 중복해서 세지 않음
       COUNT(distinct tr.traffic_id) traffic_count
  FROM tbl_there t
  LEFT JOIN tbl_info i
    ON t.id = i.id
  LEFT JOIN tbl_traffic tr
    ON t.id = tr.id
 WHERE group_id = 'America'
 GROUP BY t.id
 ORDER BY name;
 
 REPLACE INTO tbl_file
			(file_id, file_path, content_type, content_length, file_name)
		VALUES
			('A', '/abc', 'image/gif', 123, 'abc.gif');

INSERT INTO tbl_file
	(file_id, file_path, content_type, content_length, file_name)
VALUES
	('A', '/abc', 'image/gif', 123, 'abc.gif')
ON DUPLICATE KEY UPDATE		-- mysql 만 있는것
	content_length = content_length + 1;
				
SELECT * FROM tbl_file;

DELETE FROM tbl_File WHERE file_id = 'A';

SELECT * FROM hanbit_there.tbl_member;      
        
SELECT PASSWORD('abcd'); -- *A154C52565E9E7F94BFC08A1FE702624ED8EFFDA
SELECT PASSWORD('1234'); -- *A4B6157319038724E3560894F7F932C8886EBFCFtbl_member

SELECT email, name, phone, IFNULL(info, 'N') info, avatar
  FROM tbl_member m LEFT JOIN tbl_member_detail d
    ON m.uid = d.uid
 WHERE m.uid = 'l4OtT4yLmxVZ';
 
SELECT * FROM tbl_member;

SELECT password from tbl_member where uid = 'HtqCeBMBAp6B';

SELECT * FROM tbl_member_detail;        
        
        
        