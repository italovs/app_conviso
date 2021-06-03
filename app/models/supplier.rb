class Supplier < ApplicationRecord
  belongs_to :user
  validate :verify_repeated_email

  protected

  # verify if exist another supplier with same email, only one supplier with these email per user
  def verify_repeated_email
    suppliers = Supplier.where(email: email, user_id: user_id)
    if supplier.blank?
      true
    else
      errors.add(:email, 'não pode haver dois fornecedores com mesmo email')
    end
  end
end
