function [aeroForces] = paramSpace_1_2_2_2_2_1_2(sailStates,airStates)

	CL = (4.556328)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.571708)*sailStates.p + (38.448750)*sailStates.q + (-1.900172)*sailStates.r + (0.011389)*sailStates.de;
	CD = -0.490840;
	CY = (0.000000)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.668925)*sailStates.p + (-0.000000)*sailStates.q + (-0.117950)*sailStates.r + (-0.000000)*sailStates.de;

	Cl = (1.403631)*sailStates.alpha + (0.334463)*sailStates.beta + (-1.196505)*sailStates.p + (10.734644)*sailStates.q + (-1.551965)*sailStates.r + (0.000336)*sailStates.de;
	Cm = (-12.720043)*sailStates.alpha + (-0.000000)*sailStates.beta + (7.721116)*sailStates.p + (-135.529190)*sailStates.q + (6.340559)*sailStates.r + (-0.068373)*sailStates.de;
	Cn = (-0.044753)*sailStates.alpha + (0.058975)*sailStates.beta + (1.341218)*sailStates.p + (-5.410147)*sailStates.q + (0.000040)*sailStates.r + (-0.000112)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end