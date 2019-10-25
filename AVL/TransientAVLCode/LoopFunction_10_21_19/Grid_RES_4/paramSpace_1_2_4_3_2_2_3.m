function [aeroForces] = paramSpace_1_2_4_3_2_2_3(sailStates,airStates)

	CL = (3.889628)*sailStates.alpha + (-0.062854)*sailStates.beta + (-2.732031)*sailStates.p + (37.345737)*sailStates.q + (-1.073802)*sailStates.r + (0.010894)*sailStates.de;
	CD = 0.062740;
	CY = (-0.000893)*sailStates.alpha + (-0.025163)*sailStates.beta + (-0.230842)*sailStates.p + (0.194782)*sailStates.q + (-0.045896)*sailStates.r + (0.000041)*sailStates.de;

	Cl = (1.314277)*sailStates.alpha + (0.083400)*sailStates.beta + (-1.385204)*sailStates.p + (12.083673)*sailStates.q + (-0.727403)*sailStates.r + (0.000709)*sailStates.de;
	Cm = (-13.868927)*sailStates.alpha + (0.196312)*sailStates.beta + (8.996377)*sailStates.p + (-141.871536)*sailStates.q + (3.572334)*sailStates.r + (-0.068406)*sailStates.de;
	Cn = (0.219676)*sailStates.alpha + (0.020213)*sailStates.beta + (0.296173)*sailStates.p + (-0.675712)*sailStates.q + (-0.031299)*sailStates.r + (-0.000104)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end