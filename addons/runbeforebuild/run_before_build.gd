@tool
extends EditorPlugin

var EXPORT_PLUGIN := preload("res://addons/runbeforebuild/run_before_export.gd").new()


func _enter_tree() -> void:
	add_export_plugin(EXPORT_PLUGIN)
	
	
func _build() -> bool:
	var cmds := Exports.get_cmds()
	var shell := Exports.get_shell()
	
	print("Executing '%s'..."  % cmds[0])
	
	if shell == "N/A":
		print("ERROR: Current operating system is not supported...")
		return false
		
		
	var output := []
	var exit_code := OS.execute(shell, ["-c", "cd %s && %s" % [cmds[2], cmds[0]]], output)
	
	if output[0]: print("OUTPUT: ", output)
	
	if exit_code == 0:
		print("Successfully executed '%s'!" % cmds[0])
		return true
	print("ERROR: Something went wrong when executing: '%s'" % cmds[0])	
	return false



func _exit_tree() -> void:
	remove_export_plugin(EXPORT_PLUGIN)
	
