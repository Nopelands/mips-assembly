def recfib(n):
    if n == 0:
        return 0
    elif n == 1:
        return 1
    else:
        return recfib(n-1) + recfib(n-2)
    
print(recfib(6))
