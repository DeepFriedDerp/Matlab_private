function [aeroForces] = paramSpace_2_2_1_1_3_2_1(sailStates,airStates)

	CL = (3.896699)*sailStates.alpha + (-0.049032)*sailStates.beta + (-1.664679)*sailStates.p + (27.919195)*sailStates.q + (-0.670700)*sailStates.r + (0.010602)*sailStates.de;
	CD = -0.027120;
	CY = (0.309915)*sailStates.alpha + (-0.025657)*sailStates.beta + (-0.335595)*sailStates.p + (1.471502)*sailStates.q + (-0.022151)*sailStates.r + (0.000312)*sailStates.de;

	Cl = (0.787639)*sailStates.alpha + (0.095172)*sailStates.beta + (-0.490906)*sailStates.p + (3.312874)*sailStates.q + (-0.531046)*sailStates.r + (-0.000798)*sailStates.de;
	Cm = (-13.771877)*sailStates.alpha + (0.203896)*sailStates.beta + (5.604714)*sailStates.p + (-112.102478)*sailStates.q + (2.280595)*sailStates.r + (-0.067743)*sailStates.de;
	Cn = (-0.682278)*sailStates.alpha + (0.008078)*sailStates.beta + (0.669350)*sailStates.p + (-3.980121)*sailStates.q + (0.011141)*sailStates.r + (-0.000454)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end