source "https://rubygems.org"

gem "rails", "~> 8.1.3"

# Pipeline quản lý tài nguyên kiểu mới của Rails 8 (thay thế cho sass-rails/webpacker trong sách)
gem "propshaft"
# Use the Puma web server [https://github.com/puma/puma]
gem "puma", ">= 5.0"
# Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"

# Các công cụ tối ưu hóa hiệu năng cốt lõi của Rails 8
gem "solid_cache"
gem "solid_queue"
gem "solid_cable"
gem "bootsnap", require: false
gem "thruster", require: false
gem "image_processing", "~> 2.0"

# Băm mật khẩu (Bỏ dấu thăng # để bật sẵn cho các chương sau khi làm tính năng Đăng nhập)
gem "bcrypt", "~> 3.1.7"

# Phân chia Cơ sở dữ liệu theo môi trường:
group :development, :test do
  # Giữ nguyên SQLite cho máy local (bản >= 2.1 của Rails 8)
  gem "sqlite3", ">= 2.1"

  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude"
  gem "bundler-audit", require: false
  gem "brakeman", require: false
  gem "rubocop-rails-omakase", require: false
end

group :development do
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
end

# THÊM NHÓM NÀY CHO RENDER RUNNING PRODUCTION
group :production do
  # Render yêu cầu Postgresql để chạy thật
  gem "pg"
end

# Windows và JRuby compatibility
gem "tzinfo-data", platforms: %i[ windows jruby ]
