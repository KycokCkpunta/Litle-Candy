
extends StaticBody2D

func _ready():
	set_fixed_process(true)


func _fixed_process(delta):
	set_constant_linear_velocity(Vector2(-75*get_node("/root/global").SPEED,0))
	if get_pos().x < -128:
		set_pos(Vector2(384,144))
	set_pos(get_pos()-Vector2(100*delta*get_node("/root/global").SPEED,0))


