require './test/sets/curriculumcontext'
require './test/sets/locationcontext'
require './test/sets/instructorcontext'
require './test/sets/campcontext'
require './test/sets/camp_instructor_context'

module Contexts
  include Contexts::CurriculumContext
  include Contexts::LocationContext
  include Contexts::InstructorContext
  include Contexts::CampContext
  include Contexts::CampInstructorContext
  def create_all_contexts
    create_curriculum
    create_location
    create_instructor
    create_camp
    create_camp_instructor
    
  end 
  
end