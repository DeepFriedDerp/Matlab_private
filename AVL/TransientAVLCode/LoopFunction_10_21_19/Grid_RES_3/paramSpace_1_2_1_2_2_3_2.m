function [aeroForces] = paramSpace_1_2_1_2_2_3_2(sailStates,airStates)

	CL = (4.159960)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.432902)*sailStates.p + (32.093945)*sailStates.q + (0.127774)*sailStates.r + (0.010007)*sailStates.de;
	CD = -0.290170;
	CY = (0.000000)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.252831)*sailStates.p + (0.000000)*sailStates.q + (0.044581)*sailStates.r + (0.000000)*sailStates.de;

	Cl = (1.276116)*sailStates.alpha + (-0.126415)*sailStates.beta + (-1.152438)*sailStates.p + (9.044189)*sailStates.q + (0.311520)*sailStates.r + (0.000336)*sailStates.de;
	Cm = (-14.940359)*sailStates.alpha + (-0.000000)*sailStates.beta + (8.900012)*sailStates.p + (-135.529190)*sailStates.q + (-0.345298)*sailStates.r + (-0.068373)*sailStates.de;
	Cn = (0.301178)*sailStates.alpha + (-0.022290)*sailStates.beta + (-0.764385)*sailStates.p + (4.176900)*sailStates.q + (-0.044195)*sailStates.r + (0.000080)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end