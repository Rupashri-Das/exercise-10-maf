# Moving Average Filter Analysis (5-point and 9-point)

## Files
- `exercise_10_maf_analysis.m` – MATLAB script that computes and plots transfer functions and pole-zero plots for 5-point and 9-point moving average filters and saves `MAF_plots.png`.
- `MAF_plots.png` – generated plot image (created after running the script).

## How to run (MATLAB Online)
1. Go to https://matlab.mathworks.com and sign in.
2. Click New > Script, paste `exercise_10_maf_analysis.m` and save as `exercise_10_maf_analysis.m`.
3. Run the script by pressing Run or type `exercise_10_maf_analysis` in the Command Window.
4. Download `MAF_plots.png` from the Current Folder.

## Notes
- If your environment lacks Signal Processing Toolbox, the script uses a fallback (FFT-based) implementation for the frequency response.
- To normalize DC gain to 1, change:
  ```matlab
  b1 = ones(1,5)/5;
  b2 = ones(1,9)/9;

  FIR vs IIR (short)

FIR: finite impulse response, uses only input values (moving average is FIR). Stable and can have linear phase.

IIR: infinite impulse response, uses output feedback too, can be more efficient but may be unstable if poles lie outside the unit circle.
