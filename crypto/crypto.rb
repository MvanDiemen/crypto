require_relative 'codings/ceasar'

ceasar = Codings::Ceasar.new(12)
puts ceasar.encrypt("ik hou van je lieverd")
puts ceasar.decrypt("wy vci job xs zwsjsfr")
