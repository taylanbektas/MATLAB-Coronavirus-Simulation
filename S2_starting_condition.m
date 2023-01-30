function [matrix_of_healthy_people] = S2_starting_condition(population_size,percentage_initial_infected)

    number_of_infected_people = population_size * percentage_initial_infected; % number of infected people initially
    number_of_healthy_people = population_size-number_of_infected_people;
    
    matrix_of_healthy_people = [];
    
    for i = 1:number_of_healthy_people
        x_coordinate = randi([-10 10],1,1);
        y_coordinate = randi([-10 10],1,1);
        before_infected = 0;
        is_vaccinated = 0;
        new_row = [x_coordinate,y_coordinate,before_infected, is_vaccinated];
        matrix_of_healthy_people = [matrix_of_healthy_people;new_row];
    end
    
    %from now on, the code is written to achieve the fact that each cell must
    %contain only one person.
    
    control = 1;
    
    while control == 1
    
        control = 0;
    
        for i =1:number_of_healthy_people
           
            for j = i+1:number_of_healthy_people
                
                if (matrix_of_healthy_people(i,1) == matrix_of_healthy_people(j,1) )&& (matrix_of_healthy_people(i,2) == matrix_of_healthy_people(j,2))
                    x_coordinate = randi([-10 10],1,1);
                    y_coordinate = randi([-10 10],1,1);
                    
                    matrix_of_healthy_people(j,1) = x_coordinate;
                    matrix_of_healthy_people(j,2) = y_coordinate;
                    
                    control = 1;
        
                end
            end
        end
    end
end