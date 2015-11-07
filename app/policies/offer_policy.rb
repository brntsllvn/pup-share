class OfferPolicy < ApplicationPolicy

  def user_authorized_to_accept?
    record.walk.owner.eql? user
  end
  
end