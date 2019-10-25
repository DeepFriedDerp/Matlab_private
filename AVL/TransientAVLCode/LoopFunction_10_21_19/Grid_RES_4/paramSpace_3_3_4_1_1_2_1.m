function [aeroForces] = paramSpace_3_3_4_1_1_2_1(sailStates,airStates)

	CL = (3.896699)*sailStates.alpha + (-0.049032)*sailStates.beta + (-1.664679)*sailStates.p + (27.919195)*sailStates.q + (0.670700)*sailStates.r + (0.010602)*sailStates.de;
	CD = -0.027120;
	CY = (-0.309915)*sailStates.alpha + (-0.024296)*sailStates.beta + (0.335595)*sailStates.p + (-1.471502)*sailStates.q + (-0.022151)*sailStates.r + (-0.000312)*sailStates.de;

	Cl = (0.725662)*sailStates.alpha + (-0.121089)*sailStates.beta + (-0.458261)*sailStates.p + (2.908994)*sailStates.q + (0.528864)*sailStates.r + (-0.000884)*sailStates.de;
	Cm = (-13.771877)*sailStates.alpha + (0.203896)*sailStates.beta + (5.604715)*sailStates.p + (-112.102478)*sailStates.q + (-2.280594)*sailStates.r + (-0.067743)*sailStates.de;
	Cn = (0.695831)*sailStates.alpha + (0.006096)*sailStates.beta + (-0.671490)*sailStates.p + (4.006592)*sailStates.q + (0.011284)*sailStates.r + (0.000454)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end