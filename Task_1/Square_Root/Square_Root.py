def squareRoot(num,iterations = 10):
    if num < 0:
        return None
    currentGuess = num / 2
    for i in range(iterations):
        newGuess = 0.5 * (currentGuess + num/currentGuess)
        currentGuess = newGuess
    return currentGuess