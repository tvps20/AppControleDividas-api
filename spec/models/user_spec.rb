require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build(:user)}

  # Validação a presença do email
  it {is_expected.to validate_presence_of(:email)}
  # Testa se esta validando se o email é unico
  it {is_expected.to validate_uniqueness_of(:email).case_insensitive}
  # Verifica se o modo esta validando o password
  it {is_expected.to validate_confirmation_of(:password)}
  # Testa se o formato e email passa
  it {is_expected.to allow_value('thiago@santiago.com').for(:email)}

end
