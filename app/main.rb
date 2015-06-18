require_relative '../app/models/legislator'

#question no.1
# print "I dont like this state, and enter the state and if you enter the state you will be happy: "  #"NY"
# state = gets.chomp
# Legislator.print_senators_reps(state)

#question no.2
# print "Enter gender: "  #"M"
# gender = gets.chomp
# Legislator.print_senators_reps_by(gender)

#question no.3
# Legislator.print_congresspeople

#question no.4
Legislator.print_senators_reps_by_state

#question no.5
Legislator.delete_inactive

Legislator.print_senators_reps_by_state
