def cycle_length_python(d):
    seen = {}
    rem = 1 % d
    pos = 0
    while rem != 0 and rem not in seen:
        seen[rem] = pos
        rem = (rem * 10) % d
        pos += 1
    return 0 if rem == 0 else pos - seen[rem]

def euler26_python():
    bestd = 0
    bestl = 0
    for d in range(2,1000):
        l = cycle_length_python(d)
        if l > bestl:
            bestl = l
            bestd = d
    return bestd