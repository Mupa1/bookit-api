# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
p "Creating Doctors..."
docs = [
  {
    name: "Samwel King, M.D.",
    image: "https://www.pngfind.com/pngs/m/375-3750858_mdico-png-free-doctor-thumbs-up-transparent-png.png",
    speciality: "Obstetrician and Gynecologist",
    location: "Heidelberg, Baden-Württemberg",
  },
  {
    name: "Brittany P. Adell, M.D.",
    image: "https://www.pngfind.com/pngs/m/53-531148_black-doctor-png-black-medical-doctor-png-transparent.png",
    speciality: "Dermatologist",
    location: "Heidelberg, Baden-Württemberg",
  },
  {
    name: "Chung Yung, M.D.",
    image: "https://www.pngfind.com/pngs/m/210-2100238_doctors-and-nurses-png-background-image-physician-transparent.png",
    speciality: "Oncologist",
    location: "Heidelberg, Baden-Württemberg",
  },
  {
    name: "Henry S. Maclein, M.D.",
    image: "https://www.pngfind.com/pngs/m/53-530843_doctor-png-clipart-doctor-isolated-transparent-png.png",
    speciality: "Pediatrician",
    location: "Heidelberg, Baden-Württemberg",
  },
  {
    name: "Adam Daniel, Ph.D.",
    image: "https://www.pngfind.com/pngs/m/617-6170602_make-an-appointment-doctors-and-nurses-hd-png.png",
    speciality: "Medical Geneticist",
    location: "Heidelberg, Baden-Württemberg",
  },
  {
    name: "Anita Bridgit, M.B.B.S., M.P.H.",
    image: "https://www.pngfind.com/pngs/m/1-19572_nurse-png-picture-kisspng-nurse-cough-transparent-png.png",
    speciality: "Rheumatologist",
    location: "Heidelberg, Baden-Württemberg",
  },
  {
    name: "Lena Patricia, M.B.B.S., M.D.",
    image: "https://www.pngfind.com/pngs/m/5-59339_years-in-business-nurse-png-transparent-png.png",
    speciality: "Hematologist Oncologist",
    location: "Heidelberg, Baden-Württemberg",
  },
  {
    name: "Sofia Andrea, M.D.",
    image: "https://www.pngfind.com/pngs/m/265-2654678_mujer-sonriendo-png-girl-transparent-png.png",
    speciality: "Psychiatrist",
    location: "Heidelberg, Baden-Württemberg",
  }
]

docs.map { |d|
  Doctor.create!(name: d[:name], image: d[:image], speciality: d[:speciality], location: d[:location])
}
User.create!(email: "mupa@test.com", password: "password")
