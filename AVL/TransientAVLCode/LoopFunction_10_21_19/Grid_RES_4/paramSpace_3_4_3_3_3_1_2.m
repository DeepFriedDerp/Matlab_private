function [aeroForces] = paramSpace_3_4_3_3_3_1_2(sailStates,airStates)

	CL = (4.221046)*sailStates.alpha + (0.090365)*sailStates.beta + (-2.534993)*sailStates.p + (33.902710)*sailStates.q + (-0.447306)*sailStates.r + (0.010703)*sailStates.de;
	CD = -0.190960;
	CY = (0.060484)*sailStates.alpha + (-0.025370)*sailStates.beta + (-0.306398)*sailStates.p + (0.498143)*sailStates.q + (0.020100)*sailStates.r + (0.000107)*sailStates.de;

	Cl = (1.261618)*sailStates.alpha + (0.161983)*sailStates.beta + (-1.147672)*sailStates.p + (8.893347)*sailStates.q + (-0.481172)*sailStates.r + (0.000220)*sailStates.de;
	Cm = (-14.872558)*sailStates.alpha + (-0.339524)*sailStates.beta + (8.890487)*sailStates.p + (-136.384674)*sailStates.q + (1.499196)*sailStates.r + (-0.069025)*sailStates.de;
	Cn = (-0.256448)*sailStates.alpha + (-0.006496)*sailStates.beta + (0.742517)*sailStates.p + (-3.988230)*sailStates.q + (-0.012245)*sailStates.r + (-0.000210)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end