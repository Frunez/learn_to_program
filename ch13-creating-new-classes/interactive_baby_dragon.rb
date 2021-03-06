# your code here
class OrangeTree
	
	def initialize name
		@name = name
		@asleep = false
		@stuff_in_belly = 10 #full
		@stuff_in_intestine = 0 #no poop
		
		puts "#{@name} is born"
	end
	
	def height
		puts "You feed #{@name}."
		@stuff_in_belly = 10
		passage_of_time
	end
	
	def walk
		puts"You walk #{@name}."
		@stuff_in_intestine = 0
		passage_of_time
	end
	
	def put_to_bed
		puts "You put #{@name} to bed."
		@asleep = true
		3.times do
			if @asleep
				passage_of_time
			end
			if @asleep
				puts "#{@name} snores, filling room with smoke."
			end
		end
		if @asleep
			@asleep = false
			puts "#{@name} wakes up slowly."
		end
	end
	
	def toss
		puts "You toss #{@name} up into the air."
		puts 'He giggles, which singes your eyebrows.'
		passage_of_time
	end
	def rock
		puts "You rock #{@name} gently."
		@asleep = true
		puts 'He briefly dozes off...'
		passage_of_time
		if @asleep
			@asleep = false
			puts '...but wakes as you stop.'
		end
	end	

	private
	def hungry?
		@stuff_in_belly <= 2
	end
	def poopy?
		@stuff_in_intestine >= 8
	end
	def passage_of_time
		if @stuff_in_belly > 0
			@stuff_in_belly = @stuff_in_belly -1
			@stuff_in_intestne = @stuff_in_intestine +1
		else
			if @asleep
				@asleep = false
				puts 'He wakes up suddenly!'
			end 
			puts "#{@name} is starving! In desperation, he ate YOU!"
			exit
		end
		if @stuff_in_intestine >= 10
			@stuff_in_intestine = 0
			puts "Whoops! #{@name} had_an_accident..."
		end
		
		if hungry?
			if @asleep
				@asleep = false
				puts 'He wakes up suddenly!'
			end
			puts "#{@name}'s stomach grumbles..."
		end
		
		if poopy?
			if @asleep
				@asleep = false
				puts 'He wakes up suddenly!'
			end
			puts "#{@name} does the potty dance..."
		end
	end
	
end

puts "You've walked out the flames and burnt a witch and your baby dragon has hatched!"
puts "What will you name your baby dragon?"
newname = gets.chomp.capitalize
pet = Dragon.new newname
obj = Object.new
while true
  puts
  puts 'commands: feed, toss, walk, rock, put_to_bed, exit'
  command = gets.chomp
  if command == 'exit'
    exit
  elsif pet.respond_to?(command) && !obj.respond_to?(command)
    # I only want to accept methods that dragons have,
    # but that regular objects *don't* have.
    pet.send command
  else
    puts 'Huh? Please type one of the commands.'
  end
end
