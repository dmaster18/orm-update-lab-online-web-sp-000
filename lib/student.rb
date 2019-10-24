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
  
  def save 
    sql = "INSERT INTO songs (name, grade) VALUES (?, ?)"
    DB[:conn].execute(sql, self.name, self.grade)
    @id = DB[:conn].execute("SELECT last_insert_rowid() FROM songs")[0][0]
  end
  
  def self.create(name, grade)
    student = Student.new(name, grade)
    student.save
    student
  end
  # Remember, you can access your database connection anywhere in this class
  #  with DB[:conn]


end
