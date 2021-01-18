require 'rails_helper'

RSpec.describe Appointment, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:doctor) }
  it { is_expected.to have_db_column(:date) }
  it { is_expected.to have_db_column(:city) }
  it { is_expected.to have_db_column(:doctor_name) }
  it { is_expected.to have_db_column(:username) }
end
