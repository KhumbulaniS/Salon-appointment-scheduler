# Salon-appointment-scheduler
Developing a Salon appointment scheduler for booking saloon services online and adding the booking and customer information to the database using Bash and SQL.


## Salon Appointment Scheduler

The Salon appointment scheduler is a simple program that provides the user with saloon services that are offered.The user will be opted to book a prefered service, if service is not available or incorrect input, the program will kindly ask again for an input.

if the service chosen is available, the user will be allowed to continue with their booking by inputing their phone number. If the number does not exists in the salon data base, the user will be asked to register by entering their name. The program will then asked for time slot and display the confimation for the booking.

The following are the key SQL concepts utilized in this project;

- Use of DDL (Data Manipulation Language) such as CREATE,ALTER,DROP and TRUNCATE to create the database
- All tables created have a primary key column that automatically increments
- All tables created have a foreign keys which link the tables hence creating a Data Model

# How to Run
- First, run the SQL dump file called "salon.sql" in order to create a database.
- Then open the salon.sh file to run the program.

## Acknowledgements

Thank you to www.freecodecamp.org for the opportunity to work on this amazing project.

