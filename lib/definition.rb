class Definition

  @@definitions = []
  attr_reader(:definition, :id, :part_of_speech)

  define_method(:initialize) do |attributes|
    @definition = attributes.fetch(:definition)
    @part_of_speech = attributes.fetch(:part_of_speech)
    @id = @@definitions.length() + 1
  end

  define_method(:save) do
    @@definition.push(self)
  end

  define_singleton_method(:clear) do
    @@definition = []
  end

end
