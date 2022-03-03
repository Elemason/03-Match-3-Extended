extends Node2D

var score_threshold = 5
var b = 0
var backgrounds = [
	preload("res://assets/background2.jpg")
	,preload("res://assets/background3.jpg")
	,preload("res://assets/background.jpg")
]

var tran = false
var t_value = 0.0
var t_step = 0.01


func _physics_process(_delta):
	if tran:
		t_value += t_step
		#$Background.get_material().set_shader_param("burn_position", t_value)
		$Background.modulate.a = 1.0 - t_value
		if t_value >= 1:
			$Background.texture = backgrounds[wrapi(b, 0, backgrounds.size())]
			$Background.modulate.a = 1.0
			#$Background.get_material().set_shader_param("burn_position", 0.0)
			$B2.queue_free()
			b += 1
			t_value = 0.0
			tran = false
	elif Global.score > score_threshold*(b+1):
		var B2 = Sprite.new()
		B2.centered = false
		B2.texture = backgrounds[wrapi(b, 0, backgrounds.size())]	# backgrounds[b % backgrounds.size()]
		B2.name = "B2"
		add_child(B2)
		move_child(B2, 0)
		tran = true
