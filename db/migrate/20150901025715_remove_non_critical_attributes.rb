class RemoveNonCriticalAttributes < ActiveRecord::Migration
  def change
    drop_table :availabilities
    remove_column :jobs, :availability_id
    remove_column :jobs, :hidden
    remove_column :jobs, :how_did_it_go
    remove_column :jobs, :status
    remove_column :pups, :special_needs
    remove_column :pups, :hidden
    remove_column :requests, :availability_id
    remove_column :requests, :hidden
    remove_column :requests, :enqueued_job_id
    remove_column :users, :user_pending_requests_count
    remove_column :users, :pups_w_special_needs
    remove_column :users, :walking_experience
    remove_column :users, :small_pups
    remove_column :users, :medium_pups
    remove_column :users, :large_pups
    remove_column :users, :giant_pups
    remove_column :users, :oral_med_admin
    remove_column :users, :senior_pups
    remove_column :users, :puppies
    remove_column :users, :bathroom_breaks
    remove_column :users, :hidden
    remove_column :users, :feedback_rating
  end
end
