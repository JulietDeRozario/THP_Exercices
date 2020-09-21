# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Loading..."
#===> Reset the BDD
Appointment.destroy_all
Patient.destroy_all
Doctor.destroy_all
Speciality.destroy_all
City.destroy_all
puts "BDD updating..."

#===> Define the possible values for the specialities and the cities
specialities = ["gynécologue", "psychiatre", "psychologue", "kinésithérapeuthe", "ostéo", "sexologue", "éthiologue", "accuponcteur", "généraliste"]

10.times do #===> creation of the different cities
   City.create!(name: Faker::Address.city)
end

specialities.each {|speciality| Speciality.create!(name: speciality)} #===> creation of the different specialities

25.times do #====> creation of 25 patients and 25 doctors
    patient = Patient.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, city: City.all.sample)
    doctor = Doctor.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, zip_code: rand(00000..99999), city: City.all.sample)
    rand(1..3).times do #===> add specialities to each doctor (between 1 and 3)
       doctor.specialities << Speciality.where(name: specialities.sample)
    end   
end
puts "25 patients and doctors with their specialities created !"

#===> creation of 25 appointments
25.times do
 appointment = Appointment.create!(doctor: Doctor.all.sample, patient: Patient.all.sample, date: Faker::Date.between(from: '2020-07-29', to: '2020-12-25'))
 appointment.city = City.all.sample
 appointment.save
end
puts "25 appointments created !"
puts "______________________________________________________________________________"
puts "If you want to see our BDD tables, use 'tp MyModel.all' in the rails console."
puts "-Models used in this app: Patient, Doctor, Appointment, Speciality, City, JoinTableDoctorSpeciality"
puts "______________________________________________________________________________"