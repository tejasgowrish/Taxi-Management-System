import mysql.connector
import random
from datetime import datetime, timedelta

conn = mysql.connector.connect(
    host="localhost",
    user="root",
    password="root123",
    database="DBT25_A1_PES1UG22CS650_TEJAS_GOWRISH"
)
cursor = conn.cursor()

# Fetch all valid booking_ids and corresponding ride_costs from ride_bookings table
cursor.execute("SELECT booking_id, ride_cost, booking_timestamp FROM ride_bookings")
booking_data = cursor.fetchall()  # List of tuples

if not booking_data:
    print("Error: No ride bookings found in the database!")
    conn.close()
    exit()

payment_methods = ["cash", "card", "upi", "net-banking", "coupon"]
payment_statuses = ["processing", "completed", "failed"]


payment_data = []

for booking_id, ride_cost, booking_timestamp in booking_data:
    if ride_cost == 0.00:
        continue  # Skip payments for canceled rides

    payment_method = random.choice(payment_methods)
    payment_status = random.choice(payment_statuses)

    payment_timestamp = booking_timestamp + timedelta(minutes=random.randint(5, 120))  # payment timestamp after booking timestamp

    payment_data.append((booking_id, ride_cost, payment_method, payment_status, payment_timestamp))

cursor.executemany("""
    INSERT INTO payments (booking_id, ride_cost, payment_method, payment_status, payment_timestamp)
    VALUES (%s, %s, %s, %s, %s)
""", payment_data)


conn.commit()
cursor.close()
conn.close()

print(f"{len(payment_data)} payment records inserted successfully!")
