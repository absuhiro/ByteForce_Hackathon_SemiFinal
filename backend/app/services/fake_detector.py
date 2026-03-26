import random

def detect_fake_review(text: str, rating: int):
    text_lower = text.lower()
    score = 0

    # 1. Promotional words
    promo_words = ["best ever", "100% recommend", "must buy", "amazing!!!"]
    if any(word in text_lower for word in promo_words):
        score += 0.4

    # 2. VERY short reviews (strong signal)
    word_count = len(text.split())
    if word_count <= 3:
        score += 0.4
    elif word_count <= 6:
        score += 0.2

    # 3. Repetitive / generic words
    generic_words = ["good", "nice", "ok", "great"]
    if text_lower.strip() in generic_words:
        score += 0.3

    # 4. Extreme punctuation
    if "!!!" in text or text.isupper():
        score += 0.2

    # 5. Rating manipulation
    if rating == 5:
        score += 0.2

    # 6. Random ML simulation
    score += random.uniform(0, 0.1)

    return min(score, 1.0)