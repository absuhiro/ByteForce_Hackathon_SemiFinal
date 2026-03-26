def calculate_authenticity(fake_probs, spike_score=0.1, bot_score=0.1):
    avg_fake = sum(fake_probs) / len(fake_probs)

    score = 1 - (0.4 * avg_fake + 0.3 * spike_score + 0.2 * bot_score + 0.1 * 0.1)

    return round(score, 2)