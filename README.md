# One Wheel System with Spring: Full State Feedback Control

State-space modelling of a wheel restrained by a spring and damper, and full state feedback control simulated in MATLAB against a sinusoidal reference.

## Overview

A wheel with moment of inertia $J$ rotates under an applied torque $T$, with rotational damping $c$ and a spring of stiffness $k$ acting at radius $r$. The task (MKT3822 Lab 3, Application 4, Yildiz Technical University) is to derive the equations of motion, obtain the transfer function and state-space model, design a full state feedback controller $u = -Kx$, and simulate the closed-loop response.

## Modelling

The equation of motion used in the report is

$$J\ddot{\theta} + c\dot{\theta} + k r \theta = T$$

which gives the transfer function

$$G(s) = \frac{\Theta(s)}{T(s)} = \frac{1}{J s^2 + c s + k r}$$

With states $x_1 = \theta$ and $x_2 = \dot{\theta}$:

$$\begin{bmatrix} \dot{x}_1 \\ \dot{x}_2 \end{bmatrix} = \begin{bmatrix} 0 & 1 \\ -\frac{kr}{J} & -\frac{c}{J} \end{bmatrix} \begin{bmatrix} x_1 \\ x_2 \end{bmatrix} + \begin{bmatrix} 0 \\ \frac{1}{J} \end{bmatrix} T, \qquad y = \begin{bmatrix} 1 & 0 \end{bmatrix} x$$

Parameters: $J = 1$ kg m², $c = 2$, $k = 3$, $r = 0.5$ m.

## Controller design

The assignment specifies the desired characteristic equation $(s+5)(s+10)(s+15) = s^3 + 30s^2 + 275s + 750$. With $u = -Kx$ and $K = [k_1 \; k_2]$, the closed-loop characteristic equation of the plant is

$$s^2 + (2 + k_2)s + 1.5 + k_1 = 0$$

The script uses $K = [273.5 \;\; 28]$, so the closed-loop matrix is $A_{cl} = A - BK$. The closed-loop system is simulated for 20 s from zero initial conditions with the reference

$$r(t) = 5 + 2\sin(2\pi f t), \qquad f = 0.1 \text{ Hz}$$

## Repository structure

```
.
├── one_wheel_system_with_spring.m               # State-space model, state feedback gain, closed-loop simulation (lsim)
└── 22067606_LAB3_GR1_AR4_GöktuğCan-Şimay.pdf    # Lab report: derivation, block diagram, gain selection, results
```

## How to run

Requires MATLAB with the Control System Toolbox.

```matlab
one_wheel_system_with_spring
```

The script builds the closed-loop state-space system, runs `lsim` with the sinusoidal reference and plots the output $y(t)$. Plot labels are in Turkish.

## Results

The closed-loop block diagram and the simulated response are included in the lab report PDF.

## Author

Goktug Can Simay ([GitHub](https://github.com/simaygoktug) | [Website](https://goktugcansimay.com))
