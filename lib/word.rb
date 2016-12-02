class Word

  @@words = []
  attr_reader(:word, :id, :definitions)

  define_method(:initialize) do |attributes|
    @word = attributes.fetch(:word)
    @id = @@words.length() + 1
    @definitions = []
  end

  define_singleton_method(:all) do
    @@words
  end

  define_singleton_method(:clear) do
    @@words = []
  end

  define_method(:save) do
    @@words.push(self)
  end

  define_singleton_method(:find) do |id_number|
    found_word = nil
    @@words.each() do |word|
      if word.id == id_number
        found_word = word
      end
    end
    found_word
  end

  define_method(:add_definition) do |definition|
    @definitions.push(definition)
  end

  define_method(:find_definition) do |definition_id|
    found_definition = nil
    @definitions.each() do |definition|
      if definition.id == definition_id
        found_definition = definition
      end
    end
    found_definition
  end
end
