class User < ActiveRecord::Base

  validates :username, presence: true
  validates :login, uniqueness: true
  validates :login, presence: true
  validates :password, presence: true
  validates :password, confirmation: true
  validates :password_confirmation, presence: true

  # Returns a copy of the password just stored
  def password
    return @password_copy
  end

  # Returns whether the password entered by the user matched the digest
  def password_valid?(candidate_password)
    return (password_digest == Digest::SHA256.hexdigest(candidate_password + salt))
  end

  # Returns a copy of the password just stored
  def password
    return @password_copy
  end

  # Setter for the virtual attribute password
  def password=(password)
    @password_copy = password
    self.salt = Random.rand.to_s
    self.password_digest = Digest::SHA256.hexdigest(password + salt)
  end
end
