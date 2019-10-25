function [aeroForces] = paramSpace_9_1_3_2_1_2_2(sailStates,airStates)

	CL = (4.284090)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.796950)*sailStates.p + (37.065350)*sailStates.q + (0.841343)*sailStates.r + (0.011265)*sailStates.de;
	CD = -0.157660;
	CY = (-0.022320)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.373091)*sailStates.p + (-0.438542)*sailStates.q + (-0.013044)*sailStates.r + (-0.000095)*sailStates.de;

	Cl = (1.447411)*sailStates.alpha + (-0.168793)*sailStates.beta + (-1.389608)*sailStates.p + (11.501417)*sailStates.q + (0.736300)*sailStates.r + (0.000625)*sailStates.de;
	Cm = (-14.673713)*sailStates.alpha + (0.000000)*sailStates.beta + (9.447278)*sailStates.p + (-143.320496)*sailStates.q + (-2.863121)*sailStates.r + (-0.071014)*sailStates.de;
	Cn = (0.010348)*sailStates.alpha + (0.005894)*sailStates.beta + (-0.774624)*sailStates.p + (3.649116)*sailStates.q + (0.003017)*sailStates.r + (0.000188)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end