function [aeroForces] = paramSpace_2_1_2_3_1_3_2(sailStates,airStates)

	CL = (4.221046)*sailStates.alpha + (0.090365)*sailStates.beta + (-2.534993)*sailStates.p + (33.902710)*sailStates.q + (0.447305)*sailStates.r + (0.010703)*sailStates.de;
	CD = -0.190960;
	CY = (-0.060485)*sailStates.alpha + (-0.024202)*sailStates.beta + (0.306398)*sailStates.p + (-0.498143)*sailStates.q + (0.020100)*sailStates.r + (-0.000107)*sailStates.de;

	Cl = (1.412915)*sailStates.alpha + (-0.103288)*sailStates.beta + (-1.245365)*sailStates.p + (10.101906)*sailStates.q + (0.474726)*sailStates.r + (0.000480)*sailStates.de;
	Cm = (-14.872558)*sailStates.alpha + (-0.339524)*sailStates.beta + (8.890487)*sailStates.p + (-136.384659)*sailStates.q + (-1.499196)*sailStates.r + (-0.069025)*sailStates.de;
	Cn = (0.231478)*sailStates.alpha + (-0.010890)*sailStates.beta + (-0.748920)*sailStates.p + (4.067443)*sailStates.q + (-0.012667)*sailStates.r + (0.000210)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end