require 'pry'
require './list.rb'
require './item.rb'

class TodoList
	attr_accessor :lists

	CHOICES = ['1', '2', '3', '4', 'd', 'e', 'exit']

	def initialize 
		@lists = []
		run
	end

	def welcome
		puts ""
		puts "Welcome to your Todo List App"
		loop do 
			puts ""
			begin 
				puts "Choose an option: "
				divider
				puts "Press '1' to create a list"
				puts "Press '2' to print your list"
				puts "Press '3' to add item to your list"
				puts "Press '4' to mark item complete"
				puts "Press 'd' to delete a list"
				puts "Press 'e' or 'exit' to exit"
				divider
				input = gets.chomp.downcase
				system 'clear'
			end until CHOICES.include?(input)
			case input
			when '1'
				create_list
			when '2'
				print_list
			when '3'
				print_list
				print "Choose which list to edit: "
				list_name = gets.chomp.downcase
				lists.each do |list|
					found = list.name.include?(list_name)
					if found
						add_list_item(list)
					end
				end
			when '4'
				print_list
				print "Choose which list to edit: "
				list_name = gets.chomp.downcase
				index = find_index(list_name)
				lists.each do |list|
					found = list.name.include?(list_name)
					if found
						print "Choose which item to mark complete: "
						mark_item_complete = gets.chomp.downcase
						mark_complete(mark_item_complete, index)
					end
				end
			when 'd'
				print_list
				print "Choose a list to delete: "
				list_name = gets.chomp.downcase
				remove_list(list_name)
			when 'e'
				break
			when 'exit'
				break
			end
		end
	end

	def create_list
		print "Print the name of the list: "
		name = gets.chomp.downcase
		list = List.new(name)
		loop do 
			puts "Would you like to add an item? (y/n): "
			answer = gets.chomp.downcase
			if answer == 'y'
				add_list_item(list)
			else
				break
			end
		end
		lists << list
	end

	def add_list_item(list)
		print "Add an item to the list: "
		item_name = gets.chomp.downcase
		item = Item.new(item_name)
		list.items << item
	end

	def print_list
		lists.each do |list| 
			divider
			puts list.name.upcase
			divider
			list.items.each do |item|
				puts item
			end
			divider
		end
	end

	def remove_list(name)
		if index = find_index(name)
			lists.delete_at(index)
			return true
		else 
			return false
		end
	end

	def mark_complete(name, index_of_list)
		if index_of_item = find_index_of_items(lists[index_of_list].name, name)
      lists[index_of_list].items[index_of_item].mark_complete!
      return true
    else
      return false
    end 
	end

	def find_index(name)
		index = 0
		found = false
		lists.each do |list|
			if list.name == name
				found = true
			end
			if found
				break
			else
				index += 1
			end
		end
		if found
      return index
    else
      return nil
    end
	end

	def find_index_of_items(list_name, name)
		lists.each do |list|
			if list.name == list_name
				index = 0
				found = false
				list.items.each do |item|
					if item.name == name
						found = true
					end
					if found
						break
					else
						index += 1
					end
				end
				if found
		      return index
		    else
		      return nil
		    end
			end
		end
	end

	def divider
		puts "-" * 30
	end

	def run
		welcome
	end
end

shopping_list = TodoList.new


















































