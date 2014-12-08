require 'spec_helper'

describe Clearance::User do
  before { Clearance.configuration.password_strategy = :company_id }
  after { Clearance.configuration.password_strategy = nil }

  describe 'when multiple users have signed up' do
    it { is_expected.to validate_uniqueness_of(:email).scoped_to(:company_id) }
  end

end
