

local function print_table(tab, cur_depth, max_depth)
	if cur_depth>max_depth then return tostring(tab)..",\n" end

	local result = ""
	local base_space = "   "
	local space_str  = cur_depth<=1 and "" or string.rep(base_space,cur_depth-1)
	local space_str2 = space_str..base_space

	result = ((cur_depth>1) and "\n" or "")..space_str.."{\n"
	for k, v in pairs(tab) do
		result = result..space_str2.."["..tostring(k).."] = "
		if type(v)=="table" then
			result= result..print_table(v, cur_depth+1, max_depth)
		else
			result = result..tostring(v)..",\n"
		end

	end
	result = result..space_str..(cur_depth>1 and "},\n" or "}\n")

	return result
end


function Print(var, dept)

	if type(var)=="table" then
		local max_depth = tonumber(dept) or 5
		local str = print_table(var, 1, max_depth)
		print(str)
	else
		print(var)
	end
end

s = {{1,{2,{3,{4,{5,{6,{7,{8,{9,{10}}}}}}}}}},{3,4},"dsa", ["ds"]=33}
Print(s)

