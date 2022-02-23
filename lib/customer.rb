require 'bcrypt'

class Customer < Sequel::Model 

  # This is to return nil when validation has failed. This is for simplicity
  # If this was true we could raise the errors back out and in the error object of this
  # class and determine what to do at a more granular level. 
  self.raise_on_save_failure = false

  def validate
    Sequel::Model.plugin :validation_helpers
    super
    errors.add(:name, 'cannot be empty') if !name || name.empty?
    errors.add(:email, 'cannot be empty') if !email || email.empty?
    errors.add(:password, 'cannot be empty') if !password || password.empty?
    validates_unique :email
  end

  def self.authenticate(email:, password:)
    result = DB[:customers].where(email: email)

    return unless result.any?
    return unless BCrypt::Password.new(result.first[:password]) == password

    Customer.find(result.first[:customer_id]).first
   
  end

  # Need to introduce Model Hooks to override .create to add encryption
  def before_create
    encrypted_password = BCrypt::Password.create(password)
    self.password = encrypted_password
    super
  end
end

