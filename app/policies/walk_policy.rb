class WalkPolicy < ApplicationPolicy

  def owner_current_user?
    record.owner == user
  end

  def walker_current_user?
    record.walker == user
  end

  def walker_update_start?
    record.walker == user and not record.started_by_walker and record.coming_up?
  end

  def walker_update_end?
    record.walker == user and not record.ended_by_walker and record.started_by_walker
  end

  def not_started?
    !record.started_by_walker
  end

  def started?
    record.started_by_walker and not record.ended_by_walker
  end

  def ended?
    record.ended_by_walker
  end

end