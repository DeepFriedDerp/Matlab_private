function [aeroForces] = paramSpace_1_1_3_3_1_1_3(sailStates,airStates)

	CL = (4.040557)*sailStates.alpha + (-0.268707)*sailStates.beta + (-2.797244)*sailStates.p + (39.077587)*sailStates.q + (-1.485350)*sailStates.r + (0.011251)*sailStates.de;
	CD = -0.131120;
	CY = (-0.089497)*sailStates.alpha + (-0.024108)*sailStates.beta + (-0.431057)*sailStates.p + (-0.318252)*sailStates.q + (-0.076037)*sailStates.r + (-0.000068)*sailStates.de;

	Cl = (1.334453)*sailStates.alpha + (0.137954)*sailStates.beta + (-1.439059)*sailStates.p + (12.853213)*sailStates.q + (-1.158757)*sailStates.r + (0.000809)*sailStates.de;
	Cm = (-13.002732)*sailStates.alpha + (0.935959)*sailStates.beta + (8.860652)*sailStates.p + (-142.287766)*sailStates.q + (4.946529)*sailStates.r + (-0.068238)*sailStates.de;
	Cn = (0.316008)*sailStates.alpha + (0.038108)*sailStates.beta + (0.782042)*sailStates.p + (-2.531468)*sailStates.q + (-0.021845)*sailStates.r + (-0.000001)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end