class Project < ApplicationRecord
  has_many :tasks, dependent: :destroy
  belongs_to :user
  has_many :assignments
  has_many :users, through: :assignments

  def status
    return 'In Progress' if tasks.empty?

    if tasks.all?(&:status)==false
      'In Progress'
    else
      'Completed'
    end
  end

end
