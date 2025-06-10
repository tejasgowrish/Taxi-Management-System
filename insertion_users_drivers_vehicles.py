import mysql.connector
import random
from random import randint, randrange
import string
from faker import Faker
from password_generator import PasswordGenerator


faker = Faker() # faker - generate fake data
pwo = PasswordGenerator()   # generate random password

# Connect to db
conn = mysql.connector.connect(
    host="localhost",
    user="root",  
    password="root123",
    database="DBT25_A1_PES1UG22CS650_TEJAS_GOWRISH"
)
cursor = conn.cursor()

# ***********************************************************************************************************************

# Insert users

num_users = 1500
users_data = []

for i in range(num_users):
    user_name = faker.name()
    password = pwo.generate()   # generate random password
    email = faker.email()
    phone_no = ''.join(random.choices(string.digits, k=10))  # 10-digit phone number
    users_data.append((user_name, password, email, phone_no))

cursor.executemany(
    """
    INSERT INTO users (user_name, password, email, phone_no)
    VALUES (%s, %s, %s, %s)
    """, users_data)

print(f"{num_users} users inserted successfully!")



# ***********************************************************************************************************************

# Insert drivers

num_drivers = 350
drivers_data = []

for i in range(1, num_drivers + 1):
    driver_name = faker.name()
    # vehicle_id = i  # 1:1 mapping b/w drivers and vehicles
    driver_status = random.choice(["available", "unavailable"])
    star_rating = random.randint(1, 5)  
    # drivers_data.append((driver_name, vehicle_id, driver_status, star_rating))
    drivers_data.append((driver_name, driver_status, star_rating))

# cursor.executemany(
#     """
#     INSERT INTO drivers (driver_name, vehicle_id, driver_status, star_rating)
#     VALUES (%s, %s, %s, %s)
#     """, drivers_data)
cursor.executemany(
    """
    INSERT INTO drivers (driver_name, driver_status, star_rating)
    VALUES (%s, %s, %s)
    """, drivers_data)

# Fetch driver IDs after insertion
cursor.execute("SELECT driver_id FROM drivers")
driver_ids = [row[0] for row in cursor.fetchall()]  # Extract driver IDs

print(f"{num_drivers} drivers inserted successfully")


# ***********************************************************************************************************************

# insert vehicles

num_vehicles = 350
vehicles_data = []

vehicle_models = {"Tata Indica" : 4, "Tata Indigo" : 4, "Tata Indigo Manza" : 4,
                  "Suzuki Swift" : 4, "Suzuki Swift Dezire" : 4, "Suzuki Baleno" : 4, "Suzuki Ciaz" : 4, "Suzuki Ertiga" : 7,
                  "Hyundai Aura" : 4, "Hyundai Creta" : 7, "Hyundai i10" : 4, "Hyundai i20" : 4}

vehicle_statuses = ["active", "inactive", "maintenance"]

for i in range(1, num_vehicles + 1):
    vehicle_number = f"KA{random.randint(10,99)}{random.choice(string.ascii_uppercase)}{random.randint(1000,9999)}"
    vehicle_model = random.choice(list(vehicle_models.keys()))
    seating_capacity = vehicle_models[vehicle_model]
    vehicle_status = random.choice(vehicle_statuses)
    driver_id = driver_ids[i - 1]
    vehicles_data.append((vehicle_number, driver_id, vehicle_model, seating_capacity, vehicle_status))

cursor.executemany(
    """
    INSERT INTO vehicles (vehicle_number, driver_id, vehicle_model, seating_capacity, vehicle_status)
    VALUES (%s, %s, %s, %s, %s)
    """, vehicles_data)


print(f"{num_vehicles} vehicles inserted successfully")



# ***********************************************************************************************************************

conn.commit()
cursor.close()
conn.close()

print("All data inserted successfully")
