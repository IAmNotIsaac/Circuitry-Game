class_name DevTools
extends Node


static func new_class(class_name_ : String, init_args := []) -> Object:
	for class_ in ProjectSettings.get_setting("_global_script_classes"):
		if class_["class"] == class_name_:
			var new_class = load(class_["path"])
			
			return new_class.new()
	
	return null


static func copy_class(old_copy : Object) -> Object:
	var new_copy := new_class(old_copy.get_class())
	
	for property in new_copy.get_property_list():
		if property["usage"] == PROPERTY_USAGE_SCRIPT_VARIABLE:
			new_copy[property["name"]] = old_copy[property["name"]]
	
	return new_copy
