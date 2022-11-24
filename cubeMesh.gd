tool
extends MeshInstance

func _ready():
	pass
#	var colorsstream = load("res://colors.png")
#	var colors = colorsstream.get_data()
#	colors.lock()
	
#	var new_img = Image.new()
#	new_img.create(10,10,false,Image.FORMAT_RGBA8)
#	new_img.lock()
#	for i in range(10):
#		for j in range(10):
#			new_img.set_pixel(i,j,Color(float(i)/10.0,float(j)/10.0,0))
#	new_img.unlock()
#	new_img.save_png("res://my_png.png")
	
	


func check_line(img, x, y, line_img):
	var clr0 = img.get_pixel(x,y)
	var clrs = [
		[img.get_pixel(x+1,y),x+1,y],
		[img.get_pixel(x-1,y),x-1,y],
		[img.get_pixel(x+1,y+1),x+1,y+1],
		[img.get_pixel(x+1,y-1),x+1,y-1],
		[img.get_pixel(x-1,y+1),x-1,y+1],
		[img.get_pixel(x-1,y-1),x-1,y-1],
		[img.get_pixel(x,y+1),x,y+1],
		[img.get_pixel(x,y-1),x,y-1],
	]
	for clr in clrs:
		if(clr[0]!=clr0):
			line_img.set_pixel(clr[1],clr[2],Color(0,0,0))
	
