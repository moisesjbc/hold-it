extends CenterContainer

signal dump_bar_full

func add_poop_damage(damage):
	$progress_bar.set_value($progress_bar.value + damage)


func _on_progress_bar_value_changed(value):
	if value >= 100:
		emit_signal('dump_bar_full')
