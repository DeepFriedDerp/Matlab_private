function [aeroForces] = paramSpace_1_2_3_3_1_2_3(sailStates,airStates)

	CL = (3.806206)*sailStates.alpha + (-0.064100)*sailStates.beta + (-2.745674)*sailStates.p + (37.313908)*sailStates.q + (-0.957458)*sailStates.r + (0.010809)*sailStates.de;
	CD = 0.077750;
	CY = (-0.055975)*sailStates.alpha + (-0.024673)*sailStates.beta + (-0.167560)*sailStates.p + (-0.294836)*sailStates.q + (-0.033340)*sailStates.r + (-0.000063)*sailStates.de;

	Cl = (1.271693)*sailStates.alpha + (0.073613)*sailStates.beta + (-1.393808)*sailStates.p + (12.060371)*sailStates.q + (-0.648294)*sailStates.r + (0.000742)*sailStates.de;
	Cm = (-13.654161)*sailStates.alpha + (0.221665)*sailStates.beta + (9.153847)*sailStates.p + (-142.570129)*sailStates.q + (3.218811)*sailStates.r + (-0.068480)*sailStates.de;
	Cn = (0.278927)*sailStates.alpha + (0.017080)*sailStates.beta + (0.153876)*sailStates.p + (0.427185)*sailStates.q + (-0.043218)*sailStates.r + (0.000059)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end