require './test/sets/curriculumcontext'
require './test/sets/locationcontext'
require './test/sets/instructorcontext'
require './test/sets/campcontext'

module Contexts
  include Contexts::CurriculumContext
  include Contexts::LocationContext
  include Contexts::InstructorContext
  include Contexts::CampContext
  def create_all_contexts
    create_curriculum
    create_location
    create_instructor
    create_camp
  end 
  
end