class User < ActiveRecord::Base
  validates :username, :session_token, presence: true , uniqueness:true
  validates :password_digest, null: false
  validates :password, length: { minimum: 8, allow_nil: true }

  attr_reader :password

  after_initialize :ensure_session_token

  def reset_session_token!
    self.session_token = SecureRandom::urlsafe_base64(32)
    self.save
    self.session_token
  end

  def password=(password)
    @password = password
    pw_digest = BCrypt::Password.create(@password)
    self.password_digest = pw_digest
  end

  def is_password?(password)
    pw_digest = BCrypt::Password.new(self.password_digest)
    pw_digest.is_password?(password)
  end

  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)
    return nil unless user
    if user.is_password?(password)
      user
    else
      nil
    end
  end

  def ensure_session_token
    self.session_token ||= SecureRandom::urlsafe_base64(32)
  end

  has_many :cats

end
