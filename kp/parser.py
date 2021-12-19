gedcom = open('tree.ged', 'r' )
prolog = open('tree.pl', 'w')
name = dict()
sex = dict()

for line in gedcom:
	if "INDI" in line:
		ID = line [5:10]
	elif "NAME" in line:
		FIO = line [7:-2]
		FIO = FIO.replace('/', '')
	elif "_UID" in line:
		name[ID] = FIO
	elif "SEX" in line:
		sex[ID] = line[6]
	elif "WIFE" in line:
		mother = line [10:15]
	elif "HUSB" in line:
		father = line [10:15]
	elif "CHIL" in line:
		child = line [10:15]
		prolog.write("parents( '" + name[child] + "', '" + name[father] + "', '" + name[mother] + "').\n")


for key in name:
	prolog.write("sex('" + name[key] + "', '" + sex[key] + "').\n")

gedcom.close()
prolog.close()