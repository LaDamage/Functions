local FormatFunctions = {}

function FormatFunctions:round(value, decimals)
    return tonumber(string.format("%." .. (decimals) .. "f", value))
end

function FormatFunctions:comma(value)
    value = tostring(value)
    return value:reverse():gsub("%d%d%d", "%1,"):reverse():gsub("^,", "")
end

function FormatFunctions:suffix(value, decimals)
    decimals = decimals or 0
        
    local Suffixes = {
        "", "k", "M", "B", "T", "Qd", "Qn", "Sx", "Sp", "Oc", "No", "De", "UDe", "DDe", "TDe", "QdDe", "QnDe", "SxDe", "SpDe", "OcDe", "NoDe", "Vt", "UVt", "DVt", "TVt", "QdVt", "QnVt", "SxVt", "SpVt", "OcVt", "NoVt", "Tg", "UTg", "DTg", "TTg", "QdTg", "QnTg", "SxTg", "SpTg", "OcTg", "NoTg", "qg", "Uqg", "Dqg", "Tqg", "Qdqg", "Qnqg", "Sxqg", "Spqg", "Ocqg", "Noqg", "Qg", "UQg", "DQg", "TQg", "QdQg", "QnQg", "SxQg", "SpQg", "OcQg", "NoQg", "sg", "Usg", "Dsg", "Tsg", "Qdsg", "Qnsg", "Sxsg", "Spsg", "Ocsg", "Nosg", "Sg", "USg", "DSg", "TSg", "QdSg", "QnSg", "SxSg", "SpSg", "OcSg", "NoSg", "Og", "UOg", "DOg", "TOg", "QdOg", "QnOg", "SxOg", "SpOg", "OcOg", "NoOg", "Ng", "UNg", "DNg", "TNg", "QdNg", "QnNg", "SxNg", "SpNg", "OcNg", "NoNg", "Ce", "UCe"
    }
        
    local Index = math.floor(math.log10(value) / 3)
    local Suffix = Suffixes[Index + 1]
        
    value = value / (10 ^ (3 * Index))
    value = tostring(math.floor(value * 10 ^ decimals) / 10 ^ decimals)
        
    return value .. Suffix
end

return FormatFunctions
