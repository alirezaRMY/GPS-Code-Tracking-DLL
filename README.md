# GPS Code Tracking Receiver (DLL)

MATLAB/Simulink implementation of a GPS L1 C/A code tracking loop using Delay Lock Loop (DLL) techniques.

## Overview

This project implements the code tracking stage of a GPS receiver.

The receiver architecture includes:

- GPS signal generation
- C/A code generation
- Early-Prompt-Late correlators
- Integrate-and-Dump accumulators
- DLL discriminator
- Code phase error estimation

## Academic Context

This project was developed during graduate studies in Communication Systems and Networks at Tampere University.

The MATLAB code, Simulink model implementation, debugging process, and performance evaluation were independently developed by the author.

## System Architecture

![Model](figures/model_overview.png)

## Example Result

### DLL Discriminator Output

![DLL](figures/dll_output.jpg)

## Repository Contents

- Main.slx
- load_params.m
- generateCAcodes.m
- Report.pdf

## Technologies

- MATLAB
- Simulink
- GNSS
- GPS
- Signal Processing

## Author

Alireza Ramyad

M.Sc. Student in Communication Systems and Networks

Tampere University
