class Item
	attr_accessor :name, :complete

	def initialize(name)
		@name     = name
		@complete = false
	end

	def mark_complete!
		@complete = true
	end

	def mark_incomplete!
		@complete = false
	end

	def complete?
		@complete
	end

	def is_complete?
		if complete?
			"[C]"
		else
			"[I]"
		end
	end

	def to_s
    "#{name} is #{is_complete?}"
  end
end