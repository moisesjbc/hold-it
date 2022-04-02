extends Node

var player
var current_state


func _ready():
	player = get_parent()
	for child in get_children():
		child.connect('set_state', self, 'set_state')
	set_state('idle')

func set_state(new_state_name):
	if current_state and current_state.has_method('exit'):
		current_state.exit()

	current_state = get_node(new_state_name)
	current_state.player = player

	if current_state.has_method('init'):
		current_state.init()

func _physics_process(delta):
	if current_state.has_method('update'):
		current_state.update(delta)

func _input(event):
	if current_state.has_method('input'):
		current_state.input(event)
