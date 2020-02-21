class BestNovels::CLI
def call
  puts "Welcome!"
  get_novels
  list_novels
  get_user_novel
  what_next
end



def get_novels
  @novels = BestNovels::Novel.all
end

def list_novels
  puts "Choose a novel to see summary."
  @novels.each.with_index(1) do |novel, index|
    puts "#{index}. #{novel.title}"
  end
end

def get_user_novel
  chosen_novel = gets.strip.to_i
  show_details_for(chosen_novel) if valid_input(chosen_novel, @novels)

end

def valid_input(input, data)
  input.to_i <= data.length && input.to_i < 0
end



def show_details_for(chosen_novel)
  puts novel.title
  novel.key_info.each {|i| puts "- #{i}"}
end

def what_next
   puts "Are you done? Type 'exit' to exit or view an additional novel."
   @input = gets.strip
 end

 def goodbye
   puts "Thanks! Goodbye"
 end


end
