function [aeroForces] = paramSpace_1_1_2_2_2_2_2(sailStates,airStates)

	CL = (4.022310)*sailStates.alpha + (-0.009034)*sailStates.beta + (-2.702353)*sailStates.p + (35.459648)*sailStates.q + (-0.274277)*sailStates.r + (0.010731)*sailStates.de;
	CD = -0.041440;
	CY = (0.066409)*sailStates.alpha + (-0.025563)*sailStates.beta + (0.034819)*sailStates.p + (0.513811)*sailStates.q + (0.004620)*sailStates.r + (0.000110)*sailStates.de;

	Cl = (1.349823)*sailStates.alpha + (-0.050942)*sailStates.beta + (-1.378946)*sailStates.p + (11.504267)*sailStates.q + (-0.062902)*sailStates.r + (0.000685)*sailStates.de;
	Cm = (-14.694212)*sailStates.alpha + (-0.032610)*sailStates.beta + (9.359101)*sailStates.p + (-141.379639)*sailStates.q + (0.909267)*sailStates.r + (-0.069332)*sailStates.de;
	Cn = (0.088330)*sailStates.alpha + (-0.006442)*sailStates.beta + (-0.242950)*sailStates.p + (1.230592)*sailStates.q + (-0.016566)*sailStates.r + (-0.000139)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end