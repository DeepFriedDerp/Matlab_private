function [aeroForces] = paramSpace_15_1_1_2_2_2_1(sailStates,airStates)

	CL = (3.975031)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.295012)*sailStates.p + (35.939915)*sailStates.q + (1.551293)*sailStates.r + (0.010940)*sailStates.de;
	CD = -0.064440;
	CY = (0.041408)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.403919)*sailStates.p + (0.596613)*sailStates.q + (-0.100773)*sailStates.r + (0.000125)*sailStates.de;

	Cl = (1.071487)*sailStates.alpha + (-0.225415)*sailStates.beta + (-0.996825)*sailStates.p + (8.952388)*sailStates.q + (1.141824)*sailStates.r + (0.000093)*sailStates.de;
	Cm = (-12.472236)*sailStates.alpha + (0.000000)*sailStates.beta + (6.933167)*sailStates.p + (-128.528122)*sailStates.q + (-5.113765)*sailStates.r + (-0.065887)*sailStates.de;
	Cn = (0.031211)*sailStates.alpha + (0.056202)*sailStates.beta + (-0.761478)*sailStates.p + (2.371788)*sailStates.q + (-0.033039)*sailStates.r + (-0.000094)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end