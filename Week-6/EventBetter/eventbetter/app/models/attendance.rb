class Attendance < ApplicationRecord
  after_create :confirm_host
  belongs_to :event
  belongs_to :user


  def confirm_host
    AttendanceMailer.confirm_host(self).deliver_now
  end
end
