-- 가속도 데이터를 저장하는 테이블
CREATE TABLE `acceleration_data` (
	`id` INT NOT NULL PRIMARY KEY,
	`x` INT,
	`y` INT,
	`z` INT,
	`create_date` DATETIME,
	`device_id` INT NULL,
	`pet_id` INT NULL,
	`user_id` INT NULL
);

-- 데이터 세트를 위한 테이블
CREATE TABLE `data_set` (
	`set_id` INT NOT NULL PRIMARY KEY,    -- 데이터 세트 ID
	`start_id` INT,                       -- 시작 ID
	`end_id` INT,                         -- 종료 ID
	`pet_id` INT NULL                          -- 반려동물 ID (acceleration_data 테이블의 외래 키)
);

-- 반려동물 정보를 저장하는 테이블
CREATE TABLE `pet_info` (
	`pet_id` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,    -- 반려동물 ID
	`name` CHAR(20),                      -- 이름
	`birth` INT NULL,                         -- 생년월일
	`weight` DECIMAL(5,2) NULL,                -- 무게
	`type` CHAR(20) NULL                       -- 종류
);

-- 필요한 쿼리 요건에 따라 적절한 인덱스 추가
CREATE INDEX `idx_pet_id` ON `acceleration_data`(`pet_id`);
-- 필요한 경우 추가 인덱스를 추가

ALTER TABLE `pet_info` MODIFY `pet_id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY FIRST;
