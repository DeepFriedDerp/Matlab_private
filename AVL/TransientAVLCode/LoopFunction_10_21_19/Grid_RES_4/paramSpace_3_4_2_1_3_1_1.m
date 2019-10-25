function [aeroForces] = paramSpace_3_4_2_1_3_1_1(sailStates,airStates)

	CL = (6.961635)*sailStates.alpha + (0.536643)*sailStates.beta + (-1.621570)*sailStates.p + (24.774239)*sailStates.q + (-2.453169)*sailStates.r + (0.009975)*sailStates.de;
	CD = -2.855390;
	CY = (0.694060)*sailStates.alpha + (-0.026627)*sailStates.beta + (-1.291953)*sailStates.p + (1.915489)*sailStates.q + (0.084612)*sailStates.r + (0.000404)*sailStates.de;

	Cl = (1.951231)*sailStates.alpha + (0.727432)*sailStates.beta + (-0.419601)*sailStates.p + (1.669380)*sailStates.q + (-2.322940)*sailStates.r + (-0.000891)*sailStates.de;
	Cm = (-16.531939)*sailStates.alpha + (-2.112106)*sailStates.beta + (6.426014)*sailStates.p + (-112.650780)*sailStates.q + (8.296509)*sailStates.r + (-0.066832)*sailStates.de;
	Cn = (-2.711614)*sailStates.alpha + (-0.031263)*sailStates.beta + (2.852731)*sailStates.p + (-14.309271)*sailStates.q + (-0.032885)*sailStates.r + (-0.000740)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end