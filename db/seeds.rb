Assignment.destroy_all
Task.destroy_all
Project.destroy_all
User.where(admin: false).destroy_all
# -----------------------
# Create Students
# -----------------------

student1 = User.create!(
  email: "student1@gmail.com",
  password: "password123",
  admin: false
)

student2 = User.create!(
  email: "student2@gmail.com",
  password: "password123",
  admin: false
)

student3 = User.create!(
  email: "student3@gmail.com",
  password: "password123",
  admin: false
)

student4 = User.create!(
  email: "student4@gmail.com",
  password: "password123",
  admin: false
)

# -----------------------
# Create Projects (owned by admin)
# -----------------------

admin = User.find_by(admin: true)

project1 = Project.create!(
  title: "Library Management System",
  description: "Build a system to manage books and users",
  user_id: admin.id
)

project2 = Project.create!(
  title: "E-Commerce Website",
  description: "Online shopping platform",
  user_id: admin.id
)

# -----------------------
# Create Tasks
# -----------------------

Task.create!(
  title: "Create Models",
  task_description: "Generate necessary models",
  project_id: project1.id,
)

Task.create!(
  title: "Design UI",
  task_description: "Create frontend pages",
  project_id: project1.id,
)

Task.create!(
  title: "Payment Integration",
  task_description: "Integrate payment gateway",
  project_id: project2.id,
)

# -----------------------
# Create Assignments
# -----------------------

Assignment.create!(
  user_id: student1.id,
  project_id: project1.id
)

Assignment.create!(
  user_id: student2.id,
  project_id: project2.id
)

puts "Seed data created successfully ✅"