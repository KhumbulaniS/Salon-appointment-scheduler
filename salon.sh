#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"
#get services
  SERVICES=$($PSQL "SELECT service_id,name FROM services")

echo -e "\n// ~~~~~~ Ongezwa's hair salon services ~~~~~~ //"

SERVICE_MENU() {
  
  #list of services offered
  echo -e "\nWelcome Ongezwa's hair salon services, how can we help you today?"

  echo -e "$SERVICES" | while read SERVICE_ID BAR NAME
  do
    echo "$SERVICE_ID) $NAME"
  done
  #total number of rows
  NUM_ROWS=$($PSQL "SELECT COUNT(*) FROM services")

  #Ask for service to be booked
  echo -e "\nWhich service would you like to book?"
  read SERVICE_ID_SELECTED

  #If input is not a number
  while [[ ! $SERVICE_ID_SELECTED =~ ^[1-7]$ ]]
  do
  # show service list again
      echo -e "\nI could not find that service. What would you like today?"
  
      echo -e "$SERVICES" | while read SERVICE_ID BAR NAME
      do
      echo "$SERVICE_ID) $NAME"
      done
  #prompt input again
      read SERVICE_ID_SELECTED
  done

  #Ask for phone number
  echo -e "\nEnter phone number to proceed with the booking:"
  read CUSTOMER_PHONE
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")

  #if phone number not 
      if [[ -z $CUSTOMER_NAME ]]
      then
      #get new customer name
        echo -e "\nI don't have a record for that phone number, what's your name?"
        read CUSTOMER_NAME
      #insert new customer
      INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(phone,name) VALUES ('$CUSTOMER_PHONE','$CUSTOMER_NAME')")
      fi
  #get appointment time (hh:mm)
  echo -e "\nWhat time (hh:mm) would you like your appoint me be :"
  read SERVICE_TIME
  #get customer id
  CUSTOMER_ID=$($PSQL " SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
  #insert into appointments
  INSERT_APPOINTMENT_RESULTS=$($PSQL "INSERT INTO appointments (customer_id,service_id,time) VALUES ($CUSTOMER_ID,$SERVICE_ID_SELECTED,'$SERVICE_TIME')")
  #Send to main menu
  SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")
  echo -e "\nI have put you down for a $(echo $SERVICE_NAME | sed -r 's/^ *| *$//g') at $SERVICE_TIME, $(echo $CUSTOMER_NAME | sed -r 's/^ *| *$//g')."

}



SERVICE_MENU
