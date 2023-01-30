function matrix_of_healthy_people_after_movement = healthy_movement_function(matrix_of_healthy_people)

    array_healthy = size(matrix_of_healthy_people);
    num_healthy_people = array_healthy(1);

    for healthy_person = 1 : num_healthy_people % loop for number of healthy people

        x_coordinate = matrix_of_healthy_people(healthy_person,1); % healthy person's x coordinate
        y_coordinate = matrix_of_healthy_people(healthy_person,2); % healthy person's y coordinate
        before_infected = matrix_of_healthy_people(healthy_person,3);
        is_vaccinated = matrix_of_healthy_people(healthy_person,4);
        infection_prob = matrix_of_healthy_people(healthy_person,5);
        day_after_first_vaccine = matrix_of_healthy_people(healthy_person,6);
        is_infected_after_vacc = matrix_of_healthy_people(healthy_person,7);

        for steps = 1 : 3
            
            if x_coordinate == 10 && y_coordinate == 10 %if the healthy person is on the top right corner
                
                random_number = randi(4);
                
                if random_number == 1 
                    x_coordinate = x_coordinate - 1; %left
                elseif random_number == 2
                    y_coordinate = y_coordinate - 1; %down
                elseif random_number == 3 
                    x_coordinate = x_coordinate - 1;
                    y_coordinate = y_coordinate - 1; %left + down
                end
                % if random_number == 4 --> no movement
    
            elseif x_coordinate == -10 && y_coordinate == 10 %if the healthy person is on the top left corner
                
                random_number = randi(4);
                
                if random_number == 1
                    x_coordinate = x_coordinate + 1; %right
                elseif random_number == 2
                    y_coordinate = y_coordinate - 1; %down
                elseif random_number == 3
                    x_coordinate = x_coordinate + 1; 
                    y_coordinate = y_coordinate - 1; %right down
                end
            
            elseif x_coordinate == -10 && y_coordinate == -10 %if the healthy person is on the bottom left corner
                
                random_number = randi(4);
                
                if random_number == 1
                    x_coordinate = x_coordinate + 1; %right
                elseif random_number == 2
                    y_coordinate = y_coordinate + 1; %upper
                elseif random_number == 3
                    x_coordinate = x_coordinate + 1;
                    y_coordinate = y_coordinate + 1; %right upper
                end
    
            elseif x_coordinate == 10 && y_coordinate == -10 %if the healthy person is on the bottom right corner
                
                random_number = randi(4);
                
                if random_number == 1
                    x_coordinate = x_coordinate - 1; %left
                elseif random_number == 2
                    y_coordinate = y_coordinate + 1; %upper
                elseif random_number == 3
                    x_coordinate = x_coordinate - 1;
                    y_coordinate = y_coordinate + 1; %left upper
                end
    
            elseif (x_coordinate == 10 && y_coordinate ~= 10) && (x_coordinate == 10 && y_coordinate ~= -10) % if the healthy person is on the right boundary, except corners
                
                random_number = randi(6);
                
                if random_number == 1
                    x_coordinate = x_coordinate - 1; %left 
                elseif random_number == 2 
                    y_coordinate = y_coordinate + 1; %upper
                elseif random_number == 3
                    y_coordinate = y_coordinate - 1; %down
                elseif random_number == 4
                    x_coordinate = x_coordinate - 1; %left_upper
                    y_coordinate = y_coordinate + 1;
                elseif random_number == 5
                    x_coordinate = x_coordinate - 1; %left_down
                    y_coordinate = y_coordinate - 1;
                end
    
            elseif (x_coordinate == -10 && y_coordinate ~= 10) && (x_coordinate == -10 && y_coordinate ~= -10) % if the healthy person is on the left boundary, except corners
                
                random_number = randi(6);
                
                if random_number == 1
                    x_coordinate = x_coordinate + 1; %right
                elseif random_number == 2
                    y_coordinate = y_coordinate + 1; %upper
                elseif random_number == 3
                    y_coordinate = y_coordinate - 1; %down
                elseif random_number == 4
                    x_coordinate = x_coordinate + 1;%right_upper
                    y_coordinate = y_coordinate + 1;
                elseif random_number == 5
                    x_coordinate = x_coordinate + 1; %right_down
                    y_coordinate = y_coordinate - 1;
                end
            
            elseif (y_coordinate == 10 && x_coordinate ~= 10) && (y_coordinate == 10 && x_coordinate ~= -10) % if the healthy person is on the upper boundary, except corners
                
                random_number = randi(6);
                
                if random_number == 1
                    y_coordinate = y_coordinate - 1; %down
                elseif random_number == 2
                    x_coordinate = x_coordinate + 1; %right
                elseif random_number == 3
                    x_coordinate = x_coordinate - 1; %left
                elseif random_number == 4
                    x_coordinate = x_coordinate - 1;%down-left
                    y_coordinate = y_coordinate - 1;
                elseif random_number == 5
                    x_coordinate = x_coordinate + 1;%right-down
                    y_coordinate = y_coordinate - 1;
                end
            
            elseif (y_coordinate == -10 && x_coordinate ~= 10) && (y_coordinate == -10 && x_coordinate ~= -10) % if the healthy person is on the bottom boundary, except corners
    
                random_number = randi(6);
                
                if random_number == 1
                    y_coordinate = y_coordinate + 1;%upper
                elseif random_number == 2
                    x_coordinate = x_coordinate + 1;%right
                elseif random_number == 3
                    x_coordinate = x_coordinate - 1;%left
                elseif random_number == 4
                    x_coordinate = x_coordinate + 1;%upper-right
                    y_coordinate = y_coordinate + 1;
                elseif random_number == 5
                    x_coordinate = x_coordinate - 1;%upper-left
                    y_coordinate = y_coordinate + 1;
                end
           
            else % all the other places on the 20x20 grid

                random_number = randi(9);
                
                if random_number == 1
                    x_coordinate = x_coordinate + 1;%right
                elseif random_number == 2
                    x_coordinate = x_coordinate - 1;%left
                elseif random_number == 3
                    y_coordinate = y_coordinate + 1;%upper
                elseif random_number == 4
                    y_coordinate = y_coordinate -1;%down
                elseif random_number == 5
                    x_coordinate = x_coordinate - 1;%left_upper
                    y_coordinate = y_coordinate + 1;
                elseif random_number == 6
                    x_coordinate = x_coordinate + 1;%upper-right
                    y_coordinate = y_coordinate + 1;
                elseif random_number == 7
                    x_coordinate = x_coordinate - 1;
                    y_coordinate = y_coordinate - 1;%down-left
                elseif random_number == 8
                    x_coordinate = x_coordinate + 1;%right-down
                    y_coordinate = y_coordinate - 1;
                end
            end
        end

        matrix_of_healthy_people_after_movement(healthy_person,1) = x_coordinate; %output
        matrix_of_healthy_people_after_movement(healthy_person,2) = y_coordinate; %output
        matrix_of_healthy_people_after_movement(healthy_person,3) = before_infected;
        matrix_of_healthy_people_after_movement(healthy_person,4) = is_vaccinated;
        matrix_of_healthy_people_after_movement(healthy_person,5) = infection_prob;
        matrix_of_healthy_people_after_movement(healthy_person,6) = day_after_first_vaccine;
        matrix_of_healthy_people_after_movement(healthy_person,7) = is_infected_after_vacc;
        

        % the updated matrix of healthy people includes :
        % the new x and y coordinates of the healthy person (column 1 and 2)+
        % if the person got infected before (column 3)
    end
end