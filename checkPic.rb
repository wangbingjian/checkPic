def checkFile(source, object)
	return if !File.directory?(source) or !File.directory?(object)
	dirS = Dir.open(source)
	dirO = Dir.open(object)
	while nameS = dirS.read
		has = false
		next if nameS == "."
		next if nameS == ".."
		while nameO = dirO.read
			next if nameO == "."
			next if nameO == ".."
			if nameO == nameS
				checkFile(source + "/" + nameS, object + "/" + nameO)
				has = true
				break
			end
		end
		dirO.close
		dirO = Dir.open(object)
		if !has and File.directory?(source + "/" + nameS)
			p nameS
		end
	end
	dirO.close
	dirS.close
end

checkFile(ARGV[0], ARGV[1])
