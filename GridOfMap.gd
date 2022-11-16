extends GridMap

func array_unique(array: Array) -> Array:
	var unique: Array = []
	for item in array:
		if not unique.has(item):
			unique.append(item)
	return unique

func choose_a_circle(pos, radius):
	var cells = get_used_cells()
	var final_array = []
	for i in range(radius):
		for j in range(radius):
			if(sqrt(i*i+j*j)<=radius-1):
				var nums = [cells.find(Vector3(i+pos.x,0,j+pos.z)),cells.find(Vector3(-i+pos.x,0,j+pos.z)),cells.find(Vector3(i+pos.x,0,-j+pos.z)),cells.find(Vector3(-i+pos.x,0,-j+pos.z))]
				while nums.find(-1)>-1:
					nums.erase(-1)
				final_array.append_array(nums)
			else:
				break
	return array_unique(final_array)




func _ready():
	for i in choose_a_circle(Vector3(0,0,0),5):
		var pos = get_used_cells()[i]
		set_cell_item(pos.x,pos.y,pos.z,1)
	
