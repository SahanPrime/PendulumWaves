# Pendulum Wave

A clean, well-documented simulation of the classic "pendulum wave" demonstration. The project simulates many simple pendulums with slightly different lengths to produce striking synchronization and interference patterns.

## Project Overview

This repository contains a computational simulation of the pendulum wave effect — a set of simple pendulums with slightly different periods that produce visually rich patterns as they move in and out of phase.

Key goals:
- Recreate the visual phenomena seen in physical pendulum wave demonstrations.
- Provide a clear, documented MATLAB implementation for experimentation and visualization.

## Physics & Mathematical Model

The simulation uses the small-angle approximation for simple pendulums (sin θ ≈ θ). Under this approximation, each pendulum behaves as a simple harmonic oscillator with period:

T ≈ 2π√(L/g)

where L is the pendulum length and g is gravitational acceleration. By selecting a sequence of lengths, the dataset of slightly different periods produces slow beat-like pattern changes and full re-synchronizations at predictable times.

## Visual Patterns

Because all pendulums share a common pivot but have different lengths, the motion produces a range of emergent patterns:
- Synchronization: At particular times many pendulums align, producing a unified shape.
- Wave-like motion: Phase differences create travelling wave patterns across the array.
- Lissajous-like and interference shapes appear when plotting combined tip positions.

The simulation typically shows full cycles of behavior (e.g., when the system returns to near its initial configuration), which is useful for teaching and demonstrations.

## Development Workflow (AI-Assisted)

This project used a Large Language Model (LLM) as a technical partner to accelerate prototyping and iterate on visualization styles, parameter choices, and documentation. The LLM helped with:
- Prototyping viewing angles and plot styles
- Suggesting parameter sets to demonstrate interesting effects
- Drafting and refining documentation

## Tools Used

- Language: MATLAB
- Concepts: Classical mechanics, simple harmonic motion, signal processing (aliasing)

## Installation & Usage

1. Open MATLAB.
2. Add the project folder to the MATLAB path or change the working directory to the repository root.
3. Run the main simulation script (e.g., `pendulum_wave.m`).
4. Adjust parameters such as number of pendulums, length ranges, and simulation time to explore different behaviors.

## Contributing

Contributions, bug reports, and enhancements are welcome. Please open an issue or submit a pull request with a clear description of changes and examples where appropriate.

## License

Specify the project license here (e.g., MIT). Replace this section with the chosen license text or link.

## Contact

Maintainer: SahanPrime
