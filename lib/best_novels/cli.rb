class BestNovels::CLI
def call
  puts "Welcome to The Guardian's 100 Best Novels!"
  @input = ""
  until @input == "exit"
  get_novels
  list_novels
  get_user_novel
  what_next
end
goodbye
end


def get_novels
  @novels = BestNovels::Novel.all
end

def list_novels
  @novels.each.with_index(1) do |novel, index|
    puts "#{index}. #{novel.title}"
  end
end

def get_user_novel
  chosen_novel = gets.strip.to_i
  show_details_for(chosen_novel) if valid_input(chosen_novel, @novels)

end

def valid_input(input, data)
  input.to_i <= data.length && input.to_i > 0
end



def show_details_for(chosen_novel)
  novel = @novels[chosen_novel - 1]
  novel.get_novel_details
  puts ""
  puts "Robert McCrum's Review of: #{novel.title}"
  puts ""
  puts novel.key_info
  puts ""
  puts "Read the full review at #{novel.url}"
end

def what_next
  puts ""
  puts ""
   puts "Are you done? Type 'exit' to exit or press any key to view the full list of novels."
   @input = gets.strip

 end

 def goodbye
   puts "Thanks! Goodbye"
 end


end
