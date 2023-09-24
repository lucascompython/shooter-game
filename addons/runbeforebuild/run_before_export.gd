@tool
extends EditorExportPlugin

func _export_begin(_features: PackedStringArray, _is_debug: bool, _path: String, _flags: int) -> void:
	var cmds := Exports.get_cmds()
	var shell := Exports.get_shell()
	print("Executing '%s'..."  % cmds[1])
	if shell == "N/A":
		print("ERROR: Current operating system is not supported...")
		return
		
		
	var output := []
	var exit_code := OS.execute(shell, ["-c", "cd %s && %s" % [cmds[2], cmds[1]]], output)
	
	if output[0]: print("OUTPUT: ", output)
	
	if exit_code != 0:
		print("ERROR: Something went wrong when executing: '%s'" % cmds[1])	
	else:
		print("Successfully executed '%s'!" % cmds[1])


