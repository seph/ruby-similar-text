# Include hook code here
require 'ruby-similar-text'
ActiveRecord::Base.send :include, JoeHartman::SimilarText
