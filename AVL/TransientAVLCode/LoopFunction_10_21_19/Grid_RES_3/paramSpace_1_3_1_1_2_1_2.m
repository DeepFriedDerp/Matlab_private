function [aeroForces] = paramSpace_1_3_1_1_2_1_2(sailStates,airStates)

	CL = (6.482910)*sailStates.alpha + (0.651511)*sailStates.beta + (-2.636835)*sailStates.p + (42.121944)*sailStates.q + (-3.131219)*sailStates.r + (0.011897)*sailStates.de;
	CD = -2.407330;
	CY = (0.000000)*sailStates.alpha + (-0.024831)*sailStates.beta + (-1.252560)*sailStates.p + (0.000000)*sailStates.q + (-0.220860)*sailStates.r + (-0.000000)*sailStates.de;

	Cl = (1.886027)*sailStates.alpha + (0.801828)*sailStates.beta + (-1.172078)*sailStates.p + (11.157497)*sailStates.q + (-2.710424)*sailStates.r + (0.000217)*sailStates.de;
	Cm = (-10.833219)*sailStates.alpha + (-2.527420)*sailStates.beta + (6.937909)*sailStates.p + (-134.612778)*sailStates.q + (10.443384)*sailStates.r + (-0.067452)*sailStates.de;
	Cn = (-0.248954)*sailStates.alpha + (0.103489)*sailStates.beta + (2.658843)*sailStates.p + (-11.285092)*sailStates.q + (0.027046)*sailStates.r + (-0.000206)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end