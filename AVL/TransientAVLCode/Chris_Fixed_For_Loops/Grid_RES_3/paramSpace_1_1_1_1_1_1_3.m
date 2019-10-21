function [aeroForces] = paramSpace_1_1_1_1_1_1_3(sailStates,airStates)

	CL = (3.996093)*sailStates.alpha + (-0.159256)*sailStates.beta + (-2.812688)*sailStates.p + (39.387520)*sailStates.q + (-1.505125)*sailStates.r + (0.011148)*sailStates.de;
	CD = -0.117490;
	CY = (-0.095469)*sailStates.alpha + (-0.024507)*sailStates.beta + (-0.466314)*sailStates.p + (-0.324920)*sailStates.q + (-0.082193)*sailStates.r + (-0.000069)*sailStates.de;

	Cl = (1.308527)*sailStates.alpha + (0.200409)*sailStates.beta + (-1.427025)*sailStates.p + (12.675423)*sailStates.q + (-1.213507)*sailStates.r + (0.000765)*sailStates.de;
	Cm = (-12.657879)*sailStates.alpha + (0.626193)*sailStates.beta + (8.902178)*sailStates.p + (-143.125275)*sailStates.q + (5.071118)*sailStates.r + (-0.068948)*sailStates.de;
	Cn = (0.320427)*sailStates.alpha + (0.042194)*sailStates.beta + (0.834386)*sailStates.p + (-2.551849)*sailStates.q + (-0.022770)*sailStates.r + (0.000032)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end