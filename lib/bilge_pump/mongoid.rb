module BilgePump
  module Mongoid
    module Document
      extend ActiveSupport::Concern

      included do
        scope :scoped
      end

    end
  end
end
