function [aeroForces] = paramSpace_3_1_1_1_1_1_1(sailStates,airStates)

	CL = (4.417035)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.119014)*sailStates.p + (35.060246)*sailStates.q + (-1.762772)*sailStates.r + (0.011210)*sailStates.de;
	CD = -0.600330;
	CY = (-0.042648)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.609609)*sailStates.p + (-1.304045)*sailStates.q + (-0.107351)*sailStates.r + (-0.000275)*sailStates.de;

	Cl = (0.897147)*sailStates.alpha + (0.356810)*sailStates.beta + (-0.811192)*sailStates.p + (7.039526)*sailStates.q + (-1.494746)*sailStates.r + (-0.000257)*sailStates.de;
	Cm = (-11.438313)*sailStates.alpha + (-0.000000)*sailStates.beta + (6.227784)*sailStates.p + (-122.917580)*sailStates.q + (5.923964)*sailStates.r + (-0.067165)*sailStates.de;
	Cn = (-0.501322)*sailStates.alpha + (0.062915)*sailStates.beta + (1.298466)*sailStates.p + (-4.446990)*sailStates.q + (-0.009919)*sailStates.r + (0.000286)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end