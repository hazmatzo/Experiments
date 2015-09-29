from finding_people_within_a_radius import *

scriptdir = os.path.dirname(os.path.abspath(__file__))

result = run(scriptdir, "test_customers.txt")

if len(run(scriptdir, "test_customers.txt")) == 2:
    print "Right number of records for test_customers."
else:
    print "Incorrect number of records."

if result[0]["user_id"] == 1:
    print "It correctly grabs the first record, which is within 100."
else:
    print "It incorrectly does not grab the first record, which is about 30 miles away."

if result[1]["user_id"] == 2:
    print "It correctly grabs the second record, which is 99 miles away."
else:
    print "It incorrectly does not grab the second record, which is 99 miles away."
