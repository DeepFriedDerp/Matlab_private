function [aeroForces] = paramSpace_1_1_1_3_2_2_2(sailStates,airStates)

	CL = (3.819340)*sailStates.alpha + (-0.186781)*sailStates.beta + (-2.484960)*sailStates.p + (35.061649)*sailStates.q + (-0.885897)*sailStates.r + (0.010501)*sailStates.de;
	CD = 0.078710;
	CY = (0.000000)*sailStates.alpha + (-0.024831)*sailStates.beta + (-0.216306)*sailStates.p + (0.000000)*sailStates.q + (-0.038141)*sailStates.r + (-0.000000)*sailStates.de;

	Cl = (1.262021)*sailStates.alpha + (0.054915)*sailStates.beta + (-1.208634)*sailStates.p + (10.354299)*sailStates.q + (-0.639164)*sailStates.r + (0.000445)*sailStates.de;
	Cm = (-13.524865)*sailStates.alpha + (0.743178)*sailStates.beta + (8.248609)*sailStates.p + (-134.612778)*sailStates.q + (3.010029)*sailStates.r + (-0.067452)*sailStates.de;
	Cn = (0.129794)*sailStates.alpha + (0.016401)*sailStates.beta + (0.293526)*sailStates.p + (-0.526399)*sailStates.q + (-0.023580)*sailStates.r + (-0.000010)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end