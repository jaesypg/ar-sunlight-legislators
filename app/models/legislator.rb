require_relative '../../db/config'

class Legislator < ActiveRecord::Base
  validates_format_of :nickname, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/, :on => ":create", :message => "Please enter in email format"


end

