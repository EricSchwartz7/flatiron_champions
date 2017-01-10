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
