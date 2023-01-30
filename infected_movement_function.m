function matrix_of_infected_people = infected_movement_function(matrix_of_infected_people)

    array_infected = size(matrix_of_infected_people);
    num_infected_people = array_infected(1);
    
    for infected_person = 1 : num_infected_people % loop for 228 different healthy persons
    
            if_isolated = matrix_of_infected_people(infected_person,4);
            initial_x_coordinate = matrix_of_infected_people(infected_person,1); % infected person's initial x coordinate (constant)
            initial_y_coordinate = matrix_of_infected_people(infected_person,2); % infected person's initial y coordinate (constant)
    
            x_coordinate = matrix_of_infected_people(infected_person,1); % infected person's x coordinate (will change)
            y_coordinate = matrix_of_infected_people(infected_person,2); % infected person's y coordinate (will change)
        
        if if_isolated == 1

            for steps = 1 : 3
                
                if (x_coordinate == initial_x_coordinate) && (y_coordinate == initial_y_coordinate)
                    
                    if x_coordinate == 10 && y_coordinate == 10 %if the infected and isolated person is on the top right corner
                    
                        random_number = randi(4);
                        
                        if random_number == 1
                            x_coordinate = x_coordinate - 1;
                        elseif random_number == 2
                            y_coordinate = y_coordinate - 1;
                        elseif random_number == 3
                            x_coordinate = x_coordinate - 1;
                            y_coordinate = y_coordinate - 1;
                        end
        
                    elseif x_coordinate == -10 && y_coordinate == 10 %if the infected and isolated person is on the top left corner
                    
                        random_number = randi(4);
                        
                        if random_number == 1
                            x_coordinate = x_coordinate + 1;
                        elseif random_number == 2
                            y_coordinate = y_coordinate - 1;
                        elseif random_number == 3
                            x_coordinate = x_coordinate + 1;
                            y_coordinate = y_coordinate - 1;
                        end
                
                    elseif x_coordinate == -10 && y_coordinate == -10 %if the infected and isolated person is on the bottom left corner
                    
                        random_number = randi(4);
                        
                        if random_number == 1
                            x_coordinate = x_coordinate + 1;
                        elseif random_number == 2
                            y_coordinate = y_coordinate + 1;
                        elseif random_number == 3
                            x_coordinate = x_coordinate + 1;
                            y_coordinate = y_coordinate + 1;
                        end
        
                    elseif x_coordinate == 10 && y_coordinate == -10 %if the infected and isolated person is on the bottom right corner
                    
                        random_number = randi(4);
                        
                        if random_number == 1
                            x_coordinate = x_coordinate - 1;
                        elseif random_number == 2
                            y_coordinate = y_coordinate + 1;
                        elseif random_number == 3
                            x_coordinate = x_coordinate - 1;
                            y_coordinate = y_coordinate + 1;
                        end
            
                    elseif (x_coordinate == 10 && y_coordinate ~= 10) && (x_coordinate == 10 && y_coordinate ~= -10) % if the infected and isolated person is on the right boundary, except corners
                    
                        random_number = randi(6);
                        
                        if random_number == 1
                            x_coordinate = x_coordinate - 1;
                        elseif random_number == 2
                            y_coordinate = y_coordinate + 1;
                        elseif random_number == 3
                            y_coordinate = y_coordinate - 1;
                        elseif random_number == 4
                            x_coordinate = x_coordinate - 1;
                            y_coordinate = y_coordinate + 1;
                        elseif random_number == 5
                            x_coordinate = x_coordinate - 1;
                            y_coordinate = y_coordinate - 1;
                        end
        
                    elseif (x_coordinate == -10 && y_coordinate ~= 10) && (x_coordinate == -10 && y_coordinate ~= -10) % if the infected and isolated person is on the left boundary, except corners
                    
                        random_number = randi(6);
                        
                        if random_number == 1
                            x_coordinate = x_coordinate + 1;
                        elseif random_number == 2
                            y_coordinate = y_coordinate + 1;
                        elseif random_number == 3
                            y_coordinate = y_coordinate - 1;
                        elseif random_number == 4
                            x_coordinate = x_coordinate + 1;
                            y_coordinate = y_coordinate + 1;
                        elseif random_number == 5
                            x_coordinate = x_coordinate + 1;
                            y_coordinate = y_coordinate - 1;
                        end
                
                    elseif (y_coordinate == 10 && x_coordinate ~= 10) && (y_coordinate == 10 && x_coordinate ~= -10) % if the infected and isolated person is on the upper boundary, except corners
                    
                        random_number = randi(6);
                        
                        if random_number == 1
                            y_coordinate = y_coordinate - 1;
                        elseif random_number == 2
                            x_coordinate = x_coordinate + 1;
                        elseif random_number == 3
                            x_coordinate = x_coordinate - 1;
                        elseif random_number == 4
                            x_coordinate = x_coordinate - 1;
                            y_coordinate = y_coordinate - 1;
                        elseif random_number == 5
                            x_coordinate = x_coordinate + 1;
                            y_coordinate = y_coordinate - 1;
                        end
                
                    elseif (y_coordinate == -10 && x_coordinate ~= 10) && (y_coordinate == -10 && x_coordinate ~= -10) % if the infected and isolated person is on the bottom boundary, except corners
        
                        random_number = randi(6);
                        
                        if random_number == 1
                            y_coordinate = y_coordinate + 1;
                        elseif random_number == 2
                            x_coordinate = x_coordinate + 1;
                        elseif random_number == 3
                            x_coordinate = x_coordinate - 1;
                        elseif random_number == 4
                            x_coordinate = x_coordinate + 1;
                            y_coordinate = y_coordinate + 1;
                        elseif random_number == 5
                            x_coordinate = x_coordinate - 1;
                            y_coordinate = y_coordinate + 1;
                        end
               
                    else % all the other places on the 20x20 grid
    
                        random_number = randi(9);
                        
                        if random_number == 1
                            x_coordinate = x_coordinate + 1;
                        elseif random_number == 2
                            x_coordinate = x_coordinate - 1;
                        elseif random_number == 3
                            y_coordinate = y_coordinate + 1;
                        elseif random_number == 4
                            y_coordinate = y_coordinate -1;
                        elseif random_number == 5
                            x_coordinate = x_coordinate - 1;
                            y_coordinate = y_coordinate + 1;
                        elseif random_number == 6
                            x_coordinate = x_coordinate + 1;
                            y_coordinate = y_coordinate + 1;
                        elseif random_number == 7
                            x_coordinate = x_coordinate - 1;
                            y_coordinate = y_coordinate - 1;
                        elseif random_number == 8
                            x_coordinate = x_coordinate + 1;
                            y_coordinate = y_coordinate - 1;
                        end
                    end
    
                elseif (x_coordinate == initial_x_coordinate + 1) && (y_coordinate == initial_y_coordinate)
                    
                    if x_coordinate == 10 && y_coordinate == 10 %if the infected and isolated person is on the top right corner
                    
                    random_number = randi(4);
                    
                        if random_number == 1
                            x_coordinate = x_coordinate - 1;
                        elseif random_number == 2
                            y_coordinate = y_coordinate - 1;
                        elseif random_number == 3
                            x_coordinate = x_coordinate - 1;
                            y_coordinate = y_coordinate - 1;
                        end
        
                    elseif x_coordinate == 10 && y_coordinate == -10 %if the infected and isolated person is on the bottom right corner
                    
                    random_number = randi(4);
                    
                    if random_number == 1
                        x_coordinate = x_coordinate - 1;
                    elseif random_number == 2
                        y_coordinate = y_coordinate + 1;
                    elseif random_number == 3
                        x_coordinate = x_coordinate - 1;
                        y_coordinate = y_coordinate + 1;
                    end
        
                    elseif (x_coordinate == 10 && y_coordinate ~= 10) && (x_coordinate == 10 && y_coordinate ~= -10) % if the infected and isolated person is on the right boundary, except corners
                    
                        random_number = randi(6);
                        
                        if random_number == 1
                            x_coordinate = x_coordinate - 1;
                        elseif random_number == 2
                            y_coordinate = y_coordinate + 1;
                        elseif random_number == 3
                            y_coordinate = y_coordinate - 1;
                        elseif random_number == 4
                            x_coordinate = x_coordinate - 1;
                            y_coordinate = y_coordinate + 1;
                        elseif random_number == 5
                            x_coordinate = x_coordinate - 1;
                            y_coordinate = y_coordinate - 1;
                        end
                
                    elseif (y_coordinate == 10 && x_coordinate ~= 10) && (y_coordinate == 10 && x_coordinate ~= -10) % if the infected and isolated person is on the upper boundary, except corners
                    
                        random_number = randi(4);
                        
                        if random_number == 1
                            y_coordinate = y_coordinate - 1;
                        elseif random_number == 2
                            x_coordinate = x_coordinate - 1;
                        elseif random_number == 3
                            x_coordinate = x_coordinate - 1;
                            y_coordinate = y_coordinate - 1;
                        end
                
                    elseif (y_coordinate == -10 && x_coordinate ~= 10) && (y_coordinate == -10 && x_coordinate ~= -10) % if the infected and isolated person is on the bottom boundary, except corners
        
                        random_number = randi(4);
                        
                        if random_number == 1
                            y_coordinate = y_coordinate + 1;
                        elseif random_number == 2
                            x_coordinate = x_coordinate - 1;
                        elseif random_number == 3
                            x_coordinate = x_coordinate - 1;
                            y_coordinate = y_coordinate + 1;
                        end
               
                    else % all the other places on the 20x20 grid
    
                        random_number = randi(6);
                        
                        if random_number == 1
                            x_coordinate = x_coordinate - 1;
                        elseif random_number == 2
                            y_coordinate = y_coordinate + 1;
                        elseif random_number == 3
                            y_coordinate = y_coordinate -1;
                        elseif random_number == 4
                            x_coordinate = x_coordinate - 1;
                            y_coordinate = y_coordinate + 1;
                        elseif random_number == 5
                            x_coordinate = x_coordinate - 1;
                            y_coordinate = y_coordinate - 1;
                        end
                    end
    
                elseif (x_coordinate == initial_x_coordinate - 1) && (y_coordinate == initial_y_coordinate)
                    
                    if x_coordinate == -10 && y_coordinate == 10 %if the infected and isolated person is on the top left corner
                        
                        random_number = randi(4);
                        
                        if random_number == 1
                            x_coordinate = x_coordinate + 1;
                        elseif random_number == 2
                            y_coordinate = y_coordinate - 1;
                        elseif random_number == 3
                            x_coordinate = x_coordinate + 1;
                            y_coordinate = y_coordinate - 1;
                        end
                    
                    elseif x_coordinate == -10 && y_coordinate == -10 %if the infected and isolated person is on the bottom left corner
                        
                        random_number = randi(4);
                        
                        if random_number == 1
                            x_coordinate = x_coordinate + 1;
                        elseif random_number == 2
                            y_coordinate = y_coordinate + 1;
                        elseif random_number == 3
                            x_coordinate = x_coordinate + 1;
                            y_coordinate = y_coordinate + 1;
                        end
            
                    elseif (x_coordinate == -10 && y_coordinate ~= 10) && (x_coordinate == -10 && y_coordinate ~= -10) % if the infected and isolated person is on the left boundary, except corners
                        
                        random_number = randi(6);
                        
                        if random_number == 1
                            x_coordinate = x_coordinate + 1;
                        elseif random_number == 2
                            y_coordinate = y_coordinate + 1;
                        elseif random_number == 3
                            y_coordinate = y_coordinate - 1;
                        elseif random_number == 4
                            x_coordinate = x_coordinate + 1;
                            y_coordinate = y_coordinate + 1;
                        elseif random_number == 5
                            x_coordinate = x_coordinate + 1;
                            y_coordinate = y_coordinate - 1;
                        end
                    
                    elseif (y_coordinate == 10 && x_coordinate ~= 10) && (y_coordinate == 10 && x_coordinate ~= -10) % if the infected and isolated person is on the upper boundary, except corners
                        
                        random_number = randi(4);
                        
                        if random_number == 1
                            y_coordinate = y_coordinate - 1;
                        elseif random_number == 2
                            x_coordinate = x_coordinate + 1;
                        elseif random_number == 3
                            x_coordinate = x_coordinate + 1;
                            y_coordinate = y_coordinate - 1;
                        end
                    
                    elseif (y_coordinate == -10 && x_coordinate ~= 10) && (y_coordinate == -10 && x_coordinate ~= -10) % if the infected and isolated person is on the bottom boundary, except corners
            
                        random_number = randi(4);
                        
                        if random_number == 1
                            y_coordinate = y_coordinate + 1;
                        elseif random_number == 2
                            x_coordinate = x_coordinate + 1;
                        elseif random_number == 3
                            x_coordinate = x_coordinate + 1;
                            y_coordinate = y_coordinate + 1;
                        end
                   
                    else % all the other places on the 20x20 grid
        
                        random_number = randi(6);
                        
                        if random_number == 1
                            x_coordinate = x_coordinate + 1;
                        elseif random_number == 2
                            y_coordinate = y_coordinate + 1;
                        elseif random_number == 3
                            y_coordinate = y_coordinate -1;
                        elseif random_number == 4
                            x_coordinate = x_coordinate + 1;
                            y_coordinate = y_coordinate + 1;
                        elseif random_number == 5
                            x_coordinate = x_coordinate + 1;
                            y_coordinate = y_coordinate - 1;
                        end
                    end
    
                elseif (x_coordinate == initial_x_coordinate) && (y_coordinate == initial_y_coordinate + 1)
                    
                    if x_coordinate == 10 && y_coordinate == 10 %if the infected and isolated person is on the top right corner
                    
                        random_number = randi(4);
                        
                        if random_number == 1
                            x_coordinate = x_coordinate - 1;
                        elseif random_number == 2
                            y_coordinate = y_coordinate - 1;
                        elseif random_number == 3
                            x_coordinate = x_coordinate - 1;
                            y_coordinate = y_coordinate - 1;
                        end
        
                    elseif x_coordinate == -10 && y_coordinate == 10 %if the infected and isolated person is on the top left corner
                    
                        random_number = randi(4);
                        
                        if random_number == 1
                            x_coordinate = x_coordinate + 1;
                        elseif random_number == 2
                            y_coordinate = y_coordinate - 1;
                        elseif random_number == 3
                            x_coordinate = x_coordinate + 1;
                            y_coordinate = y_coordinate - 1;
                        end
            
                    elseif (x_coordinate == 10 && y_coordinate ~= 10) && (x_coordinate == 10 && y_coordinate ~= -10) % if the infected and isolated person is on the right boundary, except corners
                    
                        random_number = randi(4);
                        
                        if random_number == 1
                            x_coordinate = x_coordinate - 1;
                        elseif random_number == 2
                            y_coordinate = y_coordinate - 1;
                        elseif random_number == 3
                            x_coordinate = x_coordinate - 1;
                            y_coordinate = y_coordinate - 1;
                        end
        
                    elseif (x_coordinate == -10 && y_coordinate ~= 10) && (x_coordinate == -10 && y_coordinate ~= -10) % if the infected and isolated person is on the left boundary, except corners
                    
                        random_number = randi(4);
                        
                        if random_number == 1
                            x_coordinate = x_coordinate + 1;
                        elseif random_number == 2
                            y_coordinate = y_coordinate - 1;
                        elseif random_number == 3
                            x_coordinate = x_coordinate + 1;
                            y_coordinate = y_coordinate - 1;
                        end
                
                    elseif (y_coordinate == 10 && x_coordinate ~= 10) && (y_coordinate == 10 && x_coordinate ~= -10) % if the infected and isolated person is on the upper boundary, except corners
                    
                        random_number = randi(6);
                        
                        if random_number == 1
                            y_coordinate = y_coordinate - 1;
                        elseif random_number == 2
                            x_coordinate = x_coordinate + 1;
                        elseif random_number == 3
                            x_coordinate = x_coordinate - 1;
                        elseif random_number == 4
                            x_coordinate = x_coordinate - 1;
                            y_coordinate = y_coordinate - 1;
                        elseif random_number == 5
                            x_coordinate = x_coordinate + 1;
                            y_coordinate = y_coordinate - 1;
                        end
               
                    else % all the other places on the 20x20 grid
    
                        random_number = randi(6);
                        
                        if random_number == 1
                            x_coordinate = x_coordinate + 1;
                        elseif random_number == 2
                            x_coordinate = x_coordinate - 1;
                        elseif random_number == 3
                            y_coordinate = y_coordinate -1;
                        elseif random_number == 4
                            x_coordinate = x_coordinate - 1;
                            y_coordinate = y_coordinate - 1;
                        elseif random_number == 5
                            x_coordinate = x_coordinate + 1;
                            y_coordinate = y_coordinate - 1;
                        end
                    end
                
                elseif (x_coordinate == initial_x_coordinate) && (y_coordinate == initial_y_coordinate - 1)
                
                    if x_coordinate == -10 && y_coordinate == -10 %if the infected and isolated person is on the bottom left corner
                    
                        random_number = randi(4);
                        
                        if random_number == 1
                            x_coordinate = x_coordinate + 1;
                        elseif random_number == 2
                            y_coordinate = y_coordinate + 1;
                        elseif random_number == 3
                            x_coordinate = x_coordinate + 1;
                            y_coordinate = y_coordinate + 1;
                        end
        
                    elseif x_coordinate == 10 && y_coordinate == -10 %if the infected and isolated person is on the bottom right corner
                    
                        random_number = randi(4);
                        
                        if random_number == 1
                            x_coordinate = x_coordinate - 1;
                        elseif random_number == 2
                            y_coordinate = y_coordinate + 1;
                        elseif random_number == 3
                            x_coordinate = x_coordinate - 1;
                            y_coordinate = y_coordinate + 1;
                        end
            
                    elseif (x_coordinate == 10 && y_coordinate ~= 10) && (x_coordinate == 10 && y_coordinate ~= -10) % if the infected and isolated person is on the right boundary, except corners
                    
                        random_number = randi(4);
                        
                        if random_number == 1
                            x_coordinate = x_coordinate - 1;
                        elseif random_number == 2
                            y_coordinate = y_coordinate + 1;
                        elseif random_number == 3
                            x_coordinate = x_coordinate - 1;
                            y_coordinate = y_coordinate + 1;
                        end
        
                    elseif (x_coordinate == -10 && y_coordinate ~= 10) && (x_coordinate == -10 && y_coordinate ~= -10) % if the infected and isolated person is on the left boundary, except corners
                    
                        random_number = randi(4);
                        
                        if random_number == 1
                            x_coordinate = x_coordinate + 1;
                        elseif random_number == 2
                            y_coordinate = y_coordinate + 1;
                        elseif random_number == 3
                            x_coordinate = x_coordinate + 1;
                            y_coordinate = y_coordinate + 1;
                        end
                
                    elseif (y_coordinate == -10 && x_coordinate ~= 10) && (y_coordinate == -10 && x_coordinate ~= -10) % if the infected and isolated person is on the bottom boundary, except corners
        
                        random_number = randi(6);
                        
                        if random_number == 1
                            y_coordinate = y_coordinate + 1;
                        elseif random_number == 2
                            x_coordinate = x_coordinate + 1;
                        elseif random_number == 3
                            x_coordinate = x_coordinate - 1;
                        elseif random_number == 4
                            x_coordinate = x_coordinate + 1;
                            y_coordinate = y_coordinate + 1;
                        elseif random_number == 5
                            x_coordinate = x_coordinate - 1;
                            y_coordinate = y_coordinate + 1;
                        end
               
                    else % all the other places on the 20x20 grid
    
                        random_number = randi(6);
                        
                        if random_number == 1
                            x_coordinate = x_coordinate + 1;
                        elseif random_number == 2
                            x_coordinate = x_coordinate - 1;
                        elseif random_number == 3
                            y_coordinate = y_coordinate + 1;
                        elseif random_number == 4
                            x_coordinate = x_coordinate - 1;
                            y_coordinate = y_coordinate + 1;
                        elseif random_number == 5
                            x_coordinate = x_coordinate + 1;
                            y_coordinate = y_coordinate + 1;
                        end
                    end
    
                elseif (x_coordinate == initial_x_coordinate + 1) && (y_coordinate == initial_y_coordinate + 1)
                    
                    if x_coordinate == 10 && y_coordinate == 10 %if the infected and isolated person is on the top right corner
                    
                        random_number = randi(4);
                        
                        if random_number == 1
                            x_coordinate = x_coordinate - 1;
                        elseif random_number == 2
                            y_coordinate = y_coordinate - 1;
                        elseif random_number == 3
                            x_coordinate = x_coordinate - 1;
                            y_coordinate = y_coordinate - 1;
                        end
            
                    elseif (x_coordinate == 10 && y_coordinate ~= 10) && (x_coordinate == 10 && y_coordinate ~= -10) % if the infected and isolated person is on the right boundary, except corners
                    
                        random_number = randi(4);
                        
                        if random_number == 1
                            x_coordinate = x_coordinate - 1;
                        elseif random_number == 2
                            y_coordinate = y_coordinate - 1;
                        elseif random_number == 3
                            x_coordinate = x_coordinate - 1;
                            y_coordinate = y_coordinate - 1;
                        end
                
                    elseif (y_coordinate == 10 && x_coordinate ~= 10) && (y_coordinate == 10 && x_coordinate ~= -10) % if the infected and isolated person is on the upper boundary, except corners
                    
                        random_number = randi(4);
                        
                        if random_number == 1
                            y_coordinate = y_coordinate - 1;
                        elseif random_number == 2
                            x_coordinate = x_coordinate - 1;
                        elseif random_number == 3
                            x_coordinate = x_coordinate - 1;
                            y_coordinate = y_coordinate - 1;
                        end
               
                    else % all the other places on the 20x20 grid
    
                        random_number = randi(4);
                        
                        if random_number == 1
                            x_coordinate = x_coordinate - 1;
                        elseif random_number == 2
                            y_coordinate = y_coordinate -1;
                        elseif random_number == 3
                            x_coordinate = x_coordinate - 1;
                            y_coordinate = y_coordinate - 1;
                        end
                    end
    
                elseif (x_coordinate == initial_x_coordinate - 1) && (y_coordinate == initial_y_coordinate + 1)                
        
                    if x_coordinate == -10 && y_coordinate == 10 %if the infected and isolated person is on the top left corner
                    
                        random_number = randi(4);
                        
                        if random_number == 1
                            x_coordinate = x_coordinate + 1;
                        elseif random_number == 2
                            y_coordinate = y_coordinate - 1;
                        elseif random_number == 3
                            x_coordinate = x_coordinate + 1;
                            y_coordinate = y_coordinate - 1;
                        end
        
                    elseif (x_coordinate == -10 && y_coordinate ~= 10) && (x_coordinate == -10 && y_coordinate ~= -10) % if the infected and isolated person is on the left boundary, except corners
                    
                        random_number = randi(4);
                        
                        if random_number == 1
                            x_coordinate = x_coordinate + 1;
                        elseif random_number == 2
                            y_coordinate = y_coordinate - 1;
                        elseif random_number == 3
                            x_coordinate = x_coordinate + 1;
                            y_coordinate = y_coordinate - 1;
                        end
                
                    elseif (y_coordinate == 10 && x_coordinate ~= 10) && (y_coordinate == 10 && x_coordinate ~= -10) % if the infected and isolated person is on the upper boundary, except corners
                    
                        random_number = randi(4);
                        
                        if random_number == 1
                            y_coordinate = y_coordinate - 1;
                        elseif random_number == 2
                            x_coordinate = x_coordinate + 1;
                        elseif random_number == 3
                            x_coordinate = x_coordinate + 1;
                            y_coordinate = y_coordinate - 1;
                        end
               
                    else % all the other places on the 20x20 grid
    
                        random_number = randi(4);
                        
                        if random_number == 1
                            x_coordinate = x_coordinate + 1;
                        elseif random_number == 2
                            y_coordinate = y_coordinate -1;
                        elseif random_number == 3
                            x_coordinate = x_coordinate + 1;
                            y_coordinate = y_coordinate - 1;
                        end
                    end
                
                elseif (x_coordinate == initial_x_coordinate - 1) && (y_coordinate == initial_y_coordinate - 1)
                
                    if x_coordinate == -10 && y_coordinate == -10 %if the infected and isolated person is on the bottom left corner
                    
                        random_number = randi(4);
                        
                        if random_number == 1
                            x_coordinate = x_coordinate + 1;
                        elseif random_number == 2
                            y_coordinate = y_coordinate + 1;
                        elseif random_number == 3
                            x_coordinate = x_coordinate + 1;
                            y_coordinate = y_coordinate + 1;
                        end
        
                    elseif (x_coordinate == -10 && y_coordinate ~= 10) && (x_coordinate == -10 && y_coordinate ~= -10) % if the infected and isolated person is on the left boundary, except corners
                    
                        random_number = randi(4);
                        
                        if random_number == 1
                            x_coordinate = x_coordinate + 1;
                        elseif random_number == 2
                            y_coordinate = y_coordinate + 1;
                        elseif random_number == 3
                            x_coordinate = x_coordinate + 1;
                            y_coordinate = y_coordinate + 1;
                        end
               
                    elseif (y_coordinate == -10 && x_coordinate ~= 10) && (y_coordinate == -10 && x_coordinate ~= -10) % if the infected and isolated person is on the bottom boundary, except corners
        
                        random_number = randi(4);
                        
                        if random_number == 1
                            y_coordinate = y_coordinate + 1;
                        elseif random_number == 2
                            x_coordinate = x_coordinate + 1;
                        elseif random_number == 3
                            x_coordinate = x_coordinate + 1;
                            y_coordinate = y_coordinate + 1;
                        end
               
                    else % all the other places on the 20x20 grid
    
                        random_number = randi(4);
                        
                        if random_number == 1
                            x_coordinate = x_coordinate + 1;
                        elseif random_number == 2
                            y_coordinate = y_coordinate + 1;
                        elseif random_number == 3
                            x_coordinate = x_coordinate + 1;
                            y_coordinate = y_coordinate + 1;
                        end
                    end
    
                elseif (x_coordinate == initial_x_coordinate + 1) && (y_coordinate == initial_y_coordinate - 1)
        
                    if x_coordinate == 10 && y_coordinate == -10 %if the infected and isolated person is on the bottom right corner
                    
                        random_number = randi(4);
                        
                        if random_number == 1
                            x_coordinate = x_coordinate - 1;
                        elseif random_number == 2
                            y_coordinate = y_coordinate + 1;
                        elseif random_number == 3
                            x_coordinate = x_coordinate - 1;
                            y_coordinate = y_coordinate + 1;
                        end
            
                    elseif (x_coordinate == 10 && y_coordinate ~= 10) && (x_coordinate == 10 && y_coordinate ~= -10) % if the infected and isolated person is on the right boundary, except corners
                    
                        random_number = randi(4);
                        
                        if random_number == 1
                            x_coordinate = x_coordinate - 1;
                        elseif random_number == 2
                            y_coordinate = y_coordinate + 1;
                        elseif random_number == 3
                            x_coordinate = x_coordinate - 1;
                            y_coordinate = y_coordinate + 1;
                        end
                
                    elseif (y_coordinate == -10 && x_coordinate ~= 10) && (y_coordinate == -10 && x_coordinate ~= -10) % if the infected and isolated person is on the bottom boundary, except corners
        
                        random_number = randi(4);
                        
                        if random_number == 1
                            y_coordinate = y_coordinate + 1;
                        elseif random_number == 2
                            x_coordinate = x_coordinate - 1;
                        elseif random_number == 3
                            x_coordinate = x_coordinate - 1;
                            y_coordinate = y_coordinate + 1;
                        end
               
                    else % all the other places on the 20x20 grid
    
                        random_number = randi(4);
                        
                        if random_number == 1
                            x_coordinate = x_coordinate - 1;
                        elseif random_number == 2
                            y_coordinate = y_coordinate + 1;
                        elseif random_number == 3
                            x_coordinate = x_coordinate - 1;
                            y_coordinate = y_coordinate + 1;
                        end
                    end

                end
            end

        elseif if_isolated == 0

            for steps = 1 : 3
                
                if x_coordinate == 10 && y_coordinate == 10 %if the infected and not isolated person is on the top right corner
                    
                    random_number = randi(4);
                    
                    if random_number == 1
                        x_coordinate = x_coordinate - 1;
                    elseif random_number == 2
                        y_coordinate = y_coordinate - 1;
                    elseif random_number == 3
                        x_coordinate = x_coordinate - 1;
                        y_coordinate = y_coordinate - 1;
                    end
        
                elseif x_coordinate == -10 && y_coordinate == 10 %if the infected and not isolated person is on the top left corner
                    
                    random_number = randi(4);
                    
                    if random_number == 1
                        x_coordinate = x_coordinate + 1;
                    elseif random_number == 2
                        y_coordinate = y_coordinate - 1;
                    elseif random_number == 3
                        x_coordinate = x_coordinate + 1;
                        y_coordinate = y_coordinate - 1;
                    end
                
                elseif x_coordinate == -10 && y_coordinate == -10 %if the infected and not isolated person is on the bottom left corner
                    
                    random_number = randi(4);
                    
                    if random_number == 1
                        x_coordinate = x_coordinate + 1;
                    elseif random_number == 2
                        y_coordinate = y_coordinate + 1;
                    elseif random_number == 3
                        x_coordinate = x_coordinate + 1;
                        y_coordinate = y_coordinate + 1;
                    end
        
                elseif x_coordinate == 10 && y_coordinate == -10 %if the infected and not isolated person is on the bottom right corner
                    
                    random_number = randi(4);
                    
                    if random_number == 1
                        x_coordinate = x_coordinate - 1;
                    elseif random_number == 2
                        y_coordinate = y_coordinate + 1;
                    elseif random_number == 3
                        x_coordinate = x_coordinate - 1;
                        y_coordinate = y_coordinate + 1;
                    end
        
                elseif (x_coordinate == 10 && y_coordinate ~= 10) && (x_coordinate == 10 && y_coordinate ~= -10) % if the infected and not isolated person is on the right boundary, except corners
                    
                    random_number = randi(6);
                    
                    if random_number == 1
                        x_coordinate = x_coordinate - 1;
                    elseif random_number == 2
                        y_coordinate = y_coordinate + 1;
                    elseif random_number == 3
                        y_coordinate = y_coordinate - 1;
                    elseif random_number == 4
                        x_coordinate = x_coordinate - 1;
                        y_coordinate = y_coordinate + 1;
                    elseif random_number == 5
                        x_coordinate = x_coordinate - 1;
                        y_coordinate = y_coordinate - 1;
                    end
        
                elseif (x_coordinate == -10 && y_coordinate ~= 10) && (x_coordinate == -10 && y_coordinate ~= -10) % if the infected and not isolated person is on the left boundary, except corners
                    
                    random_number = randi(6);
                    
                    if random_number == 1
                        x_coordinate = x_coordinate + 1;
                    elseif random_number == 2
                        y_coordinate = y_coordinate + 1;
                    elseif random_number == 3
                        y_coordinate = y_coordinate - 1;
                    elseif random_number == 4
                        x_coordinate = x_coordinate + 1;
                        y_coordinate = y_coordinate + 1;
                    elseif random_number == 5
                        x_coordinate = x_coordinate + 1;
                        y_coordinate = y_coordinate - 1;
                    end
                
                elseif (y_coordinate == 10 && x_coordinate ~= 10) && (y_coordinate == 10 && x_coordinate ~= -10) % if the infected and not isolated person is on the upper boundary, except corners
                    
                    random_number = randi(6);
                    
                    if random_number == 1
                        y_coordinate = y_coordinate - 1;
                    elseif random_number == 2
                        x_coordinate = x_coordinate + 1;
                    elseif random_number == 3
                        x_coordinate = x_coordinate - 1;
                    elseif random_number == 4
                        x_coordinate = x_coordinate - 1;
                        y_coordinate = y_coordinate - 1;
                    elseif random_number == 5
                        x_coordinate = x_coordinate + 1;
                        y_coordinate = y_coordinate - 1;
                    end
                
                elseif (y_coordinate == -10 && x_coordinate ~= 10) && (y_coordinate == -10 && x_coordinate ~= -10) % if the infected and not isolated person is on the bottom boundary, except corners
        
                    random_number = randi(6);
                    
                    if random_number == 1
                        y_coordinate = y_coordinate + 1;
                    elseif random_number == 2
                        x_coordinate = x_coordinate + 1;
                    elseif random_number == 3
                        x_coordinate = x_coordinate - 1;
                    elseif random_number == 4
                        x_coordinate = x_coordinate + 1;
                        y_coordinate = y_coordinate + 1;
                    elseif random_number == 5
                        x_coordinate = x_coordinate - 1;
                        y_coordinate = y_coordinate + 1;
                    end
               
                else % all the other places on the 20x20 grid
    
                    random_number = randi(9);
                    
                    if random_number == 1
                        x_coordinate = x_coordinate + 1;
                    elseif random_number == 2
                        x_coordinate = x_coordinate - 1;
                    elseif random_number == 3
                        y_coordinate = y_coordinate + 1;
                    elseif random_number == 4
                        y_coordinate = y_coordinate -1;
                    elseif random_number == 5
                        x_coordinate = x_coordinate - 1;
                        y_coordinate = y_coordinate + 1;
                    elseif random_number == 6
                        x_coordinate = x_coordinate + 1;
                        y_coordinate = y_coordinate + 1;
                    elseif random_number == 7
                        x_coordinate = x_coordinate - 1;
                        y_coordinate = y_coordinate - 1;
                    elseif random_number == 8
                        x_coordinate = x_coordinate + 1;
                        y_coordinate = y_coordinate - 1;
                    end
                end
            end
        end

        matrix_of_infected_people(infected_person,1) = x_coordinate;
        matrix_of_infected_people(infected_person,2) = y_coordinate;
        
        % infected movement matrix includes :
        % if the person is isolated or not (column 1) + 
        % old x and y coordinates of infected person (column 2 and 3) +
        % new x and y coordinates of infected person (column 4 and 5).

    end
end