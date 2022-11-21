tool
extends MeshInstance

func _ready():
	var colorsstream = load("res://colors.png")
	var colors = colorsstream.get_data()
	colors.lock()
	print(colors.get_pixel(9,9))
