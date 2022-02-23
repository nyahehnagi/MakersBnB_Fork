class Customer < Sequel::Model


  def validate
    super
    errors.add(:name, 'cannot be empty') if !name || name.empty?
    errors.add(:email, 'cannot be empty') if !email || email.empty?
    errors.add(:password, 'cannot be empty') if !password || password.empty?
  end

  def self.authenticate(email:, password:)
    result = DB[:customers].where(email: email)

    return unless result.any?
    return unless result.first[:password] == password

    Customer.find(result.first[:customer_id]).first

  end

  # Need to introduce Model Hooks to override .create to add encryption
  def before_create
    # Add encryption code
    super
  end
end

