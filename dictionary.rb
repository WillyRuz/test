class Dictionary
  attr_accessor :language, :word

  def translate(language, word)
    words_en = { department: 'departamento', tenant: 'inquilino', owner: 'propietario', rent: 'renta' }
    words_es = { departamento: 'apartement', inquilino: ' tenant', propietario: 'owner', renta: 'rent' }

    unless language.downcase == 'español'
      return puts words_es.fetch(word.downcase)
    end

    puts words_en.fetch(word.downcase)
  end
end

new = Dictionary.new
new.translate('ENGLISH', :INQUILINO)