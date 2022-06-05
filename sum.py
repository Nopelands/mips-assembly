def recsum(a, b):
    if a > b:
        return 1
    elif a == b:
        return a
    else:
        return b + recsum(a, b-1)
    
print(recsum(3, 9))
 
