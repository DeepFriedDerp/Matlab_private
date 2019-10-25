function [aeroForces] = paramSpace_2_1_3_2_1_1_1(sailStates,airStates)

	CL = (4.007104)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.320940)*sailStates.p + (35.548824)*sailStates.q + (-1.401320)*sailStates.r + (0.010946)*sailStates.de;
	CD = -0.072280;
	CY = (-0.039420)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.386715)*sailStates.p + (-0.571904)*sailStates.q + (-0.082219)*sailStates.r + (-0.000121)*sailStates.de;

	Cl = (1.091247)*sailStates.alpha + (0.216019)*sailStates.beta + (-1.010778)*sailStates.p + (8.819399)*sailStates.q + (-1.058715)*sailStates.r + (0.000089)*sailStates.de;
	Cm = (-12.787193)*sailStates.alpha + (-0.000000)*sailStates.beta + (7.203517)*sailStates.p + (-129.462372)*sailStates.q + (4.664260)*sailStates.r + (-0.066948)*sailStates.de;
	Cn = (-0.042199)*sailStates.alpha + (0.045916)*sailStates.beta + (0.730485)*sailStates.p + (-2.296547)*sailStates.q + (-0.024096)*sailStates.r + (0.000099)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end