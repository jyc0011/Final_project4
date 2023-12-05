-- Users Table
CREATE TABLE users (
                       user_id VARCHAR(45) PRIMARY KEY NOT NULL,
                       user_name VARCHAR(45) NOT NULL,
                       password VARCHAR(64) NOT NULL,
                       salt VARCHAR(64) NOT NULL
                           email VARCHAR(45) NOT NULL,
                       nation VARCHAR(45) NOT NULL,
                       sex INT NOT NULL,
                       lang VARCHAR(45) NOT NULL,
                       profile_img VARCHAR(200),
                       profile_content VARCHAR(200),
                       time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
                       manager TINYINT DEFAULT 0,
                       count_report INT NOT NULL DEFAULT 0
);
ALTER TABLE users ADD COLUMN withdraw TINYINT NOT NULL DEFAULT 0;

-- Friend Table
CREATE TABLE friend (
                        following_user_id VARCHAR(45) NOT NULL,
                        followed_user_id VARCHAR(45) NOT NULL,
                        FOREIGN KEY (following_user_id) REFERENCES users(user_id),
                        FOREIGN KEY (followed_user_id) REFERENCES users(user_id)
);

-- Posts Table
CREATE TABLE posts (
                       post_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
                       user_id VARCHAR(45) NOT NULL,
                       title VARCHAR(100) NOT NULL,
                       content LONGTEXT NOT NULL,
                       views INT NOT NULL DEFAULT 0,
                       board_cat VARCHAR(45) NOT NULL,
                       write_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
                       FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- Post Like Table
CREATE TABLE post_like (
                           post_id INT NOT NULL,
                           user_id VARCHAR(45) NOT NULL,
                           FOREIGN KEY (post_id) REFERENCES posts(post_id),
                           FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- Comments Table
CREATE TABLE comments (
                          comment_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
                          user_id VARCHAR(45) NOT NULL,
                          post_id INT NOT NULL,
                          content LONGTEXT NOT NULL,
                          write_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
                          parent_comment_id INT DEFAULT NULL,
                          depth INT NOT NULL,
                          is_deleted INT NOT NULL,
                          FOREIGN KEY (user_id) REFERENCES users(user_id),
                          FOREIGN KEY (post_id) REFERENCES posts(post_id),
                          FOREIGN KEY (parent_comment_id) REFERENCES comments(comment_id)
);

-- Comment Like Table
CREATE TABLE comment_like (
                              comment_id INT NOT NULL,
                              user_id VARCHAR(45) NOT NULL,
                              FOREIGN KEY (comment_id) REFERENCES comments(comment_id),
                              FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- Chat List Table
CREATE TABLE chat_list (
                           chat_id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
                           from_id VARCHAR(45) NOT NULL,
                           to_id VARCHAR(45) NOT NULL,
                           last_content VARCHAR(45) NOT NULL,
                           not_read INT NOT NULL,
                           last_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
                           is_report TINYINT(1) DEFAULT 0,
                           FOREIGN KEY (from_id) REFERENCES users(user_id),
                           FOREIGN KEY (to_id) REFERENCES users(user_id)
);

-- Message Table
CREATE TABLE message (
                         msg_id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
                         chat_id INT NOT NULL,
                         is_from_id INT NOT NULL,
                         content LONGTEXT NOT NULL,
                         is_read TINYINT(1) DEFAULT 0,
                         send_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
                         FOREIGN KEY (chat_id) REFERENCES chat_list(chat_id)
);

-- Chat Encryption Keys Table
-- 사용여부 미지수
CREATE TABLE chat_encryption_keys (
                                      chat_id INT NOT NULL,
                                      user_id VARCHAR(256) NOT NULL,
                                      symmetric_key VARCHAR(256) NOT NULL,
                                      FOREIGN KEY (chat_id) REFERENCES chat_list(chat_id),
                                      FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- Chat Visible Table
CREATE TABLE chat_visible (
                              chat_id INT NOT NULL,
                              state VARCHAR(45) NOT NULL DEFAULT '0',
                              FOREIGN KEY (chat_id) REFERENCES chat_list(chat_id)
);

-- Save Message Table
CREATE TABLE save_message (
                              msg_id INT NOT NULL,
                              save_user_id VARCHAR(45) NOT NULL,
                              FOREIGN KEY (msg_id) REFERENCES message(msg_id),
                              FOREIGN KEY (save_user_id) REFERENCES users(user_id)
);

-- Quiz Table
CREATE TABLE quiz (
                      quiz_id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
                      level INT NOT NULL,
                      quiz_lang VARCHAR(45) NOT NULL,
                      quiz_content VARCHAR(45) NOT NULL
);

-- Answer Table
CREATE TABLE answer (
                        quiz_id INT NOT NULL,
                        answer VARCHAR(45) NOT NULL,
                        FOREIGN KEY (quiz_id) REFERENCES quiz(quiz_id)
);

-- Save Quiz Table
CREATE TABLE save_quiz (
                           user_id VARCHAR(45) NOT NULL,
                           quiz_id INT NOT NULL,
                           FOREIGN KEY (user_id) REFERENCES users(user_id),
                           FOREIGN KEY (quiz_id) REFERENCES quiz(quiz_id)
);

-- user_quiz
CREATE TABLE user_quiz (
                           quiz_id INT NOT NULL,
                           user_id VARCHAR(45) NOT NULL,
                           correct INT NOT NULL DEFAULT 0,
                           FOREIGN KEY (user_id) REFERENCES users(user_id),
                           FOREIGN KEY (quiz_id) REFERENCES quiz(quiz_id)
);

-- user_scores
CREATE TABLE user_scores (
                             user_id VARCHAR(45) NOT NULL,
                             quiz_lang VARCHAR(45) NOT NULL,
                             total_score INT NOT NULL DEFAULT 0,
                             FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- 기본적으로 싹다 아이디 세팅 들어가게 만들어둠. 혹시나 차후에 정렬이나 페이지 구현할 생각있으면 있어야 함
-- 챗 테이블에 신고 제거
ALTER TABLE chat_list
DROP COLUMN is_report;

-- message 테이블에 신고 추가
ALTER TABLE message
    ADD COLUMN is_report INT NOT NULL DEFAULT 0;

-- suspended_users 테이블 생성
CREATE TABLE suspended_users (
                                 suspended_id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
                                 user_id VARCHAR(45) NOT NULL,
                                 suspended_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                 suspended_period INT NOT NULL DEFAULT 0,
                                 reason VARCHAR(100) NOT NULL,
                                 FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- withdrawn_users 테이블 생성
CREATE TABLE withdrawn_users (
                                 withdrawn_id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
                                 user_id VARCHAR(45) NOT NULL,
                                 withdrawn_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                 FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- chat_report 테이블 생성
CREATE TABLE chat_report (
                             chat_report_id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
                             user_id VARCHAR(45) NOT NULL,
                             msg_id INT NOT NULL,
                             report_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
                             FOREIGN KEY (user_id) REFERENCES users(user_id),
                             FOREIGN KEY (msg_id) REFERENCES message(msg_id)
);

-- post_report 테이블 생성
CREATE TABLE post_report (
                             post_report_id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
                             user_id VARCHAR(45) NOT NULL,
                             post_id INT NOT NULL,
                             report_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
                             FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- block_list 테이블 생성
create table block_list(
	block_id varchar(45) NOT NULL,
    user_id varchar(45) NOT NULL,
    block_reason varchar(200),
    FOREIGN KEY (block_id) REFERENCES users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
)