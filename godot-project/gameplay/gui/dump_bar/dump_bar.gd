extends CenterContainer


func add_poop_damage(damage):
	print('add_poop_damage ', damage)
	$progress_bar.set_value($progress_bar.value + damage)
