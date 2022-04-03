extends Button

var press_button_sound


func _ready():
	press_button_sound = get_tree().get_root().get_node("press_button_sound")


func _on_button_pressed():
	press_button_sound.play()
