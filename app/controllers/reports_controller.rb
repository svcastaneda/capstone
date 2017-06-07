class ReportsController < ApplicationController
  def index
    @reports = Param.find(Report.where(student: current_student).map(&:params_id))
  end
  
  def new
    @student = params[:id] ? Student.find(params[:id]) : current_user.student
    @report = Report.new
    @params = Param.new
  end
  
  def create
    @params = Param.new(form_params)
    @params.degree_id = student_params[:degree_id]
    @params.location = 3
    
    if @params.save
      @classes = shortest_path
      @classes.flatten.each do |c|
        Report.create(params_id: @params.id, student: current_student, course: Course.find_by(num: c))
      end
      # @student.update_attributes(id: @user.id) if @user.student?
      # session[:user_id] = @user.id
      if current_user.student?
        redirect_to show_report_path(@params.id)
      else
        redirect_to student_report(current_student, @params.id)
      end
    else
      render template: 'users/new'
    end
  end
  
  def show
    @params = Param.find(params[:id])
    @classes = shortest_path.reject(&:blank?)
  end
  
  def destroy
    Param.find(params[:id]).destroy
    flash[:success] = "Report deleted"
    redirect_to root_path
  end
  
  private
  def form_params
    params.require(:param).permit(:courses_per_quarter, :class_type)
  end
  
  def student_params
    params.require(:student).permit(:degree_id)
  end
  
  def shortest_path
    s = params[:student_id] ? Student.find(params[:id]) : current_user.student
    # s = Student.last
    finalArr = Array.new
    takenClasses = s.courses

    fallCourses = Course.find_by_sql('SELECT * FROM "courses" WHERE (times && ARRAY[1,2,3,4,5,6])')
    winterCourses = Course.find_by_sql("SELECT * FROM Courses WHERE times && ARRAY[7,8,9,10,11,12]")
    springCourses = Course.find_by_sql("SELECT * FROM Courses WHERE times && ARRAY[13,14,15,16,17,18]")
    summer1Courses = Course.find_by_sql("SELECT * FROM Courses WHERE times && ARRAY[19,20,21,22,23,24]")
    summer2Courses = Course.find_by_sql("SELECT * FROM Courses WHERE times && ARRAY[25,26,27,28,29,30]")
    summerFullCourses = Course.find_by_sql("SELECT * FROM Courses WHERE times && ARRAY[31,32,33,34,35,36]")
    
    intro = Course.where(num: DegreeReq.find_by_sql('SELECT course_num FROM Degree_Reqs WHERE Degree_Reqs.class_type = 1').map {|c| c.course_num})
    foundation = Course.where(num: DegreeReq.find_by_sql('SELECT course_num FROM Degree_Reqs WHERE Degree_Reqs.class_type = 2').map {|c| c.course_num})
    advanced = Course.where(num: DegreeReq.find_by_sql('SELECT course_num FROM Degree_Reqs WHERE Degree_Reqs.class_type = 3').map {|c| c.course_num})
    majorElective = Course.where(num: DegreeReq.find_by_sql('SELECT course_num FROM Degree_Reqs WHERE Degree_Reqs.class_type = 4').map {|c| c.course_num})
    openElective = Course.where(num: DegreeReq.find_by_sql('SELECT course_num FROM Degree_Reqs WHERE Degree_Reqs.class_type = 5').map {|c| c.course_num})
    capstone = Course.where(num: DegreeReq.find_by_sql('SELECT course_num FROM Degree_Reqs WHERE Degree_Reqs.class_type = 6').map {|c| c.course_num})



    #removes courses already taken from the class arrays
    takenClasses.each do |i|
    	fallCourses.each do |x|
        if i == x
        	fallCourses.delete(x)
        end
    	end
    end

    takenClasses.each do |i|
    	winterCourses.each do |x|
      	if i == x
      		winterCourses.delete(x)
    		end
    	end
    end

    takenClasses.each do |i|
    	springCourses.each do |x|
      	if i == x
      		springCourses.delete(x)
    		end
    	end
    end

    takenClasses.each do |i|
    	summer1Courses.each do |x|
      	if i == x
      		summer1Courses.delete(x)
    		end
    	end
    end

    takenClasses.each do |i|
    	summer2Courses.each do |x|
      	if i == x
      		summer2Courses.delete(x)
    		end
    	end
    end

    takenClasses.each do |i|
    	summerFullCourses.each do |x|
      	if i == x
      		summerFullCourses.delete(x)
    		end
    	end
    end

    #counter represents the current quarter to build the final array from
    counter = 6
    coursesPerQuarter = Param.last.courses_per_quarter #params[:courses_per_quarter]
    d = s.degree
    coursesTotal = d.num_intro + d.num_foundation + d.num_advanced + d.num_major_electives + d.num_open_electives - s.courses.count
    finalArrCheck = Array.new
    #builds the final array
    while coursesTotal > 0 do
    	#counter that keeps track of how many courses can be added that quarter
    	coursesPerQuarterHold = coursesPerQuarter
	
    	if counter == 6
      	fallCoursesHold = Array.new
      	#removes any course already in the final array
      	finalArrCheck.each do |i|
      		fallCourses.each do |x|
        		if i == x
        			fallCourses.delete(x)
      			end
      		end
      	end
      	#adds courses to the final array priortizing intro, foundation, advanced, elective in that order. adds course to the final array then deletes it from the quarter classes array
        while coursesPerQuarterHold > 0 do
        	fallCourses.each do |i|
        	# only adds the course if there is still any room them this quarter
        		if intro.include?(i) && coursesPerQuarterHold != 0
        			finalArrCheck.push(i)
        			fallCoursesHold.push(i)
        			fallCourses.delete(i)
        			coursesPerQuarterHold -= 1
        			coursesTotal -= 1
        		end
        	end
        	fallCourses.each do |i|
        		if foundation.include?(i) && coursesPerQuarterHold != 0
        			finalArrCheck.push(i)
        			fallCoursesHold.push(i)
        			fallCourses.delete(i)
        			coursesPerQuarterHold -= 1
        			coursesTotal -= 1
        		end
        	end
        	fallCourses.each do |i|
        		if (openElective.include?(i) || majorElective.include?(i)) && coursesPerQuarterHold != 0
        			finalArrCheck.push(i)
        			fallCoursesHold.push(i)
        			fallCourses.delete(i)
        			coursesPerQuarterHold -= 1
        			coursesTotal -= 1
      			end
      		end
        	fallCourses.each do |i|
        		if advanced.include?(i) && coursesPerQuarterHold != 0
        			finalArrCheck.push(i)
        			fallCoursesHold.push(i)
        			fallCourses.delete(i)
        			coursesPerQuarterHold -= 1
        			coursesTotal -= 1
        		end	
        	end
          finalArr.push(fallCoursesHold)
      		coursesPerQuarterHold -= 1
        end
    	#checks winter
    	elsif counter == 5
      	wintercoursehold = Array.new
      	finalArrCheck.each do |i|
      		winterCourses.each do |x|
        		if i == x
        			winterCourses.delete(x)
      			end
      		end
      	end
      	while coursesPerQuarterHold > 0 do
        	winterCourses.each do |i|
        		if intro.include?(i) && coursesPerQuarterHold != 0
        			wintercoursehold.push(i)
        			finalArrCheck.push(i)
        			winterCourses.delete(i)
        			coursesPerQuarterHold -= 1
        			coursesTotal -= 1
        		end
        	end
        	winterCourses.each do |i|
        		if foundation.include?(i) && coursesPerQuarterHold != 0
        			wintercoursehold.push(i)
        			finalArrCheck.push(i)
        			winterCourses.delete(i)
        			coursesPerQuarterHold -= 1
        			coursesTotal -= 1
        		end
        	end
        	winterCourses.each do |i|
        		if (openElective.include?(i) || majorElective.include?(i)) && coursesPerQuarterHold != 0
        			wintercoursehold.push(i)
        			finalArrCheck.push(i)
        			winterCourses.delete(i)
        			coursesPerQuarterHold -= 1
        			coursesTotal -= 1
      			end
      		end
        	winterCourses.each do |i|
        		if advanced.include?(i) && coursesPerQuarterHold != 0
        			wintercoursehold.push(i)
        			finalArrCheck.push(i)
        			winterCourses.delete(i)
        			coursesPerQuarterHold -= 1
        			coursesTotal -= 1
      			end
      		end
      		finalArr.push(wintercoursehold)
      		coursesPerQuarterHold -= 1
      	end
    	#checks spring
    	elsif counter == 4
      	springCoursesHold = Array.new
      	finalArrCheck.each do |i|
      		springCourses.each do |x|
        		if i == x
        			springCourses.delete(x)
      			end
      		end
      	end
      	while coursesPerQuarterHold > 0 do
        	springCourses.each do |i|
        		if intro.include?(i) && coursesPerQuarterHold != 0
        			finalArrCheck.push(i)
        			springCoursesHold.push(i)
        			springCourses.delete(i)
        			coursesPerQuarterHold -= 1
        			coursesTotal -= 1
        		end
        	end
        	springCourses.each do |i|
        		if foundation.include?(i) && coursesPerQuarterHold != 0
        			finalArrCheck.push(i)
        			springCoursesHold.push(i)
        			springCourses.delete(i)
        			coursesPerQuarterHold -= 1
        			coursesTotal -= 1
        		end
        	end
        	springCourses.each do |i|
        		if (openElective.include?(i) || majorElective.include?(i)) && coursesPerQuarterHold != 0
        			finalArrCheck.push(i)
        			springCoursesHold.push(i)
        			springCourses.delete(i)
        			coursesPerQuarterHold -= 1
        			coursesTotal -= 1
      			end
      		end
        	springCourses.each do |i|
        		if advanced.include?(i) && coursesPerQuarterHold != 0
        			finalArrCheck.push(i)
        			springCoursesHold.push(i)
        			springCourses.delete(i)
        			coursesPerQuarterHold -= 1
        			coursesTotal -= 1
      			end
      		end
      		finalArr.push(springCoursesHold)
      		coursesPerQuarterHold -= 1
      	end
    	#checking summer1
    	elsif counter == 3
      	summer1CoursesHold= Array.new
      	finalArrCheck.each do |i|
      		summer1Courses.each do |x|
        		if i == x
        			summer1Courses.delete(x)
      			end
      		end
      	end
      	while coursesPerQuarterHold > 0 do
        	summer1Courses.each do |i|
        		if intro.include?(i) && coursesPerQuarterHold != 0
        			finalArrCheck.push(i)
        			summer1CoursesHold.push(i)
        			summer1Courses.delete(i)
        			coursesPerQuarterHold -= 1
        			coursesTotal -= 1
        		end
        	end
        	summer1Courses.each do |i|
        		if foundation.include?(i) && coursesPerQuarterHold != 0
        			finalArrCheck.push(i)
        			summer1CoursesHold.push(i)
        			summer1Courses.delete(i)
        			coursesPerQuarterHold -= 1
        			coursesTotal -= 1
        		end
        	end
        	summer1Courses.each do |i|
        		if (openElective.include?(i) || majorElective.include?(i)) && coursesPerQuarterHold != 0
        			finalArrCheck.push(i)
        			summer1CoursesHold.push(i)
        			summer1Courses.delete(i)
        			coursesPerQuarterHold -= 1
        			coursesTotal -= 1
      			end
      		end
        	summer1Courses.each do |i|
        		if advanced.include?(i) && coursesPerQuarterHold != 0
        			finalArrCheck.push(i)
        			summer1CoursesHold.push(i)
        			summer1Courses.delete(i)
        			coursesPerQuarterHold -= 1
        			coursesTotal -= 1
      			end
        	end
          finalArr.push(summer1CoursesHold)
      		coursesPerQuarterHold -= 1
        end
    	#checks summer2
    	elsif counter == 2
      	summer2CoursesHold = Array.new
      	finalArrCheck.each do |i|
      		summer2Courses.each do |x|
        		if i == x
        			summer2Courses.delete(x)
      			end
      		end
      	end
      	while coursesPerQuarterHold > 0 do
        	summer2Courses.each do |i|
        		if intro.include?(i) && coursesPerQuarterHold != 0
        			finalArrCheck.push(i)
        			summer2CoursesHold.push(i)
        			summer2Courses.delete(i)
        			coursesPerQuarterHold -= 1
        			coursesTotal -= 1
        		end
        	end
        	summer2Courses.each do |i|
        		if foundation.include?(i) && coursesPerQuarterHold != 0
        			finalArrCheck.push(i)
        			summer2CoursesHold.push(i)
        			summer2Courses.delete(i)
        			coursesPerQuarterHold -= 1
        			coursesTotal -= 1
        		end
        	end
        	summer2Courses.each do |i|
        		if (openElective.include?(i) || majorElective.include?(i)) && coursesPerQuarterHold != 0
        			finalArrCheck.push(i)
        			summer2CoursesHold.push(i)
        			summer2Courses.delete(i)
        			coursesPerQuarterHold -= 1
        			coursesTotal -= 1
      			end
      		end
        	summer2Courses.each do |i|
        		if advanced.include?(i) && coursesPerQuarterHold != 0
        			finalArrCheck.push(i)
        			summer2CoursesHold.push(i)
        			summer2Courses.delete(i)
        			coursesPerQuarterHold -= 1
        			coursesTotal -= 1
        		end
        	end
          finalArr.push(summer2CoursesHold)
      		coursesPerQuarterHold -= 1
        end
    	#checks summerfull
    	elsif counter == 1
      	summerFullCoursesHold = Array.new
      	finalArrCheck.each do |i|
      		summerFullCourses.each do |x|
        		if i == x
        			summerFullCourses.delete(x)
      			end
      		end
      	end
      	while coursesPerQuarterHold > 0 do
        	summerFullCourses.each do |i|
        		if intro.include?(i) && coursesPerQuarterHold != 0
        			finalArrCheck.push(i)
        			summerFullCoursesHold.push(i)
        			summerFullCourses.delete(i)
        			coursesPerQuarterHold -= 1
        			coursesTotal -= 1
        		end
        	end
        	summerFullCourses.each do |i|
        		if foundation.include?(i) && coursesPerQuarterHold != 0
        			finalArrCheck.push(i)
        			summerFullCoursesHold.push(i)
        			summerFullCourses.delete(i)
        			coursesPerQuarterHold -= 1
        			coursesTotal -= 1
        		end
        	end
        	summerFullCourses.each do |i|
        		if (openElective.include?(i) || majorElective.include?(i)) && coursesPerQuarterHold != 0
        			finalArrCheck.push(i)
        			summerFullCoursesHold.push(i)
        			summerFullCourses.delete(i)
        			coursesPerQuarterHold -= 1
        			coursesTotal -= 1
        		end
          end
        	summerFullCourses.each do |i|
        		if advanced.include?(i) && coursesPerQuarterHold != 0
        			finalArrCheck.push(i)
        			summerFullCoursesHold.push(i)
        			summerFullCourses.delete(i)
        			coursesPerQuarterHold -= 1
        			coursesTotal -= 1
        		end
        	end
          finalArr.push(summerFullCoursesHold)
        	coursesPerQuarterHold -= 1
        end
    	#resets the counter if it hits zero
    	elsif counter == 0
    		counter = 7
    	end
    	#decrements counter so the while loop moves on to the next session
    	counter -= 1
    end
    
    finalArr
  end
end