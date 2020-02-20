class BestNovels::CLI
def call
  puts "Welcome!"
  get_novels
  list_novels
  get_user_novel
end

def get_novels
  @novels = ["book1","book2","book3"]
end

def list_novels
  puts "Choose a novel to see summary."
  @novels.each.with_index(1) do |novel, index|
    puts "#{index}. #{novel}"
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
  novel = @novels[chosen_novel - 1]
  puts "Here is the summary for #{novel}"
end
end
