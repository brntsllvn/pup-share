class Offer < ActiveRecord::Base

  belongs_to :user
  belongs_to :walker, class_name: 'User'
  belongs_to :walk

  def send_mailer
    OfferMailer.offer_mailer(self).deliver_now 
    self.update_attributes status: 'pending'
  end

  #   def approve_walk_request
  #     self.job.update_attributes walker_id: self.user.id
  #     # WalkRequest.walk_request_follow_up(self).deliver_later(wait: 1.second)
  #     # setting enqueued_job_id allows me to locate the enqueued job later for deletion if a request is denied or cancelled
  #     self.update_attributes status: 'approved'#, enqueued_job_id: Delayed::Job.last.id
  #     return 'Request approved'
  #   end

  #   def deny_walk_request
  #     self.update_attributes status: 'declined'
  #     # self.destroy_enqueued_job
  #     return 'Request declined'
  #   end

  #   def cancel_walk
  #     self.update_attributes status: 'cancelled'
  #     # self.destroy_enqueued_job
  #     return 'Walk cancelled'
  #   end

  #   def send_request_mailers(status)
  #     case status
  #     when 'approved'
  #       self.approve_walk_request
  #     when 'declined'
  #       self.deny_walk_request
  #     when 'cancelled'
  #       self.cancel_walk
  #     end
  #   end

end
