create table users (
    email varchar(255) primary key,
    created_at timestamp default now()
);

-- mysql> desc users;
-- +------------+--------------+------+-----+-------------------+-------+
-- | Field      | Type         | Null | Key | Default           | Extra |
-- +------------+--------------+------+-----+-------------------+-------+
-- | email      | varchar(255) | NO   | PRI | NULL              |       |
-- | created_at | timestamp    | NO   |     | CURRENT_TIMESTAMP |       |
-- +------------+--------------+------+-----+-------------------+-------+
-- 2 rows in set (0.00 sec)

INSERT INTO users (email) VALUES('Katie34@yahoo.com'), ('Tunde@gmail.com');

-- SELECT * FROM users;

-- mysql> INSERT INTO users (email) VALUES('Katie34@yahoo.com'), ('Tunde@gmail.com');
-- Query OK, 2 rows affected (0.01 sec)
-- Records: 2  Duplicates: 0  Warnings: 0

-- mysql> SELECT * FROM users;
-- +-------------------+---------------------+
-- | email             | created_at          |
-- +-------------------+---------------------+
-- | Katie34@yahoo.com | 2018-05-13 17:40:53 |
-- | Tunde@gmail.com   | 2018-05-13 17:40:53 |
-- +-------------------+---------------------+
-- 2 rows in set (0.01 sec)

select date_format(created_at, "%M %D %Y") as earliest_date from users
order by earliest_date limit 1;

-- mysql> select created_at as earliest_date from users
--     -> order by earliest_date limit 1;
-- +---------------------+
-- | earliest_date       |
-- +---------------------+
-- | 2017-05-15 07:53:27 |
-- +---------------------+
-- 1 row in set (0.00 sec)

-- mysql> select date_format(created_at, "%M %D %Y") as earliest_date from users
--     -> order by earliest_date limit 1;
-- +-----------------+
-- | earliest_date   |
-- +-----------------+
-- | April 10th 2018 |
-- +-----------------+
-- 1 row in set (0.01 sec)

select min(created_at) as earliest_date from users;

-- mysql> select min(created_at) as earliest_date from users;                                                                          
-- +---------------------+
-- | earliest_date       |
-- +---------------------+
-- | 2017-05-15 07:53:27 |
-- +---------------------+
-- 1 row in set (0.00 sec)

select date_format(min(created_at), "%M %D %Y") as earliest_date from users;

-- mysql> select date_format(min(created_at), "%M %D %Y") as earliest_date from users;
-- +---------------+
-- | earliest_date |
-- +---------------+
-- | May 15th 2017 |
-- +---------------+
-- 1 row in set (0.01 sec)


select email, created_at from users
where created_at = (select min(created_at) from users);

-- mysql> select email, created_at from users
--     -> where created_at = (select min(created_at) from users);
-- +------------------------+---------------------+
-- | email                  | created_at          |
-- +------------------------+---------------------+
-- | Coby.Kuhlman@gmail.com | 2017-05-15 07:53:27 |
-- +------------------------+---------------------+
-- 1 row in set (0.01 sec)

select date_format(created_at,"%M") as month, count(created_at) as count 
from users group by month order by count desc;

-- monthname(created_at)
-- count(*)

-- mysql> select date_format(created_at,"%M") as month, count(created_at) as count 
--     -> from users group by month order by count desc;
-- +-----------+-------+
-- | month     | count |
-- +-----------+-------+
-- | August    |    51 |
-- | May       |    49 |
-- | October   |    47 |
-- | November  |    41 |
-- | February  |    41 |
-- | July      |    41 |
-- | April     |    40 |
-- | December  |    39 |
-- | January   |    39 |
-- | June      |    38 |
-- | March     |    37 |
-- | September |    37 |
-- +-----------+-------+
-- 12 rows in set (0.01 sec)

select count(email) as yahoo_users from users where email like '%@yahoo%';

-- like '%@yahoo.com'

-- mysql> select count(email) as yahoo_users from users where email like '%@yahoo%';
-- +-------------+
-- | yahoo_users |
-- +-------------+
-- |         159 |
-- +-------------+
-- 1 row in set (0.00 sec)

select
    case 
        when email like '%@yahoo%' then 'yahoo'
        when email like '%@gmail%' then 'gmail'
        when email like '%@hotmail%' then 'hotmail'
        else 'other'
    end as provider, 
    count(email) as total_users
from users group by provider desc;

-- order by total_users desc;

-- mysql> select
--     ->     case 
--     ->         when email like '%@yahoo%' then 'yahoo'
--     ->         when email like '%@gmail%' then 'gmail'
--     ->         when email like '%@hotmail%' then 'hotmail'
--     ->         else 'other' 
--     ->     end as provider, 
--     ->     count(email) as total_users
--     -> from users group by provider desc;
-- +----------+-------------+
-- | provider | total_users |
-- +----------+-------------+
-- | yahoo    |         159 |
-- | hotmail  |         166 |
-- | gmail    |         175 |
-- +----------+-------------+
-- 3 rows in set (0.00 sec)

