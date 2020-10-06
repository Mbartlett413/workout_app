# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(email: 'Tester@Test.com', password: 'password')

Exercise.create(title: 'Squat', primary_exercise: true, accesory_exercise: false)
Exercise.create(title: 'Dead Lift', primary_exercise: true, accesory_exercise: false)
Exercise.create(title: 'Bench Press', primary_exercise: true, accesory_exercise: false)
Exercise.create(title: 'Military Press', primary_exercise: true, accesory_exercise: false)
Exercise.create(title: 'Leg Press', primary_exercise: false, accesory_exercise: true)
Exercise.create(title: 'Leg Curl', primary_exercise: false, accesory_exercise: true)
Exercise.create(title: 'Leg Extension', primary_exercise: false, accesory_exercise: true)
Exercise.create(title: 'Good Mornings', primary_exercise: false, accesory_exercise: true)
Exercise.create(title: 'DB Press', primary_exercise: false, accesory_exercise: true)
Exercise.create(title: 'Incline Bench', primary_exercise: false, accesory_exercise: true)
Exercise.create(title: 'DB Incline Press', primary_exercise: false, accesory_exercise: true)
Exercise.create(title: 'Tricep Extension', primary_exercise: false, accesory_exercise: true)
Exercise.create(title: 'Curls', primary_exercise: false, accesory_exercise: true)
Exercise.create(title: 'Lateral Raises', primary_exercise: false, accesory_exercise: true)
Exercise.create(title: 'Forward Raises', primary_exercise: false, accesory_exercise: true)


set1 = SetRep.create(title: "3x5")
set2 = SetRep.create(title: "3x3")
set3 = SetRep.create(title: "531")
SetRepCombo.create(percent: '65', reps: '5', set_rep_id: set1.id, set_rep: set1)
SetRepCombo.create(percent: '75', reps: '5', set_rep_id: set1.id, set_rep: set1)
SetRepCombo.create(percent: '85', reps: '5', set_rep_id: set1.id, set_rep: set1)
SetRepCombo.create(percent: '70', reps: '3', set_rep_id: set2.id, set_rep: set2)
SetRepCombo.create(percent: '80', reps: '3', set_rep_id: set2.id, set_rep: set2)
SetRepCombo.create(percent: '90', reps: '3', set_rep_id: set2.id, set_rep: set2)
SetRepCombo.create(percent: '75', reps: '5', set_rep_id: set3.id, set_rep: set3)
SetRepCombo.create(percent: '85', reps: '3', set_rep_id: set3.id, set_rep: set3)
SetRepCombo.create(percent: '95', reps: '1', set_rep_id: set3.id, set_rep: set3)
