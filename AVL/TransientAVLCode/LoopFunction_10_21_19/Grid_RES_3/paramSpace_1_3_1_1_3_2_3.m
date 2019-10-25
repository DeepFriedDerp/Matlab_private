function [aeroForces] = paramSpace_1_3_1_1_3_2_3(sailStates,airStates)

	CL = (3.854043)*sailStates.alpha + (0.277782)*sailStates.beta + (-3.300409)*sailStates.p + (42.549450)*sailStates.q + (-1.623366)*sailStates.r + (0.010937)*sailStates.de;
	CD = -0.015070;
	CY = (0.083018)*sailStates.alpha + (-0.018576)*sailStates.beta + (-0.577273)*sailStates.p + (2.260755)*sailStates.q + (-0.102004)*sailStates.r + (0.000485)*sailStates.de;

	Cl = (1.600379)*sailStates.alpha + (0.298644)*sailStates.beta + (-1.801435)*sailStates.p + (16.100771)*sailStates.q + (-1.227909)*sailStates.r + (0.001261)*sailStates.de;
	Cm = (-13.020355)*sailStates.alpha + (-1.048214)*sailStates.beta + (10.536613)*sailStates.p + (-156.476898)*sailStates.q + (5.438861)*sailStates.r + (-0.069804)*sailStates.de;
	Cn = (0.500377)*sailStates.alpha + (0.031300)*sailStates.beta + (0.939011)*sailStates.p + (-4.659117)*sailStates.q + (0.005168)*sailStates.r + (-0.000711)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end