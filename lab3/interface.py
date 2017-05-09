import sys
from queries import *

COMMAND_COUNT = 11
running = True

cursor = connect()
if cursor is None:
	print("Error: Unable to connect to the database")
	sys.exit()

while running:
	print("\n==============IMDB COMMAND MENU===============")
 
	print("| 1. HOW MNY EPISODES ARE IN A SEASON                  |")
	print("| 2. GET AVG CAST SIZE OF MOVIES FROM 1990    	      |")
	print("| 3. MOST COMMON LAST NAME AMONG ACTORS                |")
	print("| 4. HOW MANY TIMES ACTOR ACTS IN SERIES/MOVIE         |")
	print("| 5. WHICH PARTICIPATE IN BOTH SERIES/MOVIES           |")
	print("| 6. # OF MOVIES THAT APPEAR EACH YEAR SINCE 1990      |")
	print("| 7. WHAT YEAR A GIVEN GENRE IS MOST POPULAR           |")
	print("| 8. AVERAGE EPISODES PER SEASON                   	  |")
	print("| 9. AVERAGE NUMBER OF KEYWORDS FOR A MOVIE            |")
	print("| 10. WHICH ACTORS HAVE ACTED THE MOST                 |")
	print("| 11. EXIT                                             |")

	print("==============================================\n")
	choice = input("Select a Option: ")

	try:
		choice = int(choice)
		if choice > COMMAND_COUNT:
			raise ValueError
	except ValueError as err:
		print('Not a Valid Command.')
		continue

	if choice == 1:
		query_one(cursor)
	elif choice == 2:
		query_two(cursor)
	elif choice == 3:
		query_three(cursor)
	elif choice == 4:
		query_four(cursor)
	elif choice == 5:
		query_five(cursor)
	elif choice == 6:
		query_six(cursor)
	elif choice == 7:
		query_seven(cursor)
	elif choice == 8:
		query_eight(cursor)
	elif choice == 9:
		query_nine(cursor)
	elif choice == 10:
		query_ten(cursor)
	elif choice == 11:
		print('Exiting Command Menu...')
running = False
