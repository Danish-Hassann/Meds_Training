def exp(num,iterations = 100):
    factorial = 1
    result = 1
    for i in range(1,iterations):
        factorial *= i
        result += (num ** i)/factorial
    return result 
        
print(exp(-4))