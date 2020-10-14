import sys, string, argparse
from optparse import OptionParser
string = ''


full_args = sys.argv

arg_list = full_args[1:]

parser = OptionParser()

parser.add_option("-l", type = "int", dest = "length")
parser.add_option("-d", action = "store_true", dest = "derive")
(options, args) = parser.parse_args()



for line in open(sys.argv[2], 'r'):
    string += line
    
lst = string.split('\n')
character = string.split()[1]

dc = {}

count = 0


newlst = []

count = 0


while count in range(len(lst)):
    temp = lst[count]
    templst = temp.split(' ' + character + ' ')
    if templst[0] in dc:
        pass
        dc[templst[0]].append(templst[1])
    else:
        dc[templst[0]] = [templst[1]]
    
    count +=1
   

something = string.split()
init = something[0]
derivlist = []
derivlist.append(init)

worklist = []
worklist.append([init,derivlist])

total_str = 0
while len(worklist) != 0:
    t = (worklist.pop(0))
    foo = t[0].split(' ')
    
   
    if len(foo) > options.length:
        continue
    if len(foo) == options.length:
        count = 0 
        for k in range(len(foo)):
            if foo[k] not in dc:
                count +=1
        if count == len(foo):
            total_str += 1
            if(options.derive == True):
                print(init + " " + character + " " + t[1][1] + ' \n')
                for f in range(2 , len(t[1])):
                    for x in range(len(init)):
                        print(' ', end = '')
                    print(" " + character + " " + t[1][f] + ' \n')
            else:
                print(t[0])

        
    c = 0
    for j in range(len(foo)):
        if foo[j] not in dc:
                c +=1
        
    if len(foo) - 1 < c:
        c = len(foo) - 1
    
    

            #for j in range(len(foo)):
                #pass
    if foo[c] not in dc:
        continue
    

    for k in range(len(dc[foo[c]])):
        derivlist = t[1][0:]
        tmp = t[0].replace(foo[c], dc[foo[c]][k], 1)
        derivlist.append(tmp)
        worklist.append([tmp, derivlist])
        
    
                
            
            
    #tmp1 = tmp.split()
    #t[1].append(tmp)
    #print(tmp1)    


print("Number of strings generated: " + str(total_str))



