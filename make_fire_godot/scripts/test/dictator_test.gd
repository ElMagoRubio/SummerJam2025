extends RefCounted
class_name DictatorTest

func load_items_from_json() -> Array:
	
	# Data from JSON
	var file = FileAccess.open(GlobalConstants.LEVEL_1_MOD_1_MIDIJSON_PATH, FileAccess.READ)
	var content = file.get_as_text()
	var data = JSON.parse_string(content)
	
	# Null check
	if data == null:
		push_error("Error in ItemRepository: Invalid items list JSON")
		return []
	
	# Items from dictionary loop
	var items: Array = []
	for item_dict in data["items"]:
		var item = _populate_item(item_dict)
		items.append(item)
	
	# Effect Function binding
	# _bind_effect_function(items)
	
	return items
