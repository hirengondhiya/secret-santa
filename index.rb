require "artii"
require "colorize"

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
end

def get_santa_name
    current_santa_name = ""
    # Display list of the participants and allow user to identify who s/he is?
    # Store the user selection into the variable current_santa_name
    return current_santa_name
end

def match_random_person_for current_santa_name
    # get user properties for current_santa_name
    # check if current sant is already matched with another participant
    # if yes 
    #     return that participant's name
    # else
    #     build an array named "persons" with keys from the $partcipants hash who are not picked up by another secret santa pro tip use get_not_picked_participants_except method and pass current santa name as argument
    #     generate a random number with range input to be length of the array from previous step
    #     return the person at the random index generated in last step
end

def add_to_file current_santa_name, random_match_name
    # open file called matches.txt
    # append current_santa_name and random_match_name to the file in the format 
    # "<Santa Name>: <Match Name>"
end

def display random_match_name, delay
    # display name of the person on screen in big letters using artii and colorize
    # sleep for delay seconds
    # clear screen
end

def fetch_properties_for current_santa_name
    current_santa_props = {}
    # from $participants hash find the value for key matching current_santa_name and store it into variable current_santa
end

def update_properties current_santa_name, matched_random_person_name
    # get current santa and matched person properties
    # pro tip use call fetch_properties_for method twice and pass current_santa_name and matched_random_person_name arguments in respective calls. Save returned result in seperate variables
    # In current santa properties update is_santa_for with name of matched_random_person_name
    # and set is_santa to true
    # In matched person properties update my_santa_is with name of current_santa_name
    # and set is_picked_by_santa to true
end

def get_remaining_participant_names
    # This method return name of the participants who has still not played the draw
    # create an empty array say pnames
    # using each method fetch participant key and values from $participants hash
    # for each value if is_santa is false then push the key into pnames array
    # return the pnames array
end

def get_not_picked_participants_except current_santa_name
    # This method returns an array of all participants excluding the current user and those who are not matched with other partcipants
    # create an empty array say pnames
    # using each method fetch participant key and values from $participants hash
    # for each item check if key is not equal to current_santa_name and in value is_picked_by_santa is false then push the key into pnames array
    # return the pnames array
end

def has_all_participants_played
    # This method checks if all participants got chance in a draw
    # pro tip get names of all participants using get_remaining_participant_names function
    # check if the array returned by above call has no zero values then return true otherwise false
end

def game_play
    while(!has_all_participants_played)
        clear_screen
        current_santa_name = get_santa_name
        matched_random_person = match_random_person_for current_santa_name
        update_properties current_santa_name, matched_random_person
        add_to_file current_santa_name, matched_random_person
        display matched_random_person,3
    end
end

game_play