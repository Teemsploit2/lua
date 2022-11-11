-- Brainfuck compiler

function brainfuck(src)
    src = src:gsub("%s+","")
    local char_map = {
        [">"] = "i = i+1;";
        ["<"] = "i = i-1;";
        ["+"] = "t[i] = t[i]+1;";
        ["-"] = "t[i] = t[i]-1;";
        [","] = "t[i] = io.read():byte()";
        ["."] = "io.write( string.char( tostring( t[i] ) ) )";
        ["["] = "while t[i] ~= 0 do ";
        ["]"] = "end;";
    }
    local str = ""
    for i=1, src:len() do 
        str = str..char_map[src:sub(i,i)] 
    end
    load("local i,t=1,setmetatable({},{__index=function() return 0 end});"..str)()
end

brainfuck("++++++++[>++++[>++>+++>+++>+<<<<-]>+>+>->>+[<]<-]>>.>---.+++++++..+++.>>.<-.<.+++.------.--------.>>+.>++.")
