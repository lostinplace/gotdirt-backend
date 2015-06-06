require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  u = User.new
  u.email = 'kevin@kbedell.com'
  u.password = 'kevin@kbedell.com'
  u.save!
end
