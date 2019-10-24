require_relative "../config/environment.rb"

class Student
  
  attr_accessor :id, :name, :grade
  
  def initialize (id, name, grade)
    @id = id
    @name = name
    @grade = grade
  end
  
  def self.create_table
    sql = "CREATE TABLE students (id PRIMARY KEY INTEGER, name TEXT, grade INTEGER"
  
  end


  # Remember, you can access your database connection anywhere in this class
  #  with DB[:conn]


end
