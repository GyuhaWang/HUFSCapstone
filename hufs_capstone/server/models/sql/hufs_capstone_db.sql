-- 가속도 데이터를 저장하는 테이블
CREATE TABLE `acceleration_data` (
	`id` INT NOT NULL PRIMARY KEY,        -- 고유 ID
	`x` INT,                              -- x 좌표
	`y` INT,                              -- y 좌표
	`z` INT,                              -- z 좌표
	`create_date` DATETIME,               -- 생성 날짜 및 시간
	`device_id` INT,                      -- 디바이스 ID
	`pet_id` INT,                         -- 반려동물 ID
	`user_id` INT,                        -- 사용자 ID
);

-- 데이터 세트를 위한 테이블
CREATE TABLE `data_set` (
	`set_id` INT NOT NULL PRIMARY KEY,    -- 데이터 세트 ID
	`start_id` INT,                       -- 시작 ID
	`end_id` INT,                         -- 종료 ID
	`pet_id` INT,                         -- 반려동물 ID (acceleration_data 테이블의 외래 키)
);

-- 반려동물 정보를 저장하는 테이블
CREATE TABLE `pet_info` (
	`pet_id` INT NOT NULL PRIMARY KEY,    -- 반려동물 ID
	`name` CHAR(20),                      -- 이름
	`birth` DATE,                         -- 생년월일
	`weight` DECIMAL(5,2),                -- 무게
	`type` CHAR(20)                       -- 종류
);

-- 필요한 쿼리 요건에 따라 적절한 인덱스 추가
CREATE INDEX `idx_pet_id` ON `acceleration_data`(`pet_id`);
-- 필요한 경우 추가 인덱스를 추가
