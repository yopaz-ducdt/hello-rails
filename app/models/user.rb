class User < ApplicationRecord
  # Tạo một biến ảo (tạm thời) để chứa token thô trước khi đưa xuống cookie
  attr_accessor :remember_token

  before_save { email.downcase! }

  validates :name, presence: true, length: { maximum: 50 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, presence: true, length: { maximum: 250 },
    format: { with: VALID_EMAIL_REGEX }, uniqueness: true

  has_secure_password

  validates :password, presence: true, length: { minimum: 6 }

  # Hàm mã hóa chuỗi thô (dùng chung cho cả kiểm tra test sau này)
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost

    BCrypt::Password.create(string, cost: cost)
  end

  # Hàm sinh ra một chuỗi ngẫu nhiên an toàn (Token)
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  # Hàm xử lý ghi nhớ: sinh token thô và lưu bản băm vào DB
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  # Kiểm tra xem token thô gửi lên có khớp với bản băm trong DB không
  def authenticated?(remember_token)
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  def forget
    update_attribute(:remember_digest, nil)
  end
end
