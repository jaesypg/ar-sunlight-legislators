require_relative '../app/models/legislator'
require_relative '../app/models/Sen'
require_relative '../app/models/Rep'


class Main
	def self.print_senators_reps(state)
	    puts "Senators:"
	    #read all legislators where title is 'Sen'
	    # senators = Legislator.where(state: state, title: 'Sen').order('lastname DESC')
	    senators = Sen.where(state: state).order('lastname DESC')
	    senators.each do |s|
	    	puts "  #{s.firstname} #{s.lastname} (#{s.party})"
		end

	    puts "Representatives:"
	    representatives = Rep.where(state: state).order('lastname')
	    # representatives = Legislator.where(state: state, title: 'Rep').order('lastname')
	    representatives.each do |a|
	    	puts "  #{a.firstname} #{a.lastname} (#{a.party})"
    	end
  	end

  	def self.print_senators_reps_by(gender)
	    gender_hash = {M: "Male", F: "Female"}

	    # s = Legislator.where(gender: gender, title: 'Sen', in_office: 1).count
	    s = Sen.where(gender: gender, in_office: 1).count
	    # s_total = Legislator.where(title: 'Sen').count
	    s_total = Sen.count
	    s_percent = (s.to_f/s_total.to_f*100).round
	    puts "#{gender_hash[gender.to_sym]} Senators: #{s} (#{s_percent}%)"

	    # r = Legislator.where(gender: gender, title: 'Rep', in_office: 1).count
	    r = Rep.where(gender: gender, in_office: 1).count
	    # r_total = Legislator.where(title: 'Rep').count
	    r_total = Rep.count
	    r_percent = (r.to_f/r_total.to_f*100).round
	    puts "#{gender_hash[gender.to_sym]} Representatives: #{r} (#{r_percent}%)"
	end

  	def self.print_congresspeople
      state = Legislator.select(:state).distinct
      state.each do |s|
        # p s[:state]
          # s_count = Legislator.where(state: s[:state], title: 'Sen').count
          s_count = Sen.where(state: s[:state]).count
          # r_count = Legislator.where(state: s[:state], title: 'Rep').count
          r_count = Rep.where(state: s[:state]).count
          puts "#{s[:state]}: #{s_count} Senators, #{r_count} Representative(s)"
      end
 	 end

  	def self.print_senators_reps_by_state
	    puts "Senators:"
	    # senators = Legislator.where(title: 'Sen', in_office: 1).count
	    # senators = Sen.where(in_office: 1).count
	    senators = Sen.count
	    p senators

	    puts "Representatives:"
	    # representatives = Legislator.where(title: 'Rep', in_office: 1).count
	    # representatives = Rep.where(in_office: 1).count
	    representatives = Rep.count
	    p representatives
  	end

  	def self.delete_inactive
    	# Legislators.destroy_all(in_office: 0)
    	Sen.destroy_all(in_office: 0)
 		Rep.destroy_all(in_office: 0)
  	end
 end

#question no.1
# print "I dont like this state, and enter the state and if you enter the state you will be happy: "  #"NY"
# state = gets.chomp
# #Legislator.print_senators_reps(state)
# Main.print_senators_reps(state)

#question no.2
# print "Enter gender: "  #"M"
# gender = gets.chomp
# Main.print_senators_reps_by(gender)

#question no.3
# Main.print_congresspeople

#question no.4
Main.print_senators_reps_by_state

#question no.5
Main.delete_inactive

Main.print_senators_reps_by_state
