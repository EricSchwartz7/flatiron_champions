# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Ability.create(name: 'criticize_readme', reliability: 4, char_type: 'student')
Ability.create(name: 'complete_lab', reliability: 12, char_type: 'student')
Ability.create(name: 'give_presentation', reliability: 5, char_type: 'student')
Ability.create(name: 'ask_nonsensical_question', reliability: 10, char_type: 'student')
Ability.create(name: 'snap_fingers', reliability: 14, char_type: 'student')

Ability.create(name: 'give_lecture', reliability: 13, char_type: 'ian')
Ability.create(name: 'make_intentional_mistake', reliability: 11, char_type: 'ian')
Ability.create(name: 'smash_criticism', reliability: 3, char_type: 'ian')
Ability.create(name: 'ruby_doo_call', reliability: 8, char_type: 'ian')

Ability.create(name: 'tell_good_joke', reliability: 15, char_type: 'j')
Ability.create(name: 'wouldnt_it_be_nice', reliability: 9, char_type: 'j')
Ability.create(name: 'keyboard_shortcuts', reliability: 12, char_type: 'j')

Ability.create(name: 'vim_attack', reliability: 8, char_type: 'tracy')
Ability.create(name: 'give_5_minute_warning', reliability: 5, char_type: 'tracy')
Ability.create(name: 'slack_attack', reliability: 10, char_type: 'tracy')

Ability.create(name: 'class_switcher', reliability: 1, char_type: 'antoin')

Ability.create(name: 'tell_bad_joke', reliability: 2, char_type: 'jj')
Ability.create(name: 'cut_hair', reliability: 15, char_type: 'jj')
