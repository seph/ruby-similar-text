# SimilarText
module JoeHartman
  module SimilarText
    def self.included( mod )
      mod.extend( ClassMethods )
    end

    module ClassMethods
      # implement gestalt algorithm
      def gestalt( s1, s2 )
      	max, pos1, pos2 = 0

      	0.upto(	s1.size - 1 ) do |p|
        	0.upto(	s2.size - 1 ) do |q|
      			l = 0
      			l += 1 while p + l < s1.size && q + l < s2.size && s1[p + l] == s2[q + l]
      			max, pos1, pos2 = l, p, q if l > max
      		end
      	end

      	return 0 if max.zero?

      	tot = max
        tot += gestalt( s1[0..pos1 - 1], s2[0..pos2 - 1] ) unless [pos1, pos2].include? 0
      	tot += gestalt( s1[pos1 + max..-1], s2[pos2 + max..-1] ) if pos1 + max < s1.size && pos2 + max < s2.size

      	return tot
      end

      # call gestalt and compute "confidence level"
      def similar_text( s1, s2 )
        tot = gestalt( s1, s2 )
        return { :matched_chars => tot, :confidence => tot * 2.0 / ( s1.size + s2.size ) }
      end
    end
  end
end
