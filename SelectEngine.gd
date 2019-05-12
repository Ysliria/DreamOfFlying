extends CanvasLayer

var cur_pos = 0
var nxt_pos = 0
var max_pos = 0
var lst = []

signal selected_item(value)

func _ready():
	lst = $BackgroundEcranSelection.get_children()
	
	for i in range(1, lst.size() ):
		lst[i].modulate.a = 0.3
	max_pos = lst.size() - 1


func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		on_valid_menu()
		
	if Input.is_action_just_pressed("ui_right"):
		nxt_pos += 1
	if Input.is_action_just_pressed("ui_left"):
		nxt_pos -= 1
		
	nxt_pos = clamp(nxt_pos, 0, max_pos)
	
	if cur_pos != nxt_pos :
		cur_pos = nxt_pos
		change_pos(nxt_pos)
	
func change_pos(new_pos):
	print("New pos : ", new_pos)
	for i in range ( lst.size() ):
		if i == new_pos :
			lst[i].modulate.a = 1
		else :
			lst[i].modulate.a = 0.3
			
func on_valid_menu():
	match cur_pos:
		0:
			GameSingleton.machineChoice = "aile"
			get_tree().change_scene("res://Main.tscn")
		1:
			GameSingleton.machineChoice = "vis"
			get_tree().change_scene("res://Main.tscn")
		
	queue_free()
