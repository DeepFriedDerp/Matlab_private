function [aeroForces] = paramSpace_4_4_4_1_2_2_2(sailStates,airStates)

	CL = (3.750380)*sailStates.alpha + (-0.234693)*sailStates.beta + (-2.460238)*sailStates.p + (35.085938)*sailStates.q + (0.991428)*sailStates.r + (0.010344)*sailStates.de;
	CD = 0.092180;
	CY = (-0.000000)*sailStates.alpha + (-0.024786)*sailStates.beta + (0.241527)*sailStates.p + (0.000000)*sailStates.q + (-0.048043)*sailStates.r + (-0.000000)*sailStates.de;

	Cl = (1.113989)*sailStates.alpha + (-0.181873)*sailStates.beta + (-1.106541)*sailStates.p + (9.240786)*sailStates.q + (0.697671)*sailStates.r + (0.000200)*sailStates.de;
	Cm = (-13.183980)*sailStates.alpha + (0.932682)*sailStates.beta + (8.094843)*sailStates.p + (-133.820877)*sailStates.q + (-3.361615)*sailStates.r + (-0.066661)*sailStates.de;
	Cn = (-0.086895)*sailStates.alpha + (0.026621)*sailStates.beta + (-0.347990)*sailStates.p + (0.810477)*sailStates.q + (-0.026043)*sailStates.r + (0.000011)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end