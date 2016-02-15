require './votersim_module.rb'

class Voter
  attr_accessor :name, :party

  def initialize (name, party)
    @name = name
    @party = party
  end
end

class Politician < Voter
end

class Votersim
attr_accessor :politicians_list, :voters_list
  def initialize
    @politicians_list = []
    @voters_list = []
  end

  def rand_voter
    puts VoterSimTools.get_random_voter(@voters_list)
  end

  def prompt_user_for_initial_choices
    puts "Welcome to my Votersim what would you like to do?"
    puts "(c)reate (l)ist (d)elete, (u)pdate, (e)xit, (r)andom voter"

    @input = gets.chomp.downcase

    if @input == "c"
      create
    elsif @input == "l"
      list
    elsif @input == "d"
      delete
    elsif @input == "u"
      update
    elsif @input == "r"
      rand_voter
    elsif @input == "e"
      exit
    else
      prompt_user_for_initial_choices
    end
  end

  def create
    puts "Which would you like to create?"
    puts "(p)olitician (v)oter"

    @input = gets.chomp.downcase

    case @input

    when "p"
      create_politician
    when "v"
      create_voter
    else
      create
    end
  end

# CREATE POLITICIAN NAME
  def create_politician
    puts "Please type name of politician."

    name = gets.chomp.downcase

    politician_party(name.split.map(&:capitalize).join(" "))
  end

# ASSIGN POLITICIAN PARTY
  def politician_party(name)
    puts "Which party does #{name} belong to?"
    puts "(d)emocrat (r)epublican"

    politician_party = gets.chomp.downcase

    if politician_party == "d" || politician_party == "r"
      @politician = Politician.new(name, politician_party)
      @politicians_list << @politician
    else
      politician_party(name)
    end
    prompt_user_for_initial_choices
  end

# CREATE VOTER NAME
  def create_voter
    puts "Please type name of voter."

    name = gets.chomp.downcase

    party(name.split.map(&:capitalize).join(" "))
  end

# ASSIGN VOTER'S POLITICAL AFFILIATION

  def party(name)
    puts "Which party does #{name} belong to? Type letter in parenthesis."
    puts "(l)iberal (c)onservative (t)ea party (s)ocialist (n)eutral"

    party = gets.chomp.downcase

    case party

    when "l"
      @voter = Voter.new(name, party)
      @voters_list << @voter

    when "c"
      @voter = Voter.new(name, party)
      @voters_list << @voter

    when "t"
      @voter = Voter.new(name, party)
      @voters_list << @voter

    when "s"
      @voter = Voter.new(name, party)
      @voters_list << @voter

    when "n"
      @voter = Voter.new(name, party)
      @voters_list << @voter

    else
      party(name)
    end
    prompt_user_for_initial_choices
  end

# LIST FEATURE OPTIONS
  def list
    puts "Which list would you like to see?"
    puts "(p)oliticians list (v)oters list (a)ll entries (m)ain menu"

    @input = gets.chomp.downcase

    case @input
    when "p"
      list_politician
      prompt_user_for_initial_choices
    when "v"
      list_voter
      prompt_user_for_initial_choices
    when "a"
      list_politician
      list_voter
    when "m"
      prompt_user_for_initial_choices
    else
      list
    end
  end

# LIST POLITICIAN
  def list_politician
    @politicians_list.each do |p_list|
      puts "Politician, #{p_list.name}, #{ p_list.party}"
    end
  end

# LIST VOTER
  def list_voter
    @voters_list.each do |voter|
      puts "Voter #{voter.name}, #{ voter.party}"
    end
  end

# DELETE FEATURE
  # def delete(name)
  #   @politicians.each do |politicians|
  #     if politician.name == name
  #       @politician.delete(politician)
#     coming_soon_message
#   end
#
# # UPDATE FEATURE
#   # def update(name, party, new_name, new_party)
#   #   @voters.each do |voter|
#   #     if voter.name == name && voter.party == party
#   #       voter.name = new_name
#   #       voter.party = new_party
#     coming_soon_message
#   end

# COMING SOON MESSAGE
  def coming_soon_message
    puts "Feature coming soon!"
    puts "Return to main? (y)es (e)xit Votersim"

    @input = gets.chomp.downcase

    case @input
    when "y"
      prompt_user_for_initial_choices
    when "e"
    exit
    else
      coming_soon_message
    end
  end
end


votersim = Votersim.new
votersim.voters_list << Voter.new("Fredy", "conservative")
votersim.voters_list << Voter.new("Al", "liberal")
votersim.voters_list << Voter.new("Sant", "tea party")
votersim.voters_list << Voter.new("Amy", "neutral")

votersim.politicians_list << Politician.new("Jo", "democrat")
votersim.politicians_list << Politician.new("Hank", "democrat")
votersim.politicians_list << Politician.new("Russel", "democrat")

votersim.prompt_user_for_initial_choices

# politician = Politician.new('Ted','Demo')
# politician.get_name
