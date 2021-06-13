require 'rails_helper'

RSpec.describe Vehicle, type: :model do

  it { should have_one(:vehicle_state_machine).dependent(:destroy) }
  it { should validate_presence_of(:current_state) }
  it { should validate_presence_of(:states) }

end
