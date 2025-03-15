# Virtual Buchla 259 Wavefolder - Digital Modeling and DSP Implementation  

This project digitally models the **Buchla 259 Wavefolder**, a nonlinear waveshaping circuit used in **West Coast synthesis**. The implementation focuses on **real-time DSP processing** while mitigating aliasing artifacts using the **polyBLAMP (band-limited ramp) technique**.  

This work is based on **virtual analog modeling** principles and was developed in **MATLAB**.  

---

## Features  
✔ **MATLAB-based digital wavefolder** with nonlinear waveshaping  
✔ **PolyBLAMP anti-aliasing** to suppress spectral artifacts  
✔ **Comparative analysis** with the original Buchla 259 analog circuit  
✔ **Supports real-time synthesis applications**  

---

## Project Overview  

The **Buchla 259 Wavefolder** is an essential component of West Coast synthesis, known for its **nonlinear wavefolding** that introduces rich harmonic content. This project aims to:  

- **Digitally model** the Buchla 259 circuit while preserving its timbral characteristics  
- **Analyze the spectral response** and minimize aliasing artifacts  
- **Implement polyBLAMP** as an efficient anti-aliasing technique  
- **Evaluate the digital model** against theoretical benchmarks and analog simulations  

The simulation follows the methodology of **Esqueda et al. (DAFx-17)**, where **memoryless nonlinear mappings** are used to replicate the analog circuit’s waveshaping behavior.  

---

## 
