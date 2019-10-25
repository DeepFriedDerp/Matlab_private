function [aeroForces] = paramSpace_4_1_4_2_2_2_1(sailStates,airStates)

	CL = (3.701719)*sailStates.alpha + (0.212987)*sailStates.beta + (-2.072964)*sailStates.p + (31.782787)*sailStates.q + (0.834638)*sailStates.r + (0.010164)*sailStates.de;
	CD = 0.084770;
	CY = (0.004258)*sailStates.alpha + (-0.023734)*sailStates.beta + (0.193539)*sailStates.p + (0.301044)*sailStates.q + (-0.038465)*sailStates.r + (0.000063)*sailStates.de;

	Cl = (1.038477)*sailStates.alpha + (-0.056984)*sailStates.beta + (-0.882927)*sailStates.p + (7.365907)*sailStates.q + (0.588424)*sailStates.r + (-0.000051)*sailStates.de;
	Cm = (-13.032424)*sailStates.alpha + (-0.859083)*sailStates.beta + (6.844810)*sailStates.p + (-122.964470)*sailStates.q + (-2.837594)*sailStates.r + (-0.065627)*sailStates.de;
	Cn = (-0.006299)*sailStates.alpha + (0.018422)*sailStates.beta + (-0.292420)*sailStates.p + (0.495471)*sailStates.q + (-0.024257)*sailStates.r + (-0.000079)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end