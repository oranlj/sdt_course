words = open("words.txt", encoding="utf-8").read().split()
unique = set()
for word in words:
    if word not in unique:
        unique.add(word)
print("count=", len(unique))
