class Dictionary
  attr_accessor :language, :word

  def self.translate(language, word)
    words_en = {
      department: 'departamento',
      tenant: 'inquilino',
      owner: 'propietario',
      rent: 'renta'
    }
    words_es = {
      departamento: 'apartement',
      inquilino: ' tenant',
      propietario: 'owner',
      renta: 'rent'
    }

    if language.downcase != 'español'
      return words_es.fetch(word.downcase.to_sym)
    end

      words_en.fetch(word.downcase.to_sym)
  end
end

puts Dictionary.translate('ENGLISH', 'renta')