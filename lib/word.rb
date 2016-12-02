class Word

  @@words = []
  attr_reader(:word)

  define_method(:initialize) do |attributes|
    @word = attributes.fetch(:word)
  end

  define_singleton_method(:id) do
    @@words
  end

  define_singleton_method(:clear) do
    @@words = []
  end
  
  define_method(:save) do
    @@words.push(self)
  end

end
