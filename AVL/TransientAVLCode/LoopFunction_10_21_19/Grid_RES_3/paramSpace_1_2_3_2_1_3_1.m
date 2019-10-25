function [aeroForces] = paramSpace_1_2_3_2_1_3_1(sailStates,airStates)

	CL = (4.410739)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.063589)*sailStates.p + (28.574669)*sailStates.q + (0.484023)*sailStates.r + (0.010038)*sailStates.de;
	CD = -0.482450;
	CY = (-0.195922)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.455563)*sailStates.p + (-1.027328)*sailStates.q + (0.080230)*sailStates.r + (-0.000217)*sailStates.de;

	Cl = (1.201037)*sailStates.alpha + (-0.186794)*sailStates.beta + (-0.845215)*sailStates.p + (5.944111)*sailStates.q + (0.648040)*sailStates.r + (-0.000133)*sailStates.de;
	Cm = (-15.782234)*sailStates.alpha + (-0.000000)*sailStates.beta + (7.881238)*sailStates.p + (-125.588745)*sailStates.q + (-1.571243)*sailStates.r + (-0.067412)*sailStates.de;
	Cn = (0.723896)*sailStates.alpha + (-0.032937)*sailStates.beta + (-1.108925)*sailStates.p + (5.999966)*sailStates.q + (-0.055109)*sailStates.r + (0.000368)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end