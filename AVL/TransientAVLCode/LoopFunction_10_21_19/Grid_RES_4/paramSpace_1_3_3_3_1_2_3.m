function [aeroForces] = paramSpace_1_3_3_3_1_2_3(sailStates,airStates)

	CL = (3.806205)*sailStates.alpha + (0.064100)*sailStates.beta + (-2.745674)*sailStates.p + (37.313908)*sailStates.q + (-0.957458)*sailStates.r + (0.010809)*sailStates.de;
	CD = 0.077750;
	CY = (-0.055975)*sailStates.alpha + (-0.025280)*sailStates.beta + (-0.167560)*sailStates.p + (-0.294836)*sailStates.q + (-0.033340)*sailStates.r + (-0.000063)*sailStates.de;

	Cl = (1.228405)*sailStates.alpha + (0.116785)*sailStates.beta + (-1.362265)*sailStates.p + (11.663408)*sailStates.q + (-0.642034)*sailStates.r + (0.000656)*sailStates.de;
	Cm = (-13.654163)*sailStates.alpha + (-0.221665)*sailStates.beta + (9.153847)*sailStates.p + (-142.570129)*sailStates.q + (3.218811)*sailStates.r + (-0.068480)*sailStates.de;
	Cn = (0.261656)*sailStates.alpha + (0.020792)*sailStates.beta + (0.160150)*sailStates.p + (0.348224)*sailStates.q + (-0.041973)*sailStates.r + (0.000059)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end