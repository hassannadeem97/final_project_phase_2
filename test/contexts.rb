require './test/sets/curriculumcontext'
require './test/sets/locationcontext'
require './test/sets/instructorcontext'

module Contexts
  include Contexts::CurriculumContext
  include Contexts::LocationContext
  include Contexts::InstructorContext
  def create_all_contexts
    create_curriculum
    create_location
    create_instructor
  end 
  
end