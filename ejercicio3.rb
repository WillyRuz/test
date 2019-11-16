def same_words(word1, word2)
   word1.match(/#{word2}/) != nil
end

same_words("superpatata", "pata")
