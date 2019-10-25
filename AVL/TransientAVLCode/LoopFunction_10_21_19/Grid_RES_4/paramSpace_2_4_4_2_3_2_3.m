function [aeroForces] = paramSpace_2_4_4_2_3_2_3(sailStates,airStates)

	CL = (3.993531)*sailStates.alpha + (0.071649)*sailStates.beta + (-2.942008)*sailStates.p + (37.979137)*sailStates.q + (-0.570768)*sailStates.r + (0.011117)*sailStates.de;
	CD = 0.013620;
	CY = (0.076649)*sailStates.alpha + (-0.024133)*sailStates.beta + (-0.193313)*sailStates.p + (0.870359)*sailStates.q + (-0.012579)*sailStates.r + (0.000188)*sailStates.de;

	Cl = (1.339508)*sailStates.alpha + (0.098183)*sailStates.beta + (-1.473931)*sailStates.p + (12.169026)*sailStates.q + (-0.394889)*sailStates.r + (0.000721)*sailStates.de;
	Cm = (-14.368763)*sailStates.alpha + (-0.164411)*sailStates.beta + (9.949651)*sailStates.p + (-146.834106)*sailStates.q + (1.888371)*sailStates.r + (-0.070120)*sailStates.de;
	Cn = (0.010788)*sailStates.alpha + (0.003654)*sailStates.beta + (0.338471)*sailStates.p + (-2.007562)*sailStates.q + (0.002214)*sailStates.r + (-0.000300)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end