tool
extends MeshInstance

func _ready():
#	var colorsstream = load("res://colors.png")
#	var colors = colorsstream.get_data()
#	colors.lock()
	
	var tr = load("res://tr.png")
	var new_img = Image.new()
	new_img.create(tr.get_width(),tr.get_height(),false,Image.FORMAT_RGBA8)
	new_img.lock()
	tr.lock()
	for i in range(tr.get_width()-2):
		for j in range(tr.get_height()-2):
			check_line(tr,i+1,j+1,new_img)
	tr.unlock()
	new_img.unlock()
	new_img.save_png("res://my_png.png")
	
	


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
	
