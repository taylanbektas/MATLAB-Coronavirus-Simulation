clear
clc

% MODEL PARAMETERS, INITIAL VALUES and EXPLANATIONS

grid_size = 20; % T, grid size
population_size = 240; % N, population size
percentage_initial_infected = 5/100; % delta_1, percentage of infected people initially
infection_probability = 0.5; % p, infection probability in scenario of encounter
percentage_initial_isolated_infected = 50/100; % delta_2 percentage of isolated infected people at the initialization
isolation_probability = 0.5; % q_s, isolation probability of a newly infected person
infection_duration = 30; % M, infection duration (in number of iterations)
vaccination_start_iteration_number = 20; % t_s, iteration number where vaccination starts
infection_probability_healthy_vaccinated = 0.05; % r_s, infection probability of vaccinated healthy people
iterations_between_vaccines = 3; % t_sec, number of iterations between two vaccinations
second_vaccination_probability_healthy = 0.8; % w, second vaccination probability of healthy people
%delta_3 = 1 / (2 * (t_v - 19)); %rate of vaccination of healthy people, where t_v = t_s, t_s + 1, ...
heal_probability_after_M_iterations = 0.95;

matrix_of_infected_people = S1_starting_condition(population_size,percentage_initial_infected,infection_duration);
matrix_of_healthy_people = S2_starting_condition(population_size,percentage_initial_infected);

array_number_of_newly_infected_people = zeros(1,120);
array_total_num_of_infected_people = zeros(1,120);
array_number_of_newly_healed_people = zeros(1,120);
array_total_num_of_healed_people = zeros(1,120);
array_number_of_died_people = zeros(1,120);
array_total_num_of_died_people =zeros(1,120);
array_number_of_people_vaccinated_each_iteration = zeros(1,120);
array_total_num_of_people_vaccinated = zeros(1,120);
array_number_of_infected_people_although_vaccinated_iteration = zeros(1,120);

total_num_of_healed_people_input = 0;
total_num_of_died_people_input = 0;
total_num_of_people_vaccinated_input = 0;
total_num_of_died_although_vaccinated = 0;
rate_of_vaccination_healthy_people_matrix = zeros(1,120);

for iterations_after_vaccination = vaccination_start_iteration_number : 120
    rate_of_vaccination_healthy_people_matrix(iterations_after_vaccination) = 1 / (2 * (iterations_after_vaccination - 19));
end


for iteration = 1:120
   
    matrix_of_healthy_people_beginning_iteration = matrix_of_healthy_people;
    matrix_of_infected_people_beginning_iteration = matrix_of_infected_people;
    number_of_people_vaccinated_iteration_input = 0;


    for i= 20:120
        if(i == iteration)
            [matrix_of_healthy_people_vaccination,number_of_people_vaccinated_iteration_input] = vaccinating_function(matrix_of_healthy_people,rate_of_vaccination_healthy_people_matrix(i));
            matrix_of_healthy_people = matrix_of_healthy_people_vaccination;
        end
    end

    matrix_of_healthy_people_after_movement = healthy_movement_function(matrix_of_healthy_people);

    matrix_of_infected_people_after_movement = infected_movement_function(matrix_of_infected_people);

    matrix_of_encounters = function_who_encounters_infected_healthy(matrix_of_infected_people_after_movement,matrix_of_healthy_people_after_movement);

    [matrix_of_infected_people_after_encountering,matrix_of_healthy_people_after_encountering,number_of_infected_people_although_vaccinated_iteration] = function_matrix_of_infected_healthy_people_after_encountering(matrix_of_encounters,isolation_probability,infection_probability,infection_probability_healthy_vaccinated,infection_duration,matrix_of_infected_people_after_movement,matrix_of_healthy_people_after_movement);

    matrix_of_infected_people_after_encountering(:,3) = matrix_of_infected_people_after_encountering(:,3) -1;   %remaining days of infection -1;

    [matrix_of_healthy_people_after_remaining_day,matrix_of_infected_people_after_remaining_day,died_although_vaccinated_iteration] = function_infected_remaining_day_for_healthy_infected_matrix(matrix_of_healthy_people_after_encountering,matrix_of_infected_people_after_encountering,heal_probability_after_M_iterations);


    
    [number_of_newly_infected_people,total_num_of_infected_people_output,number_of_newly_healed_people,total_num_of_healed_people_output,number_of_died_people,total_num_of_died_people_output,total_num_of_people_vaccinated_output,number_of_people_vaccinated_each_iteration,number_of_infected_people_although_vaccinated] = function_reporting_purposes(matrix_of_healthy_people,matrix_of_infected_people,matrix_of_healthy_people_after_encountering,matrix_of_infected_people_after_encountering,matrix_of_healthy_people_after_remaining_day,matrix_of_infected_people_after_remaining_day,total_num_of_healed_people_input,total_num_of_died_people_input,number_of_people_vaccinated_iteration_input,total_num_of_people_vaccinated_input);


     total_num_of_died_although_vaccinated = total_num_of_died_although_vaccinated + died_although_vaccinated_iteration;

     array_number_of_newly_infected_people(iteration) = number_of_newly_infected_people;
     array_total_num_of_infected_people(iteration)  =total_num_of_infected_people_output;
     array_number_of_newly_healed_people(iteration) = number_of_newly_healed_people;
     array_total_num_of_healed_people(iteration) = total_num_of_healed_people_output;
     array_number_of_died_people(iteration) = number_of_died_people;
     array_total_num_of_died_people(iteration) = total_num_of_died_people_output;
     array_number_of_people_vaccinated_each_iteration(iteration) = number_of_people_vaccinated_each_iteration;
     array_total_num_of_people_vaccinated(iteration) = total_num_of_people_vaccinated_output;
     array_total_num_of_died_although_vaccinated(iteration) = total_num_of_died_although_vaccinated;
     array_number_of_infected_people_although_vaccinated_iteration(iteration) = number_of_infected_people_although_vaccinated_iteration;



     total_num_of_healed_people_input = total_num_of_healed_people_output;
     total_num_of_died_people_input = total_num_of_died_people_output;
     total_num_of_people_vaccinated_input = total_num_of_people_vaccinated_output;

     matrix_of_healthy_people = matrix_of_healthy_people_after_remaining_day;
     matrix_of_infected_people = matrix_of_infected_people_after_remaining_day;

end


it = linspace(1,120,120);

figure 
plot(it,array_number_of_newly_infected_people,'--gs','LineWidth',2, 'MarkerSize',3,'MarkerEdgeColor','b','MarkerFaceColor',[0.5,0.5,0.5]);
title("Number of Newly Infected People in Each Iteration");
ylabel("Number of Newly Infected People");
xlabel("Iteration Number");

figure
plot(it,array_number_of_newly_infected_people);
title("Number of Newly Infected People in Each Iteration");
ylabel("Number of Newly Infected People");
xlabel("Iteration Number");

%%%
figure 
plot(it,array_total_num_of_infected_people,'--gs','LineWidth',2, 'MarkerSize',3,'MarkerEdgeColor','b','MarkerFaceColor',[0.5,0.5,0.5]);
title("Total Number of Infected People in Each Iteration");
ylabel("Total Number of Infected People");
xlabel("Iteration Number");

figure
plot(it,array_total_num_of_infected_people);
title("Total Number of Infected People in Each Iteration");
ylabel("Total Number of Infected People");
xlabel("Iteration Number");
%%%


figure 
plot(it,array_number_of_newly_healed_people,'--gs','LineWidth',2, 'MarkerSize',3,'MarkerEdgeColor','b','MarkerFaceColor',[0.5,0.5,0.5]);
title("Number of Newly Healed People in Each Iteration");
ylabel("Number of Newly Healed People");
xlabel("Iteration Number");

figure
plot(it,array_number_of_newly_healed_people);
title("Number of Newly Healed People in Each Iteration");
ylabel("Number of Newly Healed People");
xlabel("Iteration Number");

%%%

figure 
plot(it,array_total_num_of_healed_people,'--gs','LineWidth',2, 'MarkerSize',3,'MarkerEdgeColor','b','MarkerFaceColor',[0.5,0.5,0.5]);
title("Total Number of Healed People in Each Iteration");
ylabel("Total Number of Healed People");
xlabel("Iteration Number");

figure
plot(it,array_total_num_of_healed_people);
title("Total Number of Healed People in Each Iteration");
ylabel("Total Number of Healed People");
xlabel("Iteration Number");

%%%

figure 
plot(it,array_number_of_died_people,'--gs','LineWidth',2, 'MarkerSize',3,'MarkerEdgeColor','b','MarkerFaceColor',[0.5,0.5,0.5]);
title("Number of People Died in Each Iteration");
ylabel("Number of People Died");
xlabel("Iteration Number");

figure
plot(it,array_number_of_died_people);
title("Number of People Died in Each Iteration");
ylabel("Number of People Died");
xlabel("Iteration Number");
%%%

figure 
plot(it,array_total_num_of_died_people,'--gs','LineWidth',2, 'MarkerSize',3,'MarkerEdgeColor','b','MarkerFaceColor',[0.5,0.5,0.5]);
title("Total Number of People Died in Each Iteration");
ylabel("Total Number of People Died");
xlabel("Iteration Number");

figure
plot(it,array_total_num_of_died_people);
title("Total Number of People Died in Each Iteration");
ylabel("Total Number of People Died");
xlabel("Iteration Number");

%%%

figure 
plot(it,array_number_of_people_vaccinated_each_iteration,'--gs','LineWidth',2, 'MarkerSize',3,'MarkerEdgeColor','b','MarkerFaceColor',[0.5,0.5,0.5]);
title("Number of People Vaccinated in Each Iteration");
ylabel("Number of People Vaccinated");
xlabel("Iteration Number");

figure
plot(it,array_number_of_people_vaccinated_each_iteration);
title("Number of People Vaccinated in Each Iteration");
ylabel("Number of People Vaccinated");
xlabel("Iteration Number");

%%%
figure 
plot(it,array_total_num_of_people_vaccinated,'--gs','LineWidth',2, 'MarkerSize',3,'MarkerEdgeColor','b','MarkerFaceColor',[0.5,0.5,0.5]);
title("Total Number of People Vaccinated in Each Iteration");
ylabel("Total Number of People Vaccinated");
xlabel("Iteration Number");

figure
plot(it,array_total_num_of_people_vaccinated);
title("Total Number of People Vaccinated in Each Iteration");
ylabel("Total Number of People Vaccinated");
xlabel("Iteration Number");

%%%

figure 
plot(it,array_number_of_infected_people_although_vaccinated_iteration,'--gs','LineWidth',2, 'MarkerSize',3,'MarkerEdgeColor','b','MarkerFaceColor',[0.5,0.5,0.5]);
title("Number of Infected People Although Vaccinated in Each Iteration");
ylabel("Number of Infected People Although Vaccinated");
xlabel("Iteration Number");

figure
plot(it,array_number_of_infected_people_although_vaccinated_iteration);
title("Number of Infected People Although Vaccinated in Each Iteration");
ylabel("Number of Infected People Although Vaccinated");
xlabel("Iteration Number");

%%%

figure 
plot(it,array_total_num_of_died_although_vaccinated,'--gs','LineWidth',2, 'MarkerSize',3,'MarkerEdgeColor','b','MarkerFaceColor',[0.5,0.5,0.5]);
title("Total Number of People Died Although Vaccinated in Each Iteration");
ylabel("Total Number of People Died Although Vaccinated");
xlabel("Iteration Number");

figure
plot(it,array_total_num_of_died_although_vaccinated);
title("Total Number of People Died Although Vaccinated in Each Iteration");
ylabel("Total Number of People Died Although Vaccinated");
xlabel("Iteration Number");







