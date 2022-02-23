require 'bcrypt'

class Customer < Sequel::Model 

  # This is to return nil when validation has failed. This is for simplicity
  # If this was true we could raise the errors back out and in the error object of this
  # class and determine what to do at a more granular level. 
  self.raise_on_save_failure = false

  def validate
    # This enables some inbuilt validation - it is used for the email validation below
    Sequel::Model.plugin :validation_helpers
    # super ensures that Sequel::Model validations are enforced as we are overriding the validate method
    # See here for more info https://sequel.jeremyevans.net/rdoc/files/doc/validations_rdoc.html
    super
    errors.add(:name, 'cannot be empty') if !name || name.empty?
    errors.add(:email, 'cannot be empty') if !email || email.empty?
    errors.add(:password, 'cannot be empty') if !password || password.empty?
    validates_unique :email
  end

  def self.authenticate(email:, password:)
    result = DB[:customers].where(email: email)

    return unless result.any?
    # This checks to see if the decrypted password is equal to the password the customer entered
    return unless BCrypt::Password.new(result.first[:password]) == password

    Customer.find(result.first[:customer_id]).first
   
  end

  # This gets called just before the data is saved to the database - see Sequel docs for more info
  # on how hooks can be used. 
  # https://github.com/jeremyevans/sequel/blob/master/doc/model_hooks.rdoc
  def before_create
    encrypted_password = BCrypt::Password.create(password)
    self.password = encrypted_password
    super
  end
end

