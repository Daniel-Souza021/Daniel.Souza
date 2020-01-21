class ContactValidator < ActiveModel::Validator

  def validate contact
    email_precisa_ter_arroba! contact
  end

  def email_precisa_ter_arroba! contact
    contact.errors.add :email, 'precisa ser válido' unless contact.email.to_s.include? '@'
  end

end