class ProfilesController < ApplicationController

def index
  @public_facts = Fact.where(user_id: current_user.id).where(private: false)
  @private_facts = Fact.where(user_id: current_user.id).where(private: true)
end

end
