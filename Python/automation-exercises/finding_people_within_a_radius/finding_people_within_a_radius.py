import re
import os
import json
import math
import sys

def convert_to_radian(degrees):
    return (float(degrees) * math.pi) / 180

def absolute_difference(longitude1, longitude2):
    return math.fabs(longitude1 - longitude2)

def central_angle(latitude1, longitude1, latitude2, longitude2):
    # formula:
    # absdiff = absolute_difference(long1, long2)
    # arccos(sin(lat1) * sin(lat2) + cos(lat1) * cos(lat2) * cos(absdiff))
    absolute_diff = absolute_difference(longitude1, longitude2)
    central_angle = math.acos(math.sin(latitude1)*math.sin(latitude2) + 
        math.cos(latitude1)*math.cos(latitude2)*math.cos(absolute_diff))
    return central_angle

def distance(latitude1, longitude1, latitude2, longitude2):
    # formula:
    # distance = radius * central_angle
    radius_of_the_earth = 3958.761
    distance = radius_of_the_earth * central_angle(latitude1, longitude1, latitude2, longitude2)
    return distance

def run(dir, file):
    with open(os.path.join(dir, file)) as input_file:

        output = []
        lat1 = convert_to_radian("53.3381985")
        long1 = convert_to_radian("-6.2592576")

        for line in input_file:
            record = json.loads(line)
            lat2 = convert_to_radian(record["latitude"])
            long2 = convert_to_radian(record["longitude"])
            dist = distance(lat1, long1, lat2, long2)
            if float(dist) < 100:
                output.append(record)

        return output

if __name__ == "__main__":
    scriptdir = os.path.dirname(os.path.abspath(__file__))
    filename = './customers.txt'

    new_file = open('customers_within_100_miles.txt', 'w')
    customers = ""
    for customer in run(scriptdir, filename):
        customers = customers + customer["name"] + " - " + str(customer["user_id"]) + "\n"
    new_file.write(customers)
    new_file.close()
