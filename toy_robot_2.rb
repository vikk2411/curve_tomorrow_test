###### Toy robot for [5,5] table
# SET INITIAL  VARIABLES VALUE
comm = nil
faces=["NORTH","WEST","SOUTH","EAST"]

# SET THE POSITION
def place_robot(pos)
	pos = pos.split(",")
	if !(pos[0].to_i < 0 || pos[0].to_i > 5 || pos[1].to_i < 0 || pos[1].to_i > 5 )
		x= pos[0].to_i
		y= pos[1].to_i
		face= pos[2]
	else
		p "Preventing the robot from falling"
	end	
	return x,y,face
end

# MOVE 1 STEP
def move_robot(x,y,face)
	if face == "NORTH" && y < 5
		y += 1
	elsif face == "EAST" && x < 5 	 
		x += 1
	elsif face == "SOUTH" && y > 0 
		y -= 1
	elsif face == "WEST" && x > 0
		x -= 1
	else 
		puts "Preventing the robot from falling"					
	end
	return x,y
end

# KEEP ON TAKING COMMANDS UNLESS 'REPORT' IS GIVEN
while comm != "REPORT"
	comm, pos = gets.chomp.split(" ")
	if comm == "PLACE"	
		x,y,face = place_robot(pos)
	elsif comm == "LEFT"
		temp = face == "EAST" ? 0 : faces.index(face)+1
		face = faces[temp]
	elsif comm == "RIGHT"
		face = faces[faces.index(face)-1]
	elsif comm == "MOVE"
		x,y = move_robot(x,y,face)
	elsif comm=="REPORT"
		puts "#{x},#{y} #{face}"										
	end
end
