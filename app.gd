extends CustomComponent

class_name App

func _init():
	super("app")
	state = {
		items=[
			{key="1", value="uno"},
			{key="2", value="dos"},
			{key="3", value="tres"},
		]
	}

func items():
	var _items = []
	for item in state.items:
		_items.append(Goo.button({key=item.key, preset=item.value, text=item.value,
			on_pressed=func():print("key " + item.key)}))
	return _items

func change():
	state.items.append({key="4", value="cuatro"})
	update_gui()

func gui():
	return\
	Goo.control({preset="full"},[
		Goo.center({preset="full"},[
			Goo.vbox({preset="fill"},[
				Goo.vbox({preset="fill", list=true, d=state.hash()},
					items()
				),
				Goo.button({text="Change", on_pressed=change})
			])
		])
	])
