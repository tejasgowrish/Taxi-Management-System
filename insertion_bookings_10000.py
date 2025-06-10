import mysql.connector
import random
from datetime import datetime, timedelta

# Connect to database
conn = mysql.connector.connect(
    host="localhost",
    user="root",
    password="root123",
    database="DBT25_A1_PES1UG22CS650_TEJAS_GOWRISH"
)
cursor = conn.cursor()

# Generate 10,000 ride bookings
locations = ['MG Road', 'Indiranagar', 'Kormangala', 'Whitefield', 'Hebbal', 'Silk Board', 'Marathahalli', 'Jayanagar', 'Yelahanka', 
             'Electronic City', 'KR Puram', 'Banashankari', 'HSR Layout', 'BTM Layout', 'Shivajinagar', 'Malleshwaram', 'Domlur', 
             'Vijayanagar', 'Peenya', 'Basavangudi','Bannerghatta Road', 'Old Airport Road', 'Bellandur', 'CV Raman Nagar', 
             'Kammanahalli', 'Kalyan Nagar', 'Rajajinagar', 'Sarjapur Road', 'Ulsoor', 'Yeshwantpur', 'Airport Road', 'Banaswadi', 
             'Bommanahalli', 'Brookefield', 'Cox Town', 'Devanahalli', 'HBR Layout', 'Hosur Road', 'Jakkur', 'Kaggadasapura',
             'Kengeri', 'Kumaraswamy Layout', 'Langford Town', 'Majestic', 'Nagarbhavi', 'Nagawara', 'New BEL Road', 
             'Rajarajeshwari Nagar', 'Ramamurthy Nagar', 'Sahakar Nagar', 'Sanjay Nagar', 'Thippasandra', 'Tumkur Road', 'Varthur', 
             'Vasanth Nagar', 'Vidyaranyapura', 'Vijaya Bank Layout', 'Wilson Garden', 'Yelahanka New Town', 'Yeshwantpur',
             'Anjanapura', 'Attibele', 'Begur', 'Begur Road', 'Bilekahalli', 'Bommasandra', 'Chandapura', 'Chikkalasandra', 
             'Doddathoguru', 'Gottigere', 'Hosakerehalli', 'Hulimavu', 'Jigani', 'Kanakapura Road', 'Konanakunte', 'Kudlu Gate', 
             'Madiwala', 'Mahadevapura', 'Nagarbhavi', 'Padmanabhanagar', 'Hegade Nagar', 'Hennur', 'Hoskote', 'Hulimavu', 'Huskur', 
             'Kadugodi', 'Kaggalipura', 'Kodichikkanahalli', 'Kothanur', 'Kudlu', 'Kumbalgodu', 'Marsur', 'Nelamangala', 'Panathur', 
             'Rachenahalli', 'Ramanagara', 'Rayasandra', 'Sompura', 'Subramanyapura', 'Thubarahalli', 'Tindlu', 'Tippasandra']

for i in range(20000):
    user_id = random.randint(1, 1500)
    driver_id = random.randint(1, 350)
    pickup_location = random.choice(locations)
    drop_location = random.choice(locations)
    booking_status = random.choice(["confirmed", "pending", "on-the-way", "arrived", "canceled"])
    ride_cost = round(random.uniform(50, 500), 2) if(pickup_location != drop_location and booking_status != 'canceled') else 0.00
    booking_timestamp = datetime.now() - timedelta(days=random.randint(0, 30))

    query = "INSERT INTO ride_bookings (user_id, driver_id, ride_cost, pickup_location, drop_location, booking_status, booking_timestamp) VALUES (%s, %s, %s, %s, %s, %s, %s)"
    values = (user_id, driver_id, ride_cost, pickup_location, drop_location, booking_status, booking_timestamp)

    cursor.execute(query, values)

# Commit and close connection
conn.commit()
cursor.close()
conn.close()

print("200000 ride bookings inserted successfully!")
