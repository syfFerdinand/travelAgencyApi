class Site < ApplicationRecord
  belongs_to :city

  after_destroy :log_destroy_action

  def log_destroy_action
    puts 'Site destroyed'
  end
end
