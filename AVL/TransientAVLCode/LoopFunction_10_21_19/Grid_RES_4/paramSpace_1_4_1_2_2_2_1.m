function [aeroForces] = paramSpace_1_4_1_2_2_2_1(sailStates,airStates)

	CL = (3.701719)*sailStates.alpha + (0.212987)*sailStates.beta + (-2.072964)*sailStates.p + (31.782791)*sailStates.q + (-0.834638)*sailStates.r + (0.010164)*sailStates.de;
	CD = 0.084770;
	CY = (-0.004258)*sailStates.alpha + (-0.025838)*sailStates.beta + (-0.193539)*sailStates.p + (-0.301044)*sailStates.q + (-0.038465)*sailStates.r + (-0.000063)*sailStates.de;

	Cl = (0.884629)*sailStates.alpha + (0.154456)*sailStates.beta + (-0.788570)*sailStates.p + (6.178023)*sailStates.q + (-0.569528)*sailStates.r + (-0.000304)*sailStates.de;
	Cm = (-13.032424)*sailStates.alpha + (-0.859083)*sailStates.beta + (6.844810)*sailStates.p + (-122.964470)*sailStates.q + (2.837594)*sailStates.r + (-0.065627)*sailStates.de;
	Cn = (-0.053809)*sailStates.alpha + (0.023636)*sailStates.beta + (0.311189)*sailStates.p + (-0.731755)*sailStates.q + (-0.020498)*sailStates.r + (0.000079)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end