-- Tìm 5 người like nhà hàng nhiều nhất
SELECT u.full_name, lr.users_id , COUNT(lr.res_id) as tong_like
from like_res lr
left join users u on lr.users_id = u.users_id
GROUP by lr.users_id
ORDER by tong_like DESC
limit 5;

-- Tìm 2 nhà hàng có lượt like nhiều nhất
SELECT r.res_name, count(lr.users_id) as nhahang_like
from restaurant r
left join like_res lr on r.res_id = lr.res_id
GROUP by lr.res_id, r.res_name
ORDER by nhahang_like desc
limit 2;

-- Tìm người đã đặt hàng nhiều nhất

SELECT o.user_id , u.full_name, COUNT(o.order_id) as order_dathang
from orders o
left join users u ON o.user_id = u.users_id
GROUP by o.user_id, u.full_name
ORDER by order_dathang DESC
limit 1

-- Tìm người không hoạt động trong hệ thống

SELECT \*
from users u
left join orders o ON u.users_id = o.user_id
LEFT JOIN like_res lr on u.users_id = lr.users_id
LEFT JOIN rate_res rr on u.users_id = rr.user_id
WHERE o.user_id IS NULL and lr.users_id is null and rr.user_id is null
