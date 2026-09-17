"""A tiny gradient-descent experiment.

No machine-learning framework is used.
The goal is to make a single-parameter learning process visible.
"""

INPUT_VALUE = 2
INITIAL_WEIGHT = 0.5
BIAS = 0
LABEL = 4
LEARNING_RATE = 0.1
EPOCHS = 5


def prediction(input_val, weight, bias):
    """Return the model prediction."""
    return input_val * weight + bias


def loss(pred, label):
    """Return squared error for one prediction."""
    return (pred - label) ** 2


def gradient_weight(input_val, pred, label):
    """Return the derivative of squared error with respect to weight."""
    return 2 * (pred - label) * input_val


def gradient_descent(weight, gradient, learning_rate):
    """Perform one Gradient Descent update."""
    return weight - learning_rate * gradient


def training():
    """Run a small training loop and return the optimized weight."""
    current_weight = INITIAL_WEIGHT

    for epoch in range(EPOCHS):
        pred = prediction(INPUT_VALUE, current_weight, BIAS)
        current_loss = loss(pred, LABEL)

        print(
            f"Epoch {epoch} | "
            f"prediction = {pred:.4f} | "
            f"loss = {current_loss:.6f} | "
            f"weight = {current_weight:.4f}"
        )

        grad_w = gradient_weight(INPUT_VALUE, pred, LABEL)
        current_weight = gradient_descent(
            current_weight,
            grad_w,
            LEARNING_RATE,
        )

    return current_weight


if __name__ == "__main__":
    optimized_weight = training()
    print(f"Optimized weight = {optimized_weight:.5f}")
