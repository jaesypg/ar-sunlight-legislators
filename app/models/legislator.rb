require_relative '../../db/config'

class Legislator < ActiveRecord::Base
  validates_format_of :nickname, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/, :on => ":create", :message => "Please enter in email format"


  def self.print_senators_reps(state)
    puts "Senators:"
    #read all legislators where title is 'Sen'
    senators = Legislator.where(state: state, title: 'Sen').order('lastname DESC')
    senators.each do |s|
      puts "  #{s.firstname} #{s.lastname} (#{s.party})"
    end

    puts "Representatives:"
    representatives = Legislator.where(state: state, title: 'Rep').order('lastname')
    representatives.each do |a|
      puts "  #{a.firstname} #{a.lastname} (#{a.party})"

    end
  end

  def self.print_senators_reps_by(gender)
    gender_hash = {M: "Male", F: "Female"}

    s = Legislator.where(gender: gender, title: 'Sen', in_office: 1).count
    s_total = Legislator.where(title: 'Sen').count
    s_percent = (s.to_f/s_total.to_f*100).round
    puts "#{gender_hash[gender.to_sym]} Senators: #{s} (#{s_percent}%)"

    r = Legislator.where(gender: gender, title: 'Rep', in_office: 1).count
    r_total = Legislator.where(title: 'Rep').count
    r_percent = (r.to_f/r_total.to_f*100).round
    puts "#{gender_hash[gender.to_sym]} Representatives: #{r} (#{r_percent}%)"

  end

  def self.print_congresspeople
      state = Legislator.select(:state).distinct
      state.each do |s|
        # p s[:state]
          s_count = Legislator.where(state: s[:state], title: 'Sen').count
          r_count = Legislator.where(state: s[:state], title: 'Rep').count
          puts "#{s[:state]}: #{s_count} Senators, #{r_count} Representative(s)"
      end
  end

  def self.print_senators_reps_by_state
    puts "Senators:"
    senators = Legislator.where(title: 'Sen', in_office: 1).count
    p senators

    puts "Representatives:"
    representatives = Legislator.where(title: 'Rep', in_office: 1).count
    p representatives
  end

  def self.delete_inactive
    Legislator.destroy_all(in_office: 0)
  end


end

