clear; close all; clc

%%%%%%%%% parameters %%%%%%%%%%%%%

% --- Code parameters ---
fc = 1.023E6;          
Tc = 1 / fc;           

correlator_spacing = 1;       
Early_Late = (correlator_spacing * Tc) / 2;

code_bias = 0;                
t_code_bias = code_bias * Tc; 

% --- Carrier errors ---
f_error = 0;                  
phase_error_deg = 0;          
phase_error_rad = deg2rad(phase_error_deg);

% --- Noise / integration ---
SNR = -15;            
PIT = 0.001;          
stop_time = 500 * PIT; 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%% General receiver parameters %%%%%%%%%%%%%
fB = 1.5E6;           
fs = 4e6;             
Ts = 1/fs;

ME = round(PIT * fs);

PRN = 1;
fL1 = 1575.42E6;

code_repeat = 0.001;
fdata = 50;
Tdata = 1/fdata;
data_repeat = 30;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%% Signal + noise parameters %%%%%%%%%%%%%
A_ca = sqrt(2);
SNR_ratio = 10^(SNR/10);

Ps = A_ca^2 / 2;      
Pn = Ps / SNR_ratio;  

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%% Propagation / timing %%%%%%%%%%%%%
dt_rec = 0;
r_true_t0 = 20E6;
df_Dop = 1000;

dt_iono = 15E-9;
dt_tropo = 5E-9;
dt_sv = 0;

c = 299792458;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%% Signal generation %%%%%%%%%%%%%
ca_code = generateCAcodes(PRN);

nav_data = ones(1, 30*50);
nav_data(end) = -1;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%% Compatibility with GPS-Receiver-Carrier-Tracking repository blocks %%%%%%%%%%%%%


fb = fB;
ferr = f_error;
perr_rad = phase_error_rad;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%