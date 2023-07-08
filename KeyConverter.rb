module KeyConverter
  attr_accessor :key_mapping
  KEY_MAPPINGS = {
    "vrijeme": "date",
    "kolo": "round",
    "dobitni_brojevi": "winner_numbers",
    "naziv": "name",
    "izvlacenja": "draws",
    "rezultati": "results"
  }

  def self.convert_keys(json_data)
    parsed_data = json_data
    converted_data = deep_transform_keys(parsed_data) { |key| KEY_MAPPINGS[key.to_sym] || key }
    converted_data
  end

  private

  def self.deep_transform_keys(obj, &block)
    case obj
    when Array
      obj.map { |item| deep_transform_keys(item, &block) }
    when Hash
      Hash[obj.map { |key, value| [yield(key), deep_transform_keys(value, &block)] }]
    else
      obj
    end
  end
end
