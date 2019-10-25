function [aeroForces] = paramSpace_2_4_1_3_3_1_3(sailStates,airStates)

	CL = (4.302890)*sailStates.alpha + (0.276345)*sailStates.beta + (-2.818972)*sailStates.p + (37.644447)*sailStates.q + (-1.161381)*sailStates.r + (0.011111)*sailStates.de;
	CD = -0.247490;
	CY = (0.017872)*sailStates.alpha + (-0.024006)*sailStates.beta + (-0.496844)*sailStates.p + (0.563443)*sailStates.q + (-0.032624)*sailStates.r + (0.000121)*sailStates.de;

	Cl = (1.428782)*sailStates.alpha + (0.300067)*sailStates.beta + (-1.364658)*sailStates.p + (11.296520)*sailStates.q + (-1.004382)*sailStates.r + (0.000540)*sailStates.de;
	Cm = (-14.114036)*sailStates.alpha + (-1.130526)*sailStates.beta + (9.351398)*sailStates.p + (-143.062881)*sailStates.q + (3.961308)*sailStates.r + (-0.069716)*sailStates.de;
	Cn = (0.023523)*sailStates.alpha + (0.013053)*sailStates.beta + (1.002732)*sailStates.p + (-4.568665)*sailStates.q + (0.005538)*sailStates.r + (-0.000229)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end