function [aeroForces] = paramSpace_2_1_4_2_1_2_2(sailStates,airStates)

	CL = (3.933761)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.644496)*sailStates.p + (34.933945)*sailStates.q + (-0.478208)*sailStates.r + (0.010435)*sailStates.de;
	CD = -0.042840;
	CY = (-0.021331)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.071064)*sailStates.p + (-0.230434)*sailStates.q + (0.015080)*sailStates.r + (-0.000049)*sailStates.de;

	Cl = (1.281722)*sailStates.alpha + (-0.026400)*sailStates.beta + (-1.320371)*sailStates.p + (11.000633)*sailStates.q + (-0.169451)*sailStates.r + (0.000633)*sailStates.de;
	Cm = (-14.618029)*sailStates.alpha + (-0.000000)*sailStates.beta + (9.289927)*sailStates.p + (-140.986252)*sailStates.q + (1.629740)*sailStates.r + (-0.068102)*sailStates.de;
	Cn = (0.255603)*sailStates.alpha + (-0.005611)*sailStates.beta + (-0.383807)*sailStates.p + (2.699424)*sailStates.q + (-0.058230)*sailStates.r + (0.000076)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end