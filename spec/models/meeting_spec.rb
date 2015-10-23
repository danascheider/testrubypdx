require 'rails_helper'

RSpec.describe Meeting, type: :model do
  it { is_expected.to respond_to(:date) }
  it { is_expected.to respond_to(:description) }
end
