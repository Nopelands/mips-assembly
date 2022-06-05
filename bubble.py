string = list("abcdef")
loop = True
while loop:
    loop = False
    for i in range(0, len(string) - 1):
        if string[i] < string[i+1]:
            loop = True
            aux = string[i]
            string[i] = string[i+1]
            string[i+1] = aux
print("".join(string))
