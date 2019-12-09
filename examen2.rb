def method(words)
  limit = 10
  first_range = 0
  new_words = []

  words_join = words.join("")
  while first_range < words_join.size
    new_words.push(words_join[first_range..limit - 1])
    first_range = limit
    limit = first_range + limit
    limit > words_join.size ? limit = words_join.size : next
  end
  new_words
end
print method (['hola', 'este', 'es', 'un', 'nuevo', 'mensaje'])