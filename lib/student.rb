require_relative "../config/environment.rb"

class Student
  
  attr_accessor :id, :name, :grade
  
  def initialize (name, grade, id = nil)
    @id = id
    @name = name
    @grade = grade
  end
  
  def self.create_table
    sql = "CREATE TABLE IF NOT EXISTS students (id INTEGER PRIMARY KEY, name TEXT, grade INTEGER)"
    DB[:conn].execute(sql)
  end

  def self.drop_table
    sql = "DROP TABLE IF EXISTS students"
    DB[:conn].execute(sql)
  end
  
  def self.create(name, grade)
    Student.new(name, grade)
    sql = "INSERT INTO students (name, grade) VALUES (?, ?)"
    
  end
  # Remember, you can access your database connection anywhere in this class
  #  with DB[:conn]


end
