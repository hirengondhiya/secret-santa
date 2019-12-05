require "artii"
require "colorize"
require "tty-prompt"

$participants = {
    "louise" => {
        is_santa_for: "",
        is_santa: false,        
        my_santa_is: "",
        is_picked_by_santa: false
    },
    "ignacio" => {
        is_santa_for: "",
        my_santa_is: "",
        is_picked_by_santa: false,
        is_santa: false        
    },
    "kenneth" => {
        is_santa_for: "",
        my_santa_is: "",
        is_picked_by_santa: false,
        is_santa: false        
    },
    "cat" => {
        is_santa_for: "",
        my_santa_is: "",
        is_picked_by_santa: false,
        is_santa: false        
    },
    "bianca" => {
        is_santa_for: "",
        my_santa_is: "",
        is_picked_by_santa: false,
        is_santa: false        
    },
    "hiren" => {
        is_santa_for: "",
        my_santa_is: "",
        is_picked_by_santa: false,
        is_santa: false        
    },
    "emil" => {
        is_santa_for: "",
        my_santa_is: "",
        is_picked_by_santa: false,
        is_santa: false        
    },
    "niraj" => {
        is_santa_for: "",
        my_santa_is: "",
        is_picked_by_santa: false,
        is_santa: false        
    },
    "su" => {
        is_santa_for: "",
        my_santa_is: "",
        is_picked_by_santa: false,
        is_santa: false        
    },
    "alex" => {
        is_santa_for: "",
        my_santa_is: "",
        is_picked_by_santa: false,
        is_santa: false        
    },
    "luisa" => {
        is_santa_for: "",
        my_santa_is: "",
        is_picked_by_santa: false,
        is_santa: false        
    },
    "amrit" => {
        is_santa_for: "",
        my_santa_is: "",
        is_picked_by_santa: false,
        is_santa: false        
    },
    "jammie" => {
        is_santa_for: "",
        my_santa_is: "",
        is_picked_by_santa: false,
        is_santa: false        
    }
}

def clear_screen
	#sleep is used for how many sec you want to diplay the santa name for
    # sleep(3)
    print "\e[H\e[2J"
end

def get_santa_name
    # Display list of the participants and allow user to identify who s/he is?
    prompt = TTY::Prompt.new
    # Store the user selection into the variable current_santa_name
    current_santa_name = prompt.select("Choose the name", $participants.keys)
    return current_santa_name
end

def match_random_person_for current_santa_name
    current_santa_props = fetch_properties_for current_santa_name
    if (current_santa_props[:is_santa_for] != "")
        return current_santa_props[:is_santa_for]
    end
    # build an array name "persons" with keys of the partcipants hash who are not picked up by a secret santa or current_santa
    persons = get_not_picked_participants_except current_santa_name
    # generate a random number with range input to be length of the array from previous step
    randon_number = rand persons.length
    return persons[randon_number]
end

def add_to_file current_santa_name, random_match_name
    # open file called matches.txt
    # append current_santa_name and random_match_name to the file in the format 
    # "<Santa Name>: <Match Name>"

    open('matches.txt', 'a') do |f|
        f << "#{current_santa_name}: #{random_match_name}\n"
    end
end

def display random_match_name, delay
    # display name of the person on screen in big letters using artii
    a = Artii::Base.new
    puts a.asciify(random_match_name).green.on_black
    # sleep for 15 seconds
    # sleep 15
    print "." * delay
    i=15
    for i in 1..delay
        print "\b"*i + " "*i
        sleep 1
    end
    # clear screen
    clear_screen
end

def fetch_properties_for current_santa_name
    current_santa_props = {}
    # from $participants hash find the value for key matching current_santa_name and store it into variable current_santa
    current_santa_props = $participants[current_santa_name.downcase]
    return current_santa_props
end

def update_properties current_santa_name, matched_random_person_name
    current_santa_props = fetch_properties_for current_santa_name
    matched_random_person_props = fetch_properties_for matched_random_person_name

    current_santa_props[:is_santa_for] = matched_random_person_name  
    current_santa_props[:is_santa] = true  
    matched_random_person_props[:my_santa_is] = current_santa_name
    matched_random_person_props[:is_picked_by_santa] = true
end

def get_remaining_participant_names
    pnames = []
    $participants.each { |pname, p_props| 
        if p_props[:is_santa] == false
            pnames.push(pname)
        end
    }
    return pnames
end

def get_not_picked_participants_except current_santa_name
    pnames = []
    $participants.each { |pname, p_props| 
        if pname.downcase != current_santa_name.downcase && p_props[:is_picked_by_santa] == false
            pnames.push(pname)
        end
    }
    return pnames
end

def has_all_participants_played
    pnames = get_remaining_participant_names
    return pnames.length == 0
end

def game_play
    while(!has_all_participants_played)
        current_santa_name = get_santa_name
        matched_random_person = match_random_person_for current_santa_name
        update_properties current_santa_name, matched_random_person
        add_to_file current_santa_name, matched_random_person
        display matched_random_person,5
    end
end

game_play