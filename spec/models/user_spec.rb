require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:doctors) }
  it { is_expected.to have_db_column(:username) }
  it { is_expected.to have_db_column(:email) }
  it { is_expected.to have_db_column(:admin) }
end
