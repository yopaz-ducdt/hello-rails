#!/usr/bin/env bash
# Tự động dừng nếu có bất kỳ lệnh nào bị lỗi
set -o errexit

# 1. Cài đặt các thư viện (gems) cần thiết cho môi trường Production
bundle install

# 2. Biên dịch và nén các tài nguyên tĩnh (CSS/JS) - Thay cho hệ thống cũ trong sách
bundle exec rails assets:precompile

# 3. Dọn dẹp tài nguyên cũ để tối ưu bộ nhớ
bundle exec rails assets:clean

# 4. Chạy migration để thiết lập cấu trúc cơ sở dữ liệu PostgreSQL trên Render
bundle exec rails db:migrate