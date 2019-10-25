function [aeroForces] = paramSpace_1_1_3_3_2_3_3(sailStates,airStates)

	CL = (3.977877)*sailStates.alpha + (-0.012304)*sailStates.beta + (-2.695018)*sailStates.p + (35.003170)*sailStates.q + (-0.293487)*sailStates.r + (0.010425)*sailStates.de;
	CD = -0.094730;
	CY = (0.031920)*sailStates.alpha + (-0.025225)*sailStates.beta + (0.099077)*sailStates.p + (0.173374)*sailStates.q + (0.017486)*sailStates.r + (0.000037)*sailStates.de;

	Cl = (1.364159)*sailStates.alpha + (-0.075710)*sailStates.beta + (-1.402765)*sailStates.p + (11.781246)*sailStates.q + (-0.037160)*sailStates.r + (0.000780)*sailStates.de;
	Cm = (-14.624431)*sailStates.alpha + (-0.059914)*sailStates.beta + (9.480526)*sailStates.p + (-141.665955)*sailStates.q + (0.992901)*sailStates.r + (-0.068173)*sailStates.de;
	Cn = (0.170951)*sailStates.alpha + (-0.014814)*sailStates.beta + (-0.433866)*sailStates.p + (2.562192)*sailStates.q + (-0.039724)*sailStates.r + (-0.000031)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end