require 'pry'
require 'test_helper'

class JobTest < ActiveSupport::TestCase
  setup do
    @job = FactoryGirl.create(:job)
    @pup_owner = FactoryGirl.create(:pup_owner)
    @walker = FactoryGirl.create(:walker)
  end
  
  # validations
  test 'job includes a DateTime drop off time' do
    assert_not @job.drop_off_time.nil?
    assert 'DateTime', @job.drop_off_time.class
  end

  test 'job includes a drop off location' do
    assert_not @job.drop_off_time.nil?
    assert_not_equal 0, @job.drop_off_location.size
  end

  test 'job includes a DateTime pick up time' do
    assert_not @job.pick_up_time.nil?
    assert 'DateTime', @job.pick_up_time.class
  end

  test 'job includes a pick up location' do
    assert_not @job.pick_up_location.nil?
    assert_not_equal 0, @job.pick_up_location.size
  end

  # methods
  test 'walk_request sets user id' do
    @job.walk_request(@walker)
    assert_not @job.walk_request_pending_user_id.nil?
    binding.pry
    assert @job.walk_request_pending_user_id.is_a? Numeric
  end

  test 'approve_walk_request sets walker id and pending walker id to nil' do
    @job.approve_walk_request(@walker)
    assert @job.walk_request_pending_user_id.nil?
    assert_not @job.walker_id.nil?
    assert @job.walker_id.is_a? Numeric
  end

  test 'deny_walk_request sets pending walker id to nil' do
    @job.deny_walk_request(@pup_owner)
    assert @job.walk_request_pending_user_id.nil?
  end

end
