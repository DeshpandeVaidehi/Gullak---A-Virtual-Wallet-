create database VW;

use VW;

CREATE TABLE IF NOT EXISTS user_account (
  user_id int NOT NULL AUTO_INCREMENT,
  user_name varchar(30) NOT NULL,
  email varchar(30),
  mobile_no double NOT NULL,
  password varchar(64) NOT NULL,
  rewards_balance float(15, 2) NOT NULL DEFAULT '50',
  balance float(15, 2) NOT NULL DEFAULT '50',
  PRIMARY KEY (user_id, mobile_no)
);


CREATE TABLE IF NOT EXISTS passbook (
  t_id double NOT NULL AUTO_INCREMENT PRIMARY KEY,
  date_time datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  from_user double NOT NULL,
  to_user double NOT NULL,
  amount float(15, 2) NOT NULL DEFAULT '0',
  success_flag int(1) NOT NULL,
  reward_amount float(15, 2) NOT NULL DEFAULT '0',
  description varchar(200)  DEFAULT 'NA'
);

CREATE TABLE IF NOT EXISTS user_card (
   mobile_no double NOT NULL,
   cardholder_name varchar(30) NOT NULL,
   card_type varchar(10) NOT NULL,
   card_number varchar(20) NOT NULL,
   expiry_date varchar(10) NOT NULL,
   is_default int(1) NOT NULL DEFAULT '0',
   PRIMARY KEY (mobile_no, card_number)
);

CREATE TABLE IF NOT EXISTS add_history(
   t_id double NOT NULL AUTO_INCREMENT PRIMARY KEY,
   mobile_no double NOT NULL,
   card_number double DEFAULT NULL,
   date_time datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
   amount float(15, 2) NOT NULL DEFAULT '0'
);

CREATE TABLE IF NOT EXISTS request_record(
  r_id double NOT NULL AUTO_INCREMENT PRIMARY KEY,
  date_time datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  from_user double NOT NULL,
  to_user double NOT NULL,
  amount float(15, 2) NOT NULL DEFAULT '0',
  description varchar(200)  DEFAULT 'NA'
);

ALTER TABLE bank_record ADD CONSTRAINT fk_from_user FOREIGN KEY (to_user) REFERENCES user_account(mobile_no);
--ALTER TABLE passbook ADD CONSTRAINT fk_from_user FOREIGN KEY (from_user) REFERENCES user_account(mobile_no);

--insert statements

insert into user_account (user_id, user_name, email, mobile_no, password, balance) values(11, 'anurag', 'anu@email.com', 9999, '18b723e90bad48e2e454d7dc2964d9bf28b58c34d3a4e6f9d10352698cfc94fb', 500), (12, 'vaidehi', 'vaidehi@gmail.com', 7899, '766d2937ee749408b5b44099bfa87b83d1d02817b70b1b458659f02d829fa7e9', 120), (13, 'ventak', 'ventak@yahoo.com', 7869, '8396a49345b0f6f6eaea5fc9864f29dfecab3bccafbd5e6b9d4a833534779c75', 20), (14, 'aish', 'aish@amail.com', 7709, 'e23c74dedd0aa9043e9118bd7d9840096a1302ff376748c90832767c309eeca0', 40);


-- anurag 123456 18b723e90bad48e2e454d7dc2964d9bf28b58c34d3a4e6f9d10352698cfc94fb 
-- vaidehi 456123 766d2937ee749408b5b44099bfa87b83d1d02817b70b1b458659f02d829fa7e9
-- venkat venkat 8396a49345b0f6f6eaea5fc9864f29dfecab3bccafbd5e6b9d4a833534779c75
-- aish ash123 e23c74dedd0aa9043e9118bd7d9840096a1302ff376748c90832767c309eeca0













