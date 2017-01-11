# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Ability.create(name: 'criticize_readme', damage: 10, char_type: 'student')
Ability.create(name: 'complete_lab', damage: 10, char_type: 'student')
Ability.create(name: 'give_presentation', damage: 10, char_type: 'student')
Ability.create(name: 'ask_nonsensical_question', damage: 10, char_type: 'student')
Ability.create(name: 'snap_fingers', damage: 10, char_type: 'student')

Ability.create(name: 'give_lecture', damage: 20, char_type: 'Ian')
Ability.create(name: 'make_intentional_mistake', damage: 20, char_type: 'Ian')
Ability.create(name: 'smash_criticism', damage: 20, char_type: 'Ian')
Ability.create(name: 'ruby_doo_call', damage: 20, char_type: 'Ian')

Ability.create(name: 'tell_good_joke', damage: 10, char_type: 'J')
Ability.create(name: 'wouldnt_it_be_nice', damage: 10, char_type: 'J')
Ability.create(name: 'keyboard_shortcuts', damage: 10, char_type: 'J')

Ability.create(name: 'vim_attack', damage: 15, char_type: 'Tracy')
Ability.create(name: 'give_5_minute_warning', damage: 15, char_type: 'Tracy')
Ability.create(name: 'slack_attack', damage: 15, char_type: 'Tracy')

Ability.create(name: 'class_switcher', damage: 15, char_type: 'Antoin')

Ability.create(name: 'tell_bad_joke', damage: 15, char_type: 'JJ')
Ability.create(name: 'cut_hair', damage: 15, char_type: 'JJ')
