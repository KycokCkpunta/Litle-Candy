
extends Sprite


func _ready():
	set_fixed_process(true)


func _fixed_process(delta):
	if get_pos().x < -128:
		set_pos(Vector2(384,72))
	set_pos(get_pos()-Vector2(10*delta*get_node("/root/global").SPEED,0))

