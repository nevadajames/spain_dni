require "spain_dni/version"

# Validates check letter for Spanish DNI and NIE
module SpainDni
  class Dni
    attr_accessor :id_number

    def initialize(id_number)
      @id_number = id_number.to_s
    end

    def dni?
      !@id_number[0].match(/\d/).nil?
    end

    def nie?
      @id_number[0].match(/\d/).nil?
    end

    def check_letter
      @id_number[-1]
    end

    def calculate_check
      nie_letters = { X: 0, Y: 1, Z: 2 }
      number = if nie?
                 [nie_letters[@id_number[0].to_sym], @id_number[1..-2]].join
               else
                 @id_number.chop
               end
      number.to_i % 23
    end

    def valid_letter
      verifiers = {
        0 => 'T', 1 => 'R', 2 => 'W', 3 => 'A', 4 => 'G', 5 => 'M',
        6 => 'Y', 7 => 'F', 8 => 'P', 9 => 'D', 10 => 'X', 11 => 'B',
        12 => 'N',	13 => 'J', 14 => 'Z' ,15 => 'S', 16 => 'Q',
        17 => 'V', 18 => 'H', 19 => 'L', 20 => 'C', 21 => 'K',	22 => 'E'
      }
      verifiers.each do |key, value|
        return value if calculate_check.to_i == key
      end
    end

    def valid?
      check_letter == valid_letter
    end

    def id_type
      return nil unless valid?
      nie? ? 'NIE' : 'DNI'
    end
  end
end
