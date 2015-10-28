class OfferPolicy < ApplicationPolicy

  def acceptable?
    record.walk.owner.eql? user
  end
  
end