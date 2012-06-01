module DocuSign
  class AnchorTab < DocuSignModel
    ATTRIBUTES = [:anchor_tab_string, :x_offset, :y_offset, :unit, :ignore_if_not_present]
    ATTRIBUTES.each do |attr|
      self.send(:attr_accessor, attr)
    end
    alias_attribute :string, :anchor_tab_string
    alias_attribute :x, :x_offset
    alias_attribute :y, :y_offset

    def initialize(attributes = {})
      @anchor_tab_string = attributes[:string] || attributes[:anchor_tab_string]
      @x_offset = attributes[:x] || attributes[:x_offset]
      @y_offset = attributes[:y] || attributes[:y_offset]
      @unit = attributes[:unit]
      @ignore_if_not_present = attributes[:ignore_if_not_present]
    end

    def to_savon
      {
        "AnchorTabString" => self.anchor_tab_string,
        "XOffset" => self.x_offset,
        "YOffset" => self.y_offset,
        "Unit" => self.unit,
        "IgnoreIfNotPresent" => self.ignore_if_not_present?
      }.delete_if{|key, value| value.nil?}
    end
  end
end
