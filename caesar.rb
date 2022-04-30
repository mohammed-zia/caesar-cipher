def caesar_cipher(string, shift)
    special = "?<>',?[]}{=-)(*&^%$#`~{}_+£!"
    regex = /[#{special.gsub(/./){|char| "\\#{char}"}}]/
    string = string.split('')
    bytes = []
    string.each do |char|
        if char =~ regex
            bytes.push(char) # we don't want to shift special chars
        else
            bytes.push(char.ord) # get ordinal of char
        end
    end
    shiftedBytes = []
    bytes.each do |byte|
        if byte == 32
            shiftedBytes.push(32) # if it's a space, push the space
        elsif byte =~ regex
            shiftedBytes.push(byte) # if it's a special char, push the char
        elsif byte < 97 # if it's a capital letter 
            normalised = byte - 64
            shifted = normalised + shift
            wrapped = shifted % 26
            reOrd = wrapped + 64
            shiftedBytes.push(reOrd)

        else # else it's a lowercase char
            normalised = byte - 96 # to get the base alphabet index
            shifted = normalised + shift # shift by desired amount
            wrapped = shifted % 26 # wrap around to start of alphabet
            reOrd = wrapped + 96
            shiftedBytes.push(reOrd)
        end
        end
    endArr = []
    shiftedBytes.each {|shifted| endArr.push(shifted.chr)} # re-convert to chars, push to output array
    # p "BYTES: #{bytes}"
    # p "SHIFTED BYTES: #{shiftedBytes}"
    # p endArr
    endString = endArr.join("") # join output array into final string
    p endString
    
 end
caesar_cipher("What a string!", 5)


