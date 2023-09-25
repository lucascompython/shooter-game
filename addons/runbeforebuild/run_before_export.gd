@tool
extends EditorExportPlugin

func _export_begin(_features: PackedStringArray, is_debug: bool, _path: String, _flags: int) -> void:
	var cmds := Exports.get_cmds()
	var shell := Exports.get_shell()
	var cmd := cmds[!is_debug as int]
	
	print("Executing '%s'..."  % cmd)
	if shell == "N/A":
		print("ERROR: Current operating system is not supported...")
		return
	
	var output := []
	var exit_code := OS.execute(shell, ["-c", "cd %s && %s" % [cmds[2], cmd]], output)
	
	if output[0]: print("OUTPUT: ", output)
	
	if exit_code != 0:
		print("ERROR: Something went wrong when executing: '%s'" % cmd)	
	else:
		print("Successfully executed '%s'!" % cmd)


func _get_name() -> String: # get rid of error
	return "RunBeforeExport"
