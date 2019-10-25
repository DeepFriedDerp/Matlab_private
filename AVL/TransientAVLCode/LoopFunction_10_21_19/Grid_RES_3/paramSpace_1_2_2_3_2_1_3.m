function [aeroForces] = paramSpace_1_2_2_3_2_1_3(sailStates,airStates)

	CL = (4.189209)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.800231)*sailStates.p + (39.445847)*sailStates.q + (-1.629851)*sailStates.r + (0.011291)*sailStates.de;
	CD = -0.189930;
	CY = (-0.035719)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.530276)*sailStates.p + (0.173374)*sailStates.q + (-0.093502)*sailStates.r + (0.000037)*sailStates.de;

	Cl = (1.398451)*sailStates.alpha + (0.258222)*sailStates.beta + (-1.396153)*sailStates.p + (12.415062)*sailStates.q + (-1.290756)*sailStates.r + (0.000672)*sailStates.de;
	Cm = (-13.071037)*sailStates.alpha + (-0.000000)*sailStates.beta + (8.754875)*sailStates.p + (-142.582367)*sailStates.q + (5.447244)*sailStates.r + (-0.069099)*sailStates.de;
	Cn = (0.234973)*sailStates.alpha + (0.045532)*sailStates.beta + (0.984922)*sailStates.p + (-3.759066)*sailStates.q + (-0.010519)*sailStates.r + (-0.000139)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end